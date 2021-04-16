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
        DienTuModel db = new DienTuModel();
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

        [HttpPost]
        public ActionResult Admin()
        {
            DienTuModel db = new DienTuModel();

            string us = Request.Form["us"];
            string mk = Request.Form["mk"];

            foreach (var i in db.ADMINS)
            {
                if (i.TenLOGIN.ToString().Equals(us) && i.MatKhau.ToString().Equals(mk))
                {
                    Session["username"] = us;
                    return View();
                }
            }
            TempData["msg"] = "Tài khoản hoặc mật khẩu không chính xác !";
            return RedirectToAction("/Login");
            //string us = Request.Form["us"];
            //string mk = Request.Form["mk"];

            //string u = "admin";
            //string m = "admin";

            //if (u.Equals(us) && m.Equals(mk))
            //{
            //    return View();
            //}
            //else
            //{
            //    TempData["msg"] = "Tài Khoản Hoặc Mật Khẩu Không Chính Xác";
            //    return RedirectToAction("/Login");
            //}
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
        public ActionResult Search(int? page, string search)
        {
            if (page == null) page = 1;
            int pageSize = 5;
            int pageNumber = (page ?? 1);

            var lst = db.SANPHAMs.Include(lh => lh.LOAIHANG).Include(hsx => hsx.HANG_SX).Where(tsp => tsp.TenSP.Contains(search)).ToList();

            return View("Categories", lst.ToPagedList(pageNumber, pageSize));
        }
    }
}