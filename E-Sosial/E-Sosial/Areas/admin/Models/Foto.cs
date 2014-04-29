using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace E_Sosial.Areas.admin.Models
{
    public class Foto
    {
        public int dokumentasi_id { get; set; }
        public string album { get; set; }
        public string dokumentasi_title { get; set; }
        public string dokumentasi_type { get; set; }
        public System.DateTime dokumentasi_date { get; set; }
        public string dokumentasi_path { get; set; }
    }
}