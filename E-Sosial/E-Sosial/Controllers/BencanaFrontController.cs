using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace E_Sosial.Controllers
{
    public class BencanaFrontController : Controller
    {
        private db_esosEntities db = new db_esosEntities();

        //
        // GET: /BencanaFront/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult BencanaList()
        {
            var list = (from table in db.t_report
                        join table2 in db.t_wilayah
                        on table.wil_id equals table2.wil_id
                        select new Models.bencana
                        {
                            id = (int)table.report_id,
                            isi = table.report_content,
                            lokasi = table2.wil_name
                        }).ToList();

            return View(list);
        }

    }
}
