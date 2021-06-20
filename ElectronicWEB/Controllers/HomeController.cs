using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ElectronicWEB.Models;
using PagedList;
using System.Data.Entity;


namespace ElectronicWEB.Controllers
{
    public class HomeController : Controller
    {
        readonly DienTuModel db = new DienTuModel();

        private const string CartSession = "CartSession";
        public ActionResult Index()
        {
            var productDao = new ShoppingCart();
            ViewBag.NewProduct = productDao.ListNewProduct(10);
            return View();
        }
        
        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Login()
        {
            return View();
        }

        /// <summary>
        /// Login
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Admin()
        {
            string us = Request.Form["us"];
            string mk = Request.Form["mk"];

            #region admin login
            var admin = db.ADMINS.Where(a => a.TenLOGIN.ToLower() == us.ToLower()).Where(a => a.MatKhau == mk).FirstOrDefault();
            if (admin != null)
            {
                Session["username"] = us;
                HttpContext.Session["username"] = us;
                return View();
            }
            #endregion

            #region client login

            var client = db.CLIENTS.Where(c => c.TenLOGIN.ToLower() == us.ToLower()).Where(c => c.MatKhau == mk).FirstOrDefault();
            if (client != null)
            {
                Session["client"] = us;
                return Redirect("/Home");
            }

            #endregion

            TempData["msg"] = "Tài khoản hoặc mật khẩu không chính xác !";
            return RedirectToAction("/Login");
        }

        
        public ActionResult DashBoard()
        {
            return View();
        }
        public ActionResult Widgets()
        {
            return View();
        }
        public ActionResult Categories(int? page)
        {
            if (page == null) page = 1;
            var sANPHAMs = (from l in db.SANPHAMs
                            select l).OrderBy(x => x.MaSP);
            int pageSize = 9;
            int pageNumber = (page ?? 1);
            return View(sANPHAMs.ToPagedList(pageNumber, pageSize));
        }
        public ActionResult SanPham123()
        {
            return View();
        }
        public PartialViewResult HeaderCart()
        {
            var cart = Session[CartSession];
            var list = new List<Item>();
            if (cart != null)
            {
                list = (List<Item>)cart;
            }

            return PartialView(list);
        }

        /// <summary>
        /// Tìm kiếm sản phẩm theo tên, giá
        /// </summary>
        /// <param name="page"></param>
        /// <param name="search"></param>
        /// <param name="min_price"></param>
        /// <param name="max_price"></param>
        /// <returns></returns>
        [HttpGet]
        public ActionResult Search(int? page, string search, float? min_price, float? max_price, string type = "")
        {
            if (page == null) page = 1;
            int pageSize = 5;

            //var lst = db.SANPHAMs
            //    .Include(lh => lh.LOAIHANG)
            //    .Where(item => item.LOAIHANG.TenLH.ToLower() == type.ToLower())
            //    .Include(hsx => hsx.HANG_SX)
            //    .Where(tsp => tsp.TenSP.Contains(search))
            //    .Where(p => p.Gia.Value >= min_price)
            //    .Where(p => p.Gia.Value <= max_price)
            //    .ToList();


            var lst = db.SANPHAMs
              .Include(lh => lh.LOAIHANG).Include(hsx => hsx.HANG_SX);

            if (!string.IsNullOrEmpty(search))
            {
                lst = lst.Where(product => product.TenSP.Contains(search));
            }

            if (!string.IsNullOrEmpty(type))
            {
                lst = lst.Where(product => product.LOAIHANG.TenLH == type);
            }

            if (min_price > 0)
            {
                lst = lst.Where(product => product.Gia >= min_price);
            }

            if (max_price > 0)
            {
                lst = lst.Where(product => product.Gia <= max_price);
            }

            return View("Categories", lst.OrderByDescending(product => product.MaSP).ToPagedList((int)page, pageSize));
        }
    }
}