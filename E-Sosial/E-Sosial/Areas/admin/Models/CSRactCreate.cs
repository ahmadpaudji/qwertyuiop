using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace E_Sosial.Areas.admin.Models
{
    public class CSRactCreate
    {
        [Key]
        public int csr_activity_id { get; set; }
        public int user_id { get; set; }
        public int csr_ph_id { get; set; }
        [Required(ErrorMessage="Konten harus diisi")]
        [AllowHtml]
        public string csr_activity_content { get; set; }
        public System.DateTime csr_activity_date { get; set; }

        public HttpPostedFileBase gambar { get; set; }
    }
}