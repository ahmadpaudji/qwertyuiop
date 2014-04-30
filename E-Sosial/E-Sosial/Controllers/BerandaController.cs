using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace E_Sosial.Controllers
{
    public class BerandaController : Controller
    {
        private db_esosEntities db = new db_esosEntities();

        //
        // GET: /Beranda/

        public ActionResult Index()
        {
            var berita = (from table in db.t_news
                          join table2 in db.users
                          on table.user_id equals table2.id_user
                          join table3 in db.t_file
                          on table.news_id equals table3.file_parent
                          from table4 in db.t_report
                          join table5 in db.t_wilayah
                          on table4.wil_id equals table5.wil_id
                          orderby table.news_date descending
                          select new Models.beranda
                          {
                              id_berita = table.news_id,
                              date = table.news_date,
                              gambar = table3.file_url,
                              judul = table.news_title,
                              konten = table.news_content,
                              user = table2.nama,
                              id_bencana = (int)table4.report_id,
                              keterangan = table4.report_content,
                              wilayah = table5.wil_name
                          }).ToList().Skip(0).Take(2);
            return View(berita);
        }
    }
}
