using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ElectronicWEB.Models;

namespace ElectronicWEB.Controllers
{
    public class ChiTietHoaDonController : Controller
    {
        private DienTuModel db = new DienTuModel();

        // GET: CHITIET_HOADON
        public ActionResult Index()
        {
            var cHITIET_HOADON = db.CHITIET_HOADON.Include(c => c.HOADON).Include(c => c.SANPHAM);
            return View(cHITIET_HOADON.ToList());
        }
    }
}
