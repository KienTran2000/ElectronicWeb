using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using ElectronicWEB.Models;
namespace ElectronicWEB.Controllers
{
    public class CartController : Controller
    {
        
        private const string CartSession = "CartSession";
        // GET: Cart
        
        public ActionResult Index()
        {
            var cart = Session[CartSession];
            var list = new List<Item>();
            if (cart != null)
            {
                list = (List<Item>)cart;
            }
            return View(list);
        }
        
        public JsonResult DeleteAll()
        {
            Session[CartSession] = null;
            return Json(new
            {
                status = true
            });
        }

        public JsonResult Delete(long id)
        {
            var sessionCart = (List<Item>)Session[CartSession];
            sessionCart.RemoveAll(x =>x.Product.MaSP==id);
            Session[CartSession] = sessionCart;
            return Json(new
            {
                status = true
            });
        }
        public JsonResult Update(string cartModel)
        {
            var jsonCart = new JavaScriptSerializer().Deserialize<List<Item>>(cartModel);
            var sessionCart = (List<Item>)Session[CartSession];

            foreach (var item in sessionCart)
            {
                var jsonItem = jsonCart.SingleOrDefault(x => x.Product.MaSP == item.Product.MaSP);
                if (jsonItem != null)
                {
                    item.Quantity = jsonItem.Quantity;
                }
            }
            Session[CartSession] = sessionCart;
            return Json(new
            {
                status = true
            });
        }
        
        public ActionResult AddItem(int productId, int quantity)
        {
            var product = new SANPHAM().ViewDetail(productId);
            var cart = Session[CartSession];
            if (cart != null)
            {
                var list = (List<Item>)cart;
                if (list.Exists(x => x.Product.MaSP == productId))
                {

                    foreach (var item in list)
                    {
                        if (item.Product.MaSP == productId)
                        {
                            item.Quantity += quantity;
                        }
                    }
                }
                else
                {
                    //tạo mới đối tượng cart item
                    var item = new Item();
                    item.Product = product;
                    item.Quantity = quantity;
                    list.Add(item);
                }
                //Gán vào session
                Session[CartSession] = list;
            }
            else
            {
                //tạo mới đối tượng cart item
                var item = new Item();
                item.Product = product;
                item.Quantity = quantity;
                var list = new List<Item>();
                list.Add(item);
                //Gán vào session
                Session[CartSession] = list;
            }
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult Payment()
        {
            var cart = Session[CartSession];
            var list = new List<Item>();
            if (cart != null)
            {
                list = (List<Item>)cart;
            }
            return View(list);
        }

        [HttpPost]
        public ActionResult Payment(string HoTen, string SDT, string DiaChi, string Email)
        {
            DienTuModel db = new DienTuModel();
            List<Item> list = (List<Item>)Session[CartSession];
            var hd = new HOADON();
            {
                hd.TenKH = HoTen;
                hd.SDT = SDT;
                hd.DiaChi = DiaChi;
                hd.NgayDatHang = DateTime.Now;
                hd.Email = Email;
                
            }
            db.HOADONs.Add(hd);
            db.SaveChanges();

            foreach (Item item in list)
            {
                var cthd = new CHITIET_HOADON();
                {
                    cthd.MaHD = hd.MaHD;
                    cthd.MaSP = item.Product.MaSP;
                    
                    cthd.SoLuong = item.Quantity;
                    cthd.DonGia = item.Product.Gia;
                };
                db.CHITIET_HOADON.Add(cthd);
                db.SaveChanges();
            }
            // 3. Xóa session giỏ hàng:
            DeleteAll();
            return RedirectToAction("Success");
            
        }
        public ActionResult Success()
        {
            return View();
        }
    }
}