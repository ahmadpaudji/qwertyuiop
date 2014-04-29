using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace E_Sosial.Areas.admin.Models
{
    public class Bencana
    {
        public long bencanaId { get; set; }
        public string pelapor { get; set; }
        public string wilayah { get; set; }
        public System.DateTime tanggal { get; set; }
    }
}