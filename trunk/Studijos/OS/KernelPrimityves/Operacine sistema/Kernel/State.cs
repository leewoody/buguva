﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ConsoleApplication1
{
    public enum State 
    { 
        blocked, 
        blockedSuspended, 
        ready, 
        readySuspended,
        running
    }
}