using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace E_Sosial.Areas.admin.Controllers
{
    public class adminController : Controller
    {
        private db_esosEntities db = new db_esosEntities();

        //
        // GET: /admin/admin/

        [AllowAnonymous]
        [HttpGet]
        public ActionResult Index(string returnUrl)
        {
            return View();
        }

        [AllowAnonymous]
        [HttpPost]
        public ActionResult Index(Models.adminModel admin, string returnUrl)
        {
            if (admin.username != null && admin.password != null)
            {
                if (isValid(admin.username, admin.password))
                {
                    Roles.GetRolesForUser();
                    FormsAuthentication.SetAuthCookie(admin.username, false);

                    if (returnUrl != null)
                    {
                        return Redirect(returnUrl);
                    }
                    else
                    {
                        return RedirectToAction("Index", "content");
                    }
                }
                else
                {
                    ViewBag.error = 'y';
                }
            }
            return View(admin);
        }

        [Authorize(Roles = "super_admin")]
        [HttpGet]
        public ActionResult Registration()
        {
            ViewBag.role = new SelectList(db.roles.ToList(), "id_roles", "roles");
            return View();
        }

        [Authorize(Roles = "super_admin")]
        [HttpPost]
        public ActionResult Registration(Models.adminModel admin)
        {
            if (ModelState.IsValid)
            {
                if (admin.password == admin.retype_password)
                {
                    var user = db.users.FirstOrDefault(u => u.username == admin.username);
                    if (user == null)
                    {
                        using (db)
                        {
                            var crypto = new SimpleCrypto.PBKDF2();
                            var enkripPassword = crypto.Compute(admin.password);
                            var create = db.users.Create();
                            var roles = db.detail_roles.Create();

                            create.username = admin.username;
                            create.user_password = enkripPassword;
                            create.user_passwordsalt = crypto.Salt;
                            create.nama = admin.nama;
                            create.hp = admin.hp;
                            create.email = admin.email;
                            create.alamat = admin.alamat;
                            create.tanggal = DateTime.Now;

                            db.users.Add(create);
                            db.SaveChanges();

                            roles.id_roles = admin.id_roles;
                            roles.id_user = (from table in db.users where table.username == admin.username select table.id_user).FirstOrDefault();

                            db.detail_roles.Add(roles);
                            db.SaveChanges();

                            return RedirectToAction("Index", "admin");
                        }
                    }
                    else
                    {
                        ViewBag.role = new SelectList(db.roles.ToList(), "id_roles", "roles");
                        ViewBag.errorUsername = 'y';
                        return View(admin);
                    }
                }
                else
                {
                    ViewBag.role = new SelectList(db.roles.ToList(), "id_roles", "roles");
                    ViewBag.errorPassword = 'y';
                    return View(admin);
                }
            }
            else
            {
                ViewBag.role = new SelectList(db.roles.ToList(), "id_roles", "roles");
                ViewBag.error = 'y';
                return View(admin);
            }
        }

        [Authorize(Roles = "super_admin,admin")]
        public ActionResult LogOut()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index", "admin");
        }

        [AllowAnonymous]
        private bool isValid(string username, string password)
        {
            var crypto = new SimpleCrypto.PBKDF2();
            bool isValid = false;

            using (var db = new db_esosEntities())
            {
                var user = db.users.FirstOrDefault(u => u.username == username);

                if (user != null)
                {
                    if (user.user_password == crypto.Compute(password, user.user_passwordsalt))
                    {
                        isValid = true;
                    }
                }
            }
            return isValid;
        }
    }
}
