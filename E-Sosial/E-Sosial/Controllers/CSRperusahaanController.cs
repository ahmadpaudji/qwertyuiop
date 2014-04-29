using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace E_Sosial.Controllers
{
    public class CSRperusahaanController : Controller
    {
        private db_esosEntities db = new db_esosEntities();

        //
        // GET: /CSRperusahaan/

        public ActionResult Index()
        {
            var csr = (from table in db.t_csr_ph
                       select new Models.csr
                       {
                           ph = table.csr_ph_name,
                           alamat = table.csr_ph_address,
                           kegiatan = table.csr_ph_activity
                       }).ToList();
            return View(csr);
        }

    }
}
