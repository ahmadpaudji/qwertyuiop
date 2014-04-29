using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace E_Sosial.Areas.admin.Controllers
{
    public class uploadController : Controller
    {
        //
        // GET: /admin/upload/
        db_esosEntities db = new db_esosEntities();

        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(admin.Models.Upload upload)
        {
            if (upload.file.ContentLength > 0)
            {
                var fileName = Path.GetFileName(upload.file.FileName);
                var ext = Path.GetExtension(upload.file.ContentType.ToString());
                var path = Path.Combine(Server.MapPath("~/Areas"), fileName);
                upload.file.SaveAs(path);

                using (db)
                {
                    var create = db.t_file.Create();

                    create.file_category = "0";
                    create.file_location = path;
                    create.file_name = fileName;
                    create.file_parent = 0;
                    create.file_title = fileName;
                    create.file_url = "~/Areas/" + fileName;
                    create.mime_type = ext;
                    create.user_id = 3;

                    db.t_file.Add(create);
                    db.SaveChanges();
                }
            }

            return RedirectToAction("Index");
        }

    }
}
