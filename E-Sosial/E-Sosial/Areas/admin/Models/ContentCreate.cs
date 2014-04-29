using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;

namespace E_Sosial.Areas.admin.Models
{
    public class ContentCreate
    {
        [Key]
        public long content_id { get; set; }
        [Required(ErrorMessage = "Nama prosedur harus diisi")]
        public string content_name { get; set; }
        public string content_type { get; set; }
        [Required(ErrorMessage = "Konten harus diisi")]
        [AllowHtml]
        public string content { get; set; }
        public long user_id { get; set; }
        public string url { get; set; }
        public System.DateTime content_time { get; set; }

        public HttpPostedFileBase gambar { get; set; }
        public HttpPostedFileBase file { get; set; }
    }
}