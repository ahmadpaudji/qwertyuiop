using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace E_Sosial.Areas.admin.Models
{
    public class Bidang
    {
        public int bidang_id { get; set; }
        public string bidang_title { get; set; }
        public string bidang_name { get; set; }
        public System.DateTime bidang_date { get; set; }
        public string user { get; set; }
    }
}