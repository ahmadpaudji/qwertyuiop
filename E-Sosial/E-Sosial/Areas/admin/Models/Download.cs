using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace E_Sosial.Areas.admin.Models
{
    public class Download
    {
        public int download_id { get; set; }
        public string download_title { get; set; }
        public string download_path { get; set; }
        public string download_desc { get; set; }
        public System.DateTime download_date { get; set; }
        public string user { get; set; }
    }
}