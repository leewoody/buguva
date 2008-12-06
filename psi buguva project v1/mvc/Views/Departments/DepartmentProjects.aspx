﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" CodeBehind="DepartmentProjects.aspx.cs" Inherits="mvc.Views.Departments.DepartmentProjects" %>
<%@ Import Namespace="mvc.Common"%>
<%@ Import Namespace="mvc.Models"%>
<%@ Import Namespace="System.Web.Mvc.Html"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class = "path">
   	  <%= ViewData["Image"] %><span class="title"><%= ViewData["Title"]%></span>
   	</div> 
<ul id="menu">
   <li class="simple">
      <%= Html.ActionLink("Bendra Ataskaita", "DepartmentManagerReport", new { department_id = (int)ViewData["department_id"], startYear = (int)ViewData["startYear"], endYear = (int)ViewData["endYear"], startMonth = (int)ViewData["startMonth"], endMonth = (int)ViewData["endMonth"], chart = (bool)ViewData["chart"] })%>
   </li>
   <li class="selected">
      <%= Html.ActionLink("Projektai", "DepartmentProjects", new { department_id = (int)ViewData["department_id"], startYear = (int)ViewData["startYear"], endYear = (int)ViewData["endYear"], startMonth = (int)ViewData["startMonth"], endMonth = (int)ViewData["endMonth"], chart = (bool)ViewData["chart"], page = (int)ViewData["pageExt"], pageSize = (int)ViewData["pageSizeExt"], showOnlyMyProjects = (bool)ViewData["viewOnlyMy"] })%>                    
   </li>
</ul>

<% className = ((bool)ViewData["chart"])? "simple" : "selected"; %>
<% className2 = ((bool)ViewData["chart"])? "selected" : "simple"; %>
<ul id="menu2">
   <li class='<%= className.ToString() %>'>
      <%= Html.ActionLink("Ataskaita", "DepartmentProjects", new { department_id = (int)ViewData["department_id"], startYear = (int)ViewData["startYear"], endYear = (int)ViewData["endYear"], startMonth = (int)ViewData["startMonth"], endMonth = (int)ViewData["endMonth"], chart = false, page = (int)ViewData["pageExt"], pageSize = (int)ViewData["pageSizeExt"], showOnlyMyProjects = (bool)ViewData["viewOnlyMy"] })%>
   </li>
   <li class='<%= className2.ToString() %>'>
      <%= Html.ActionLink("Grafikas", "DepartmentProjects", new { department_id = (int)ViewData["department_id"], startYear = (int)ViewData["startYear"], endYear = (int)ViewData["endYear"], startMonth = (int)ViewData["startMonth"], endMonth = (int)ViewData["endMonth"], chart = true, page = (int)ViewData["pageExt"], pageSize = (int)ViewData["pageSizeExt"], showOnlyMyProjects = (bool)ViewData["viewOnlyMy"] })%>                    
   </li>
</ul>

<div id="years_form">
<% Html.BeginForm("DepartmentProjects", "Departments", FormMethod.Get); %>  
  <label>Nuo:</label>
  Metai:<%=Html.TextBox("startYear") %> Mėnuo:<%=Html.DropDownList("startMonth", MonthOfYear.monthsList((int)ViewData["startMonth"])) %><br />
  <label>Iki:</label>
  Metai:<%=Html.TextBox("endYear") %> Mėnuo:<%=Html.DropDownList("endMonth", MonthOfYear.monthsList((int)ViewData["startMonth"])) %>  
  <% System.Collections.Generic.Dictionary<string, bool> list = new Dictionary<string,bool>(); %>
  <% list.Add("Visi susiję projektai", false); %>
  <% list.Add("Tik šio skyriaus projektai", true); %>
  <%=Html.DropDownList("showOnlyMyProjects", new SelectList(list, "Value", "Key", ViewData["viewOnlyMy"])) %>

  <input type="submit" value="Pasirinkti" />
  <%= Html.Hidden("department_id") %>
  <%= Html.Hidden("chart") %>
  <%= Html.Hidden("pageSize") %>
<% Html.EndForm(); %>
</div>
<% bool paintContent = true; %>
<% if (TempData.ContainsKey("errors")) {paintContent = false;}; %>
    <div class = "errors">
      <%= Html.ErrorSummary("Įvyko klaida:", (string[])TempData["errors"]) %>
    </div>  
