using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace E_Sosial.Controllers
{
    public class WilayahFrontController : Controller
    {
        private db_esosEntities db = new db_esosEntities();

        //
        // GET: /WilayahFront/

        public ActionResult Index(string id)
        {
            return RedirectToAction("Index","Beranda");
        }

        public ActionResult Wilayah(string id)
        {
            var wilayah = (from table in db.t_wilayah
                           where table.wil_type == id
                           select new Models.wilayah
                           {
                               nama = table.wil_name,
                               alamat = table.wil_address,
                               telepon = table.wil_phone,
                               link = table.web_url
                           }).ToList();
            ViewBag.wilayah = id;
            return View(wilayah);
        }

    }
}
