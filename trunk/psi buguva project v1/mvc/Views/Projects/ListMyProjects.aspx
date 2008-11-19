﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" CodeBehind="ListMyProjects.aspx.cs" Inherits="mvc.Views.Projects.ListMyProjects" %>
<%@ Import Namespace="mvc.Common"%>
<%@ Import Namespace="mvc.Models"%>
<%@ Import Namespace="System.Web.Mvc.Html"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

   	<div class = "path">
   	  <%= Html.Path() %>
   	</div>
   	<div class="pager">   	
		<%= Html.Pager(ViewData.Model.PageSize, ViewData.Model.PageNumber, ViewData.Model.TotalItemCount) %>
	</div>
	<table class = "grid">
	   <tr>
	      <th>Pavadinimas</th>
	      <th>Kodas</th>
	      <th>Vadovas</th>
	      <th>Pradėta dalyvauti</th>
	      <th>Baigta dalyvauti</th>
	      <th>Išdirbta(val.)</th>
	      <th>Peržiūra</th>
	   </tr>	  
	   
	   <% foreach (Project project in ViewData.Model) %>
       <% { %>
            <% className = (project.project_manager_id == (int)ViewData["MyWorkerID"]) ? "marked" : ""; %>
            <tr class='<%# className.ToString()%>'>
             <td><%= Html.ActionLink(project.title, "ListMyTasksInProject", new {project_id = project.id}) %></td>
             <td>#<%= project.id %></td>
             <td><%= project.Worker.Fullname %></td>             
             <td><%= project.StartedAt %></td>             
             <td><%= project.EndedAt %></td>
             <td><%= project.TotalWorkedHours.ToString() %></td>
             <td>
               <%= Html.ActionImageLink("/Content/ico1.png", "Ataskaita", "Report", new {}) %>
               <% if (project.project_manager_id == (int)ViewData["MyWorkerID"]) %>
               <% { %>
                 <%= Html.ActionImageLink("/Content/ico2.png", "Vadovo Ataskaita", "ProjectManagerReport", new { })%>
               <% } %>
             </td>
          </tr>
	   <% } %>
	   <% if (ViewData.Model.Count == 0) %>
	   <% { %>
	      <tr>
	        <td>Nėra jokių projektų</td>
	      </tr>
	   <% } %>
	</table>
	
</asp:Content>
