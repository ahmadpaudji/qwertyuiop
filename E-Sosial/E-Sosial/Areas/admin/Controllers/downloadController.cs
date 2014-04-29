using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace E_Sosial.Areas.admin.Controllers
{
    public class downloadController : Controller
    {
        private db_esosEntities db = new db_esosEntities();

        //
        // GET: /admin/download/

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Index()
        {
            var download = from table in db.t_download
                           join table2 in db.users
                           on table.user_id equals table2.id_user
                           select new admin.Models.Download
                           {
                               download_id = table.download_id,
                               download_title = table.download_title,
                               download_desc = table.download_desc,
                               download_path = table.download_path,
                               download_date = table.download_date,
                               user = table2.nama
                           };
            return View(download.ToList());
        }

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult download(string url)
        {
            return File(url, "application/pdf,application/doc,application/docx,application/xls,application/xlsx,application/ppt,application/pptx", Server.UrlEncode(url));
        }

        //
        // GET: /admin/download/Details/5

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Details(int id = 0)
        {
            t_download t_download = db.t_download.Find(id);
            if (t_download == null)
            {
                return HttpNotFound();
            }
            return View(t_download);
        }

        //
        // GET: /admin/download/Create

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /admin/download/Create

        [Authorize(Roles="super_admin,admin")]
        [HttpPost]
        public ActionResult Create(admin.Models.DownloadCreate t_download)
        {
            if (ModelState.IsValid)
            {
                using (var db = new db_esosEntities())
                {
                    var create = db.t_download.Create();

                    create.download_date = DateTime.Now;
                    create.download_desc = t_download.download_desc;
                    create.download_title = t_download.download_title;
                    create.user_id = (from table in db.users where table.username == User.Identity.Name select table.id_user).FirstOrDefault();

                    if (t_download.dokumen != null)
                    {
                        if (t_download.dokumen.ContentLength < 3048000)
                        {
                            var fileName = Path.GetFileName(t_download.dokumen.FileName);
                            var ex = Path.GetExtension(fileName);
                            if (ex == ".pdf" || ex == ".xls" || ex == ".xlsx" || ex == ".doc" || ex == ".docx" || ex == ".ppt" || ex == ".pptx")
                            {
                                var path = Path.Combine(Server.MapPath("~/Content/Document"), fileName);
                                t_download.dokumen.SaveAs(path);

                                create.download_path = "~/Content/Document/" + fileName;
                            }
                            else
                            {
                                ModelState.AddModelError("", "File harus berformat (.pdf/.ppt/.pptx/.xls/.xlsx/.doc/.docx)");
                                return View(t_download);
                            }
                        }
                        else
                        {
                            ModelState.AddModelError("", "Ukuran file tidak boleh lebih dari 3 MB");
                            return View(t_download);
                        }
                    }
                    else
                    {
                        ModelState.AddModelError("", "File harus diisi");
                        return View(t_download);
                    }

                    db.t_download.Add(create);
                    db.SaveChanges();

                    return RedirectToAction("Index");
                }
            }
            return View(t_download);
        }

        //
        // GET: /admin/download/Edit/5

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult Edit(int id = 0)
        {
            t_download t_download = db.t_download.Find(id);
            var download = (from table in db.t_download
                            where table.download_id == id
                            select new admin.Models.DownloadUpdate
                            {
                                download_id = table.download_id,
                                download_date = table.download_date,
                                download_desc = table.download_desc,
                                download_title = table.download_title,
                                user_id = table.user_id,
                                dokumen = table.download_path
                            }).FirstOrDefault();
            if (download == null)
            {
                return HttpNotFound();
            }
            return View(download);
        }

        //
        // POST: /admin/download/Edit/5

        [Authorize(Roles = "super_admin,admin")]
        [HttpPost]
        public ActionResult Edit(int id,admin.Models.DownloadCreate t_download)
        {
            if (ModelState.IsValid)
            {
                using (var db = new db_esosEntities())
                {
                    t_download download = db.t_download.Find(id);

                    download.download_date = DateTime.Now;
                    download.download_desc = t_download.download_desc;
                    download.download_title = t_download.download_title;
                    download.user_id = (from table in db.users where table.username == User.Identity.Name select table.id_user).FirstOrDefault();

                    if (t_download.dokumen != null)
                    {
                        if (t_download.dokumen.ContentLength < 3048000)
                        {
                            var fileName = Path.GetFileName(t_download.dokumen.FileName);
                            var ex = Path.GetExtension(fileName);
                            if (ex == ".pdf" || ex == ".xls" || ex == ".xlsx" || ex == ".doc" || ex == ".docx" || ex == ".ppt" || ex == ".pptx")
                            {
                                var path = Path.Combine(Server.MapPath("~/Content/Document"), fileName);
                                t_download.dokumen.SaveAs(path);

                                download.download_path = "~/Content/Document/" + fileName;
                            }
                            else
                            {
                                ModelState.AddModelError("", "File harus berformat (.pdf/.ppt/.pptx/.xls/.xlsx/.doc/.docx)");
                                return View(t_download);
                            }
                        }
                        else
                        {
                            ModelState.AddModelError("", "Ukuran file tidak boleh lebih dari 3 MB");
                            return View(t_download);
                        }
                    }

                    db.SaveChanges();

                    return RedirectToAction("Index");
                }
            }
            return View(t_download);
        }

        //
        // GET: /admin/download/Delete/5

        [Authorize(Roles = "super_admin")]
        public ActionResult Delete(int id = 0)
        {
            t_download t_download = db.t_download.Find(id);
            db.t_download.Remove(t_download);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        //
        // POST: /admin/download/Delete/5

        [Authorize(Roles = "super_admin")]
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            t_download t_download = db.t_download.Find(id);
            db.t_download.Remove(t_download);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}