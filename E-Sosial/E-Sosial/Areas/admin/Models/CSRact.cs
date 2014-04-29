using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace E_Sosial.Areas.admin.Models
{
    public class CSRact
    {
        public int csr_activity_id { get; set; }
        public string user { get; set; }
        public string csr_activity_name { get; set; }
        public string csr_name { get; set; }
        public System.DateTime csr_activity_date { get; set; }
    }
}