﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;

namespace mvc.Models
{
    public class AssociatedWorkedHours
    {
        private int _hours = 0;
        private string _title = "";
        public int Hours
        {
            get
            {
                return _hours;
            }
            set
            {
                _hours = value;
            }
        }

        public string Title
        {
            get
            {
                return _title;
            }
            set
            {
                _title = value;
            }
        }

        public AssociatedWorkedHours(string title, int hours)
        {
            Title = title;
            Hours = hours;
        }
        
    }

    public class Period
    {
        private MonthOfYear _start;
        private MonthOfYear _end;

        private MonthOfYear PeriodStart
        {
            get
            {
                return _start;
            }
            set
            {
                _start = value;
            }
        }

        private MonthOfYear PeriodEnd
        {
            get
            {
                return _end;
            }
            set
            {
                _end = value;
            }
        }

        public Period(MonthOfYear start, MonthOfYear end)
        {
            PeriodStart = start;
            PeriodEnd = end;
        }

        public Period(int startYear, int startMonth, int endYear, int endMonth)
        {
            PeriodStart = new MonthOfYear(startYear, startMonth);
            PeriodEnd = new MonthOfYear(endYear, endMonth);
        }

        private double DateDiff(string howtocompare, System.DateTime startDate, System.DateTime endDate) 
        {
            double diff=0;
            System.TimeSpan TS = new System.TimeSpan(endDate.Ticks-startDate.Ticks);

            switch (howtocompare.ToLower())
            {
                case "year":
                  diff = Convert.ToDouble(TS.TotalDays/365);
                  break;
               case "month":
                  diff = Convert.ToDouble((TS.TotalDays/365)*12);
                  break;
               case "day":
                  diff = Convert.ToDouble(TS.TotalDays);
                  break;
               case "hour":
                  diff = Convert.ToDouble(TS.TotalHours);
                  break;
               case "minute":
                  diff = Convert.ToDouble(TS.TotalMinutes);
                  break;
               case "second":
                  diff = Convert.ToDouble(TS.TotalSeconds);
                  break;
            }

            return diff;
        }

        public int TotalWorkHoursInPeriod
        {
            get
            {
                DateTime start = new DateTime(PeriodStart.Year, PeriodStart.Month, 1);
                int days = DateTime.DaysInMonth(PeriodEnd.Year, PeriodEnd.Month);
                DateTime end = new DateTime(PeriodEnd.Year, PeriodEnd.Month, days);
                int result = (int)DateDiff("month", start, end) + 1;
                return result * 160;
            }
        }

    }

    public class DepartmentManagerReport
    {
        private Period _period = null;
        public Period Period
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

        private Department _department = null;
        public Department DepartmentInfo
        {
            get
            {
                return _department;
            }
            set
            {
                _department = value;
            }
        }

        private bool _useChart = false;

        public bool ShowAsChart
        {
            get
            {
                return _useChart;
            }
            set
            {
                _useChart = value;
            }
        }

        public string DepartmentManagerTitle
        {
            get
            {
                if (DepartmentInfo != null)
                {
                    if (DepartmentInfo.Worker != null)
                    {
                        return DepartmentInfo.Worker.Fullname;
                    }                   
                }
                return "Nepaskirtas";
            }
        }

        private int _totalDepartmentWorked = 0;
        private int _workersOfDepartmentWorked = 0;        
        private List<AssociatedWorkedHours> _hoursOfOthers = new List<AssociatedWorkedHours>();

        public List<AssociatedWorkedHours> WorkedHoursOfOthers
        {
            get
            {
                return _hoursOfOthers;
            }
            set
            {
                _hoursOfOthers = value;
            }
        }

        public int TotalDepartmentWorked
        {
            get
            {
                return _totalDepartmentWorked;
            }
            set
            {
                _totalDepartmentWorked = value;
            }
        }

        public int ThisDepartmentWorkersWorkedInDepartmentProjects
        {
            get
            {
                return _workersOfDepartmentWorked;
            }
            set
            {
                _workersOfDepartmentWorked = value;
            }
        }

        public int ThisDepartmentWorkersWorkedInOtherProjects
        {
            get
            {
                return TotalDepartmentWorked - ThisDepartmentWorkersWorkedInDepartmentProjects;
            }
        }

        public int OthersTotalWorked
        {
            get
            {
                return _hoursOfOthers.Sum(h => h.Hours);
            }
        }

        public int WorkedNoWhere
        {
            get
            {
                return Period.TotalWorkHoursInPeriod - TotalDepartmentWorked;
            }
        }

