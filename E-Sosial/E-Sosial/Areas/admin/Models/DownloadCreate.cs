using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace E_Sosial.Areas.admin.Models
{
    public class DownloadCreate
    {
        [Key]
        public int download_id { get; set; }
        [Required(ErrorMessage = "Judul harus diisi")]
        public string download_title { get; set; }
        public string download_desc { get; set; }
        public System.DateTime download_date { get; set; }
        public int user_id { get; set; }
        public HttpPostedFileBase dokumen { get; set; }
    }
}