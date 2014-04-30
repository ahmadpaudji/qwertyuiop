using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace E_Sosial.Controllers
{
    public class BeritaFrontController : Controller
    {
        private db_esosEntities db = new db_esosEntities();

        //
        // GET: /BeritaFront/

        public ActionResult Index()
        {
            var berita = (from table in db.t_news
                          join table2 in db.t_file
                          on table.news_id equals table2.file_parent
                          join table3 in db.users
                          on table.user_id equals table3.id_user
                          select new Models.berita
                          {
                              id = table.news_id,
                              gambar = table2.file_url,
                              isi = table.news_content,
                              judul = table.news_title,
                              tanggal = table.news_date,
                              user = table3.nama
                          }).ToList();
            return View(berita);
        }

        public ActionResult BeritaKatList()
        {
            var list = (from table in db.t_news_category
                        select new Models.BeritaKat
                        {
                            id = (int)table.news_category_id,
                            kategori = table.category_title
                        }).ToList();
            return View(list);
        }

    }
}
