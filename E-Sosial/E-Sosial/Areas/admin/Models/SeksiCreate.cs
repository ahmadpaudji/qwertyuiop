using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace E_Sosial.Areas.admin.Models
{
    public class SeksiCreate
    {
        [Key]
        public int seksi_id { get; set; }
        public int user_id { get; set; }
        [Required(ErrorMessage="Bagian seksi harus diisi")]
        public string seksi_title { get; set; }
        [Required(ErrorMessage="Penanggung jawab harus diisi")]
        public string seksi_name { get; set; }
        public HttpPostedFileBase seksi_foto { get; set; }
        [Required(ErrorMessage="Deskripsi bagian seksi harus diisi")]
        [AllowHtml]
        public string seksi_description { get; set; }
        public System.DateTime seksi_date { get; set; }
        public HttpPostedFileBase seksi_desc_foto { get; set; }
        public int bidang_id { get; set; }
    }
}