using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ElectronicWEB.Models;
using PagedList;

namespace ElectronicWEB.Controllers
{
    public class SanPhamController : Controller
    {
        private DienTuModel db = new DienTuModel();

        // GET: SanPham
        public ActionResult Index(int? page)
        {
            if (page == null) page = 1;
            var sANPHAMs = (from l in db.SANPHAMs
                            select l).OrderBy(x => x.MaSP);
            int pageSize = 3;
            int pageNumber = (page ?? 1);
            return View(sANPHAMs.ToPagedList(pageNumber, pageSize));
        }

        // GET: SanPham/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SANPHAM sANPHAM = db.SANPHAMs.Find(id);
            if (sANPHAM == null)
            {
                return HttpNotFound();
            }
            return View(sANPHAM);
        }

        // GET: SanPham/Create
        public ActionResult Create()
        {
            ViewBag.MaSP = new SelectList(db.GIOHANGs, "MaSP", "MaSP");
            ViewBag.MaHSX = new SelectList(db.HANG_SX, "MaHSX", "TenHSX");
            ViewBag.MaLH = new SelectList(db.LOAIHANGs, "MaLH", "TenLH");
            return View();
        }

       /// <summary>
       /// 
       /// </summary>
       /// <param name="sANPHAM"></param>
       /// <param name="UploadImage"></param>
       /// <returns></returns>
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaSP,TenSP,Gia,NgaySX,TinhTrang,Photo,MaLH,MaHSX")] SANPHAM sANPHAM, HttpPostedFileBase UploadImage)
        {
            if (ModelState.IsValid)
            {
                if (UploadImage != null)
                {
                    if (UploadImage.ContentType == "image/jpg" || UploadImage.ContentType == "image/png" || UploadImage.ContentType == "image/jpeg")

                    {
                        UploadImage.SaveAs(Server.MapPath("/") + "/Content/" + UploadImage.FileName);
                        sANPHAM.Photo = UploadImage.FileName;
                    }
                }

                db.SANPHAMs.Add(sANPHAM);
                db.SaveChanges();

                TempData["message"] = "Created successfully.";
                return RedirectToAction("Index");
            }

            ViewBag.MaSP = new SelectList(db.GIOHANGs, "MaSP", "MaSP", sANPHAM.MaSP);
            ViewBag.MaHSX = new SelectList(db.HANG_SX, "MaHSX", "TenHSX", sANPHAM.MaHSX);
            ViewBag.MaLH = new SelectList(db.LOAIHANGs, "MaLH", "TenLH", sANPHAM.MaLH);
            return View(sANPHAM);
        }

       /// <summary>
       /// 
       /// </summary>
       /// <param name="id"></param>
       /// <returns></returns>
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SANPHAM sANPHAM = db.SANPHAMs.Find(id);
            if (sANPHAM == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaSP = new SelectList(db.GIOHANGs, "MaSP", "MaSP", sANPHAM.MaSP);
            ViewBag.MaHSX = new SelectList(db.HANG_SX, "MaHSX", "TenHSX", sANPHAM.MaHSX);
            ViewBag.MaLH = new SelectList(db.LOAIHANGs, "MaLH", "TenLH", sANPHAM.MaLH);
            return View(sANPHAM);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sANPHAM"></param>
        /// <param name="UploadImage"></param>
        /// <returns></returns>
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaSP,TenSP,Gia,NgaySX,TinhTrang,MaLH,MaHSX")] SANPHAM sANPHAM, HttpPostedFileBase UploadImage)
        {
            if (ModelState.IsValid)
            {
                if (UploadImage != null)
                {
                    if (UploadImage.ContentType == "image/jpg" || UploadImage.ContentType == "image/png" || UploadImage.ContentType == "image/jpeg")
                    {
                        UploadImage.SaveAs(Server.MapPath("/") + "/Content/" + UploadImage.FileName);
                        sANPHAM.Photo = UploadImage.FileName;
                    }
                }

                db.Entry(sANPHAM).State = EntityState.Modified;
                db.SaveChanges();

                TempData["message"] = "Updated successfully.";
                return RedirectToAction("Index");
            }
            ViewBag.MaSP = new SelectList(db.GIOHANGs, "MaSP", "MaSP", sANPHAM.MaSP);
            ViewBag.MaHSX = new SelectList(db.HANG_SX, "MaHSX", "TenHSX", sANPHAM.MaHSX);
            ViewBag.MaLH = new SelectList(db.LOAIHANGs, "MaLH", "TenLH", sANPHAM.MaLH);
            return View(sANPHAM);
        }

        // GET: SanPham/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SANPHAM sANPHAM = db.SANPHAMs.Find(id);
            if (sANPHAM == null)
            {
                return HttpNotFound();
            }
            return View(sANPHAM);
        }

        // POST: SanPham/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            try
            {
                GIOHANG cart = db.GIOHANGs.Where(c => c.MaSP == id).FirstOrDefault();

                if (cart != null)
                    db.GIOHANGs.Remove(cart);

                CHITIET_HOADON order = db.CHITIET_HOADON.Where(o => o.MaSP == id).FirstOrDefault();

                if (order != null)
                    db.CHITIET_HOADON.Remove(order);

                SANPHAM product = db.SANPHAMs.Find(id);

                db.SANPHAMs.Remove(product);

                db.SaveChanges();

                return RedirectToAction("Index");
            }
            catch (Exception exception)
            {
                TempData["message"] = exception.Message;
                TempData["type"] = "error";
                return RedirectToAction("Index");
            }
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        /// <summary>
        /// Tìm kiếm sản phẩm
        /// </summary>
        /// <param name="page"></param>
        /// <param name="search"></param>
        /// <returns></returns>
        public ActionResult Search(int? page, string search)
        {
            if (page == null) page = 1;
            int pageSize = 5;
            int pageNumber = (page ?? 1);

            var lst = db.SANPHAMs.Include(lh => lh.LOAIHANG).Include(hsx => hsx.HANG_SX).Where(tsp => tsp.TenSP.Contains(search)).ToList();

            return View("Index", lst.ToPagedList(pageNumber, pageSize));
        }
    }
}
