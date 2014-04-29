using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace E_Sosial.Controllers
{
    public class UnduhController : Controller
    {
        private db_esosEntities db = new db_esosEntities();

        //
        // GET: /Unduh/

        public ActionResult Index()
        {
            var download = (from table in db.t_download
                            select new Models.unduh
                            {
                                nama = table.download_title,
                                keterangan = table.download_desc,
                                url = table.download_path
                            }).ToList();
            return View(download);
        }

        public ActionResult download(string url)
        {
            return File(url, "application/pdf,application/doc,application/docx,application/xls,application/xlsx,application/ppt,application/pptx", Server.UrlEncode(url));
        }
    }
}
