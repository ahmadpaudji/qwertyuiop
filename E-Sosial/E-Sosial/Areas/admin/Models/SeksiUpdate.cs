﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace E_Sosial.Areas.admin.Models
{
    public class SeksiUpdate
    {
        public int seksi_id { get; set; }
        public string user { get; set; }
        public string seksi_title { get; set; }
        public string seksi_name { get; set; }
        public string seksi_foto { get; set; }
        public string seksi_description { get; set; }
        public System.DateTime seksi_date { get; set; }
        public string seksi_desc_foto { get; set; }
        public string bidang{ get; set; }

    }
}