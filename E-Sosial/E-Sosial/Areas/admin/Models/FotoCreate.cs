using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace E_Sosial.Areas.admin.Models
{
    public class FotoCreate
    {
        [Key]
        public int dokumentasi_id { get; set; }
        public int album_id { get; set; }
        public HttpPostedFileBase dokumentasi_path { get; set; }
        [Required(ErrorMessage="Judul harus diisi")]
        public string dokumentasi_title { get; set; }
        public string dokumentasi_type { get; set; }
        public System.DateTime dokumentasi_date { get; set; }
    }
}