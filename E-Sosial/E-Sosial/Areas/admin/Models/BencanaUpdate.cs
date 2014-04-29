using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace E_Sosial.Areas.admin.Models
{
    public class BencanaUpdate
    {
        public long report_id { get; set; }
        public string report_author { get; set; }
        public long wil_id { get; set; }
        public string address { get; set; }
        public string phone { get; set; }
        public string report_content { get; set; }
        public System.DateTime report_time { get; set; }

        public string gambar { get; set; }
    }
}