<% if (paintContent) { %>
<% if ((bool)ViewData["chart"]) %>
<% { %>
	<% string[] legends = {"Skyriaus darbuotojai dirbo", "Kiti dirbo"}; %>
	<% string[] yAxes = { "DepartmentWorkersWorked", "OthersWorked"}; %>
	<% System.Drawing.Color[] colors = { System.Drawing.Color.Blue, System.Drawing.Color.Red, System.Drawing.Color.Green };  %>
	<% System.Drawing.Color[] colors2 = { System.Drawing.Color.Navy, System.Drawing.Color.LightGreen, System.Drawing.Color.RoyalBlue };  %>
	
	<%= Html.BarChart<DepartmentProjectReport>(legends, ViewData.Model, "Title", yAxes, colors, System.Drawing.Color.White, "Skyriaus darbuotojų darbo projektuose grafikas", 90, 15, true, (ViewData.Model.Count * 30 + 160 > 600) ? ViewData.Model.Count * 30 + 160 : 600, (ViewData.Model.Count * 20 + 110 > 400) ? ViewData.Model.Count * 20 + 110 : 400, "Projektas ", true, "Valandos", "")%>
<% } %>
<% else %>
<% { %>
 <div class="pager">
   <%= Html.Pager((int)ViewData["pageSizeExt"], (int)ViewData["pageExt"], (int)ViewData["pageCountExt"] * (int)ViewData["pageSizeExt"], new { department_id = (int)ViewData["department_id"], startYear = (int)ViewData["startYear"], endYear = (int)ViewData["endYear"], startMonth = (int)ViewData["startMonth"], endMonth = (int)ViewData["endMonth"], chart = false, pageSize = (int)ViewData["pageSizeExt"], showOnlyMyProjects = (bool)ViewData["viewOnlyMy"] })%>
 </div>
 <table class="grid">   
    <tr>
       <th>Projekto kodas</th>
       <th>Vadovas</th>
       <th>Skyrius</th>
       <th>Pradžia</th>
       <th>Pabaiga</th>
       <th>Viso dirbta</th>
       <th>Skyriaus darbuotojų dirbta</th>
       <th>Kitų darbuotojų dirbta</th>
    </tr>
  <% foreach (DepartmentProjectReport projectLine in ViewData.Model) %>
  <% { %>
        <tr> 
        <% mvc.Models.POADataModelsDataContext DBDataContext = new POADataModelsDataContext();
                Project project = DBDataContext.Projects.First(p => p.id == projectLine.ProjectID);
                Department department = DBDataContext.Departments.First(d => d.id == projectLine.DepartmentID);
                Worker worker = DBDataContext.Workers.First(w => w.id == projectLine.ManagerID);
          %>
           <td><%= (project.canBeSeen())?Html.ActionLink(projectLine.Title, "ProjectManagerReport", new {controller = "Projects", project_id = projectLine.ProjectID}):projectLine.Title %></td>
           <td><%= (projectLine.ManagerID > 0) ? ((worker.canBeSeen())? Html.ActionLink(projectLine.Manager, "ListMyProjects", new { controller = "Projects", id = projectLine.ManagerID }):projectLine.Manager) : "<span style=\"color:Red\">" + projectLine.Manager + "</span>" %></td>
           <td><%= (projectLine.DepartmentID > 0) ? ((department.canBeSeen())? Html.ActionLink(projectLine.ManagerDepartment, "DepartmentManagerReport", new { department_id = projectLine.DepartmentID }):projectLine.ManagerDepartment) : "<span style=\"color:Red\">" + projectLine.ManagerDepartment + "</span>"%></td>
           <td><%= projectLine.Started %></td>
           <td><%= projectLine.Ended %></td>
           <td><%= projectLine.TotalWorked %></td>
           <td><%= projectLine.DepartmentWorkersWorked %></td>
           <td><%= projectLine.OthersWorked %></td>
        </tr>            
  <% } %>
	   <% if (ViewData.Model.Count == 0) %>
	   <% { %>
	      <tr>
	        <td>Nėra jokių projektų</td>
	      </tr>
	   <% } %>  
 </table>
 <% Html.BeginForm("DepartmentProjects", "Departments", FormMethod.Get); %>  
   <%= Html.Hidden("department_id") %>
   <%= Html.Hidden("chart") %>
   <%= Html.Hidden("startYear") %>
   <%= Html.Hidden("startMonth") %>
   <%= Html.Hidden("endYear") %>
   <%= Html.Hidden("endMonth") %>
   <%= Html.Hidden("showOnlyMyProjects") %>
   <% List<int> pageSizes = new List<int>(); %>
   <% for (int i = 5; i <= 50; i += 5) pageSizes.Add(i); %>
   <label>Įrašų per puslapį</label><%= Html.DropDownList("pageSize", new SelectList(pageSizes, ViewData["pageSizeExt"]), new { onChange = "javascript: form.submit();"})%>
 <% Html.EndForm(); %>
<% } %>
<% } %>
</asp:Content>