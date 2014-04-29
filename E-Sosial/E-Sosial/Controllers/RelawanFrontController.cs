using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace E_Sosial.Controllers
{
    public class RelawanFrontController : Controller
    {
        private db_esosEntities db = new db_esosEntities();

        //
        // GET: /Relawan/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult peserta()
        {
            var peserta = (from table in db.t_volunteer
                           select new Models.relawan 
                           {
                               nama = table.vol_name,
                               email = table.vol_email,
                               hp = table.vol_phone
                           }).ToList();
            return View(peserta);
        }

    }
}
