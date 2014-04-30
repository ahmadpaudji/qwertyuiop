using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace E_Sosial.Controllers
{
    public class ProsedurFrontController : Controller
    {
        private db_esosEntities db = new db_esosEntities();

        //
        // GET: /ProsedurFront/

        public ActionResult Index()
        {
            return RedirectToAction("Index", "Beranda");
        }

        public ActionResult Prosedur(string id)
        {
            var prosedur = (from table in db.t_content
                            where table.content_name == id && table.content_type == "Prosedur"
                            join table2 in db.users
                            on table.user_id equals table2.id_user
                            select new Models.prosedur
                            {
                                nama = table.content_name,
                                isi = table.content,
                                user = table2.nama,
                                tanggal = table.content_time
                            }).FirstOrDefault();
            var idProsedur = (from table in db.t_content where table.content_name == id select table.content_id).FirstOrDefault();
            ViewBag.gambar = (from table in db.t_file where table.file_parent == idProsedur && table.file_category == "ProsedurGambar" select table.file_url).FirstOrDefault();
            ViewBag.file = (from table in db.t_file where table.file_parent == idProsedur && table.file_category == "ProsedurFile" select table.file_url).FirstOrDefault();
            return View(prosedur);
        }

        public ActionResult download(string id)
        {
            return File(id, "application/pdf,application/doc,application/docx,application/xls,application/xlsx,application/ppt,application/pptx", Server.UrlEncode(id));
        }

        [ChildActionOnly]
        public ActionResult ProsedurList()
        {
            var list = (from table in db.t_content
                        where table.content_type == "Prosedur"
                        select new Models.prosedur
                        {
                            nama = table.content_name
                        }).ToList();
            return View(list);
        }

    }
}
