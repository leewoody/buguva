﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using mvc.Common;

namespace mvc.Controllers
{
    public class ProjectsController : Common.BaseController
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ListMyProjects(int? page)
        {
            ViewData["Title"] = "Mano Projektai";
            int currentPage = (page.HasValue) ? page.Value: 1;
            Models.POADataModelsDataContext data = new mvc.Models.POADataModelsDataContext();
            IEnumerable<Models.Project> projects = data.Projects;
            if (projects.Count() > 0)
            {
                projects = projects.Where(project => (project.Tasks.Where(task => task.project_participant_id == MyWorkerID).Count() > 0) || (project.project_manager_id == MyWorkerID));
            }
            return View(projects.ToPagedList(currentPage - 1, 25));
        }

        public ActionResult ListMyTasksInProject(int? page, int project_id, int? year, int? month)
        {
            Models.POADataModelsDataContext data = new mvc.Models.POADataModelsDataContext();
            Models.Worker myself = data.Workers.Where(worker => worker.id == MyWorkerID).First();
            List<Models.MonthOfYear> months = myself.workedMonthsInProject(project_id);
            List<Models.Task> tasks = new List<mvc.Models.Task>();
            int currentPage = (page.HasValue) ? page.Value : 1;
            int monthToUse = 0;
            int yearToUse = 0;
            if ((!year.HasValue) || (!month.HasValue))
            {
                if (months.Count > 0)
                {
                    yearToUse = months[0].Year;
                    monthToUse = months[0].Month;
                }
            }
            else
            {
                monthToUse = month.Value;
                yearToUse = year.Value;
            }
            if (monthToUse + yearToUse > 0)
            {
                tasks = data.Tasks.Where(task => ((task.project_id == project_id) && (task.year == yearToUse) && (task.month == monthToUse))).ToList();
            }
            if (tasks == null) tasks = new List<mvc.Models.Task>();
            return View(new Models.TasksAndMonths(tasks.ToPagedList(currentPage - 1, 25), months, new Models.MonthOfYear(yearToUse, monthToUse), project_id));
        }
    }
}
