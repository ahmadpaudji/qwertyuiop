using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace E_Sosial.Areas.admin.Models
{
    public class BidangUpdate
    {
        public int bidang_id { get; set; }
        public int user_id { get; set; }
        public string bidang_title { get; set; }
        public string bidang_name { get; set; }
        public string gambar_pj { get; set; }
        public string bidang_desc { get; set; }
        public System.DateTime bidang_date { get; set; }
        public string gambar_des { get; set; }
    }
}