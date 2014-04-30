using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace E_Sosial.Controllers
{
    public class BidangFrontController : Controller
    {
        private db_esosEntities db = new db_esosEntities();

        //
        // GET: /BidangFront/

        public ActionResult Index()
        {

            return RedirectToAction("Index","Beranda");
        }

        public ActionResult Bidang(string id)
        {
            var bidang = (from table in db.t_bidang
                          where table.bidang_title == id
                          select new Models.bidangFront
                          {
                              id = table.bidang_id,
                              foto = table.bidang_person_foto,
                              isi = table.bidang_desc,
                              judul = table.bidang_title,
                              pj = table.bidang_name,
                              gambar = table.bidang_desc_foto
                          }).FirstOrDefault();
            return View(bidang);
        }

        [ChildActionOnly]
        public ActionResult BidangList()
        {
            var list = (from table in db.t_bidang
                        select new Models.bidangFront
                        {
                            judul = table.bidang_title
                        }).ToList();

            return View(list);
        }

    }
}