        public string PercentNotWorked
        {
            get
            {
                if (Period.TotalWorkHoursInPeriod != 0)
                {
                    return (((double)WorkedNoWhere / (double)Period.TotalWorkHoursInPeriod) * (double)100).ToString("0.00") + "%";
                }
                else
                {
                    return "0.00%";
                }
            }
        }
    }
}

namespace mvc.Controllers
{
    public class DepartmentsController : Common.BaseController
    {
        public ActionResult Index()
        {
            // Add action logic here
            throw new NotImplementedException();
        }

        public ActionResult DepartmentManagerReport(int? startYear, int? startMonth, int? endMonth, int? endYear, int? department_id, bool? chart)
        {
            if (department_id.HasValue)
            {
                Models.Department currentDepartment = null;
                if (DBDataContext.Departments.Any())
                {
                    currentDepartment = DBDataContext.Departments.First(d => d.id == department_id.Value);
                    if (currentDepartment != null)
                    {
                        ViewData["Title"] = "Skyriaus " + currentDepartment.title + " vadovo ataskaita";
                        ViewData["department_id"] = department_id.Value;                        
                        Models.DepartmentManagerReport report = new mvc.Models.DepartmentManagerReport();
                        report.DepartmentInfo = currentDepartment;
                        report.ShowAsChart = chart ?? false;
                        int stYear = startYear ?? DateTime.Today.Year;
                        int stMonth = startMonth ?? DateTime.Today.Month;
                        int enYear = endYear ?? DateTime.Today.Year;
                        int enMonth = endMonth ?? DateTime.Today.Month;
                        ViewData["startYear"] = stYear;
                        ViewData["endYear"] = enYear;
                        ViewData["startMonth"] = stMonth;
                        ViewData["endMonth"] = enMonth;
                        ViewData["chart"] = chart ?? false;
                        report.Period = new mvc.Models.Period(stYear, stMonth, enYear, enMonth);
                        System.Data.Linq.EntitySet<Models.Project> myProjects = new System.Data.Linq.EntitySet<mvc.Models.Project>();
                        if (currentDepartment.Worker != null)
                        {
                            myProjects = currentDepartment.Worker.Projects;
                            if (myProjects.Any())
                            {
                                IEnumerable<Models.Task> myProjectTasks = DBDataContext.Tasks.Where(t => (myProjects.Contains(t.Project)) && (t.year * 12 + t.month >= stYear * 12 + stMonth) && (t.year * 12 + t.month <= endYear * 12 + endMonth));
                                if (DBDataContext.Departments.Any())
                                {
                                    List<Models.Department> departments = DBDataContext.Departments.Where(d => d.id != department_id.Value).ToList();
                                    foreach (Models.Department department in departments)
                                    {
                                        if (department.Workers.Any())
                                        {
                                            IEnumerable<Models.Task> myTasks = myProjectTasks.Where(t => (department.Workers.Contains(t.Worker)));
                                            if (myTasks.Count() > 0)
                                            {
                                                report.WorkedHoursOfOthers.Add(new mvc.Models.AssociatedWorkedHours(department.title, myTasks.Sum(t => t.worked_hours)));
                                            }
                                        }
                                    }
                                }
                                if (currentDepartment.Workers.Any())
                                {
                                    IEnumerable<Models.Task> myWorkersTasks = DBDataContext.Tasks.Where(t => (currentDepartment.Workers.Contains(t.Worker)) && (t.year * 12 + t.month >= stYear * 12 + stMonth) && (t.year * 12 + t.month <= endYear * 12 + endMonth));
                                    IEnumerable<Models.Task> myWorkersTasksOfMyProjects = myWorkersTasks.Where(t => (myProjects.Any()) && (myProjects.Contains(t.Project)));
                                    if (myWorkersTasks.Any())
                                    {
                                        report.TotalDepartmentWorked = myWorkersTasks.Sum(t => t.worked_hours);
                                    }
                                    if (myWorkersTasksOfMyProjects.Any())
                                    {
                                        report.ThisDepartmentWorkersWorkedInDepartmentProjects = myWorkersTasksOfMyProjects.Sum(t => t.worked_hours);
                                    }
                                }

                            }
                        }
                        return View(report);
                    }
                    else
                    {
                        string[] errors = { "Nurodytas skyrius nerastas" };
                        TempData["errors"] = errors;
                        return RedirectToAction("List");
                    }
                    
                }
                else
                {
                    string[] errors = { "Nėra jokių skyrių" };
                    TempData["errors"] = errors;
                    return RedirectToAction("List");
                }
            }
            else
            {
                string[] errors = { "Nenurodytas joks skyrius" };
                TempData["errors"] = errors;
                return RedirectToAction("List");                
            }
        }

    }
}