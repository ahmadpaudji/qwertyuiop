using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace E_Sosial.Controllers
{
    public class KesejahteraanController : Controller
    {
        private db_esosEntities db = new db_esosEntities();

        //
        // GET: /Kesejahteraan/

        public ActionResult Index(string id)
        {
            var sejahtera = (from table in db.t_kesejahteraan
                             where table.ks_type == id
                             join table2 in db.t_satuan
                             on table.ks_satuan equals table2.id_satuan
                             select new Models.kesejahteraan
                             {
                                 nama = table.ks_name,
                                 jumlah = table.ks_jumlah,
                                 satuan = table2.satuan
                             }).ToList();
            ViewBag.tipe = id;
            return View(sejahtera);
        }

    }
}
