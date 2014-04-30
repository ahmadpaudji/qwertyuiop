using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace E_Sosial.Controllers
{
    public class SeksiFrontController : Controller
    {
        private db_esosEntities db = new db_esosEntities();

        //
        // GET: /SeksiFront/

        public ActionResult Index()
        {
            return RedirectToAction("Index","Beranda");
        }

        public ActionResult Seksi(string id)
        {
            var seksi = (from table in db.t_seksi
                         where table.seksi_title == id
                         select new Models.seksi
                         {
                             judul = table.seksi_title,
                             isi = table.seksi_description,
                             foto = table.seksi_foto,
                             gambar = table.seksi_desc_foto,
                             pj = table.seksi_name
                         }).FirstOrDefault();
            return View(seksi);
        }

        [ChildActionOnly]
        public ActionResult SeksiList(int id)
        {
            var list = (from table in db.t_seksi
                        where table.bidang_id == id
                        select new Models.seksi
                        {
                            judul=table.seksi_title
                        }).ToList();
            return View(list);
        }
    }
}
