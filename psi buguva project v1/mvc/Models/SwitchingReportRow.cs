﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;

namespace mvc.Models
{
    public class SwitchingReportRow 
    {
        private string _period = "";
        private int _swsum = 0;

        public string Period
        {
            get
            {
                return _period;
            }
            set
            {
                _period = value;
            }
        }

        public int Swsums
        {
            get
            {
                return _swsum;
            }
            set
            {
                _swsum = value;
            }
        }
    }
}