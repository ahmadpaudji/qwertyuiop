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

        public ActionResult Index(string id)
        {
            var bidang = (from table in db.t_bidang
                          where table.bidang_title == id
                          select new Models.bidangFront 
                          {
                              gambar = table.bidang_person_foto,
                              isi = table.bidang_desc,
                              judul = table.bidang_title,
                              pj = table.bidang_name
                          }).FirstOrDefault();
            return View(bidang);
        }

    }
}
