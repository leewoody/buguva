﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" CodeBehind="ProjectIntensivityReport.aspx.cs" Inherits="mvc.Views.Projects.ProjectIntensivityReport" %>
<%@ Import Namespace="mvc.Common"%>
<%@ Import Namespace="mvc.Models"%>
<%@ Import Namespace="System.Web.Mvc.Html"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class = "path">
   	  <%= ViewData["Image"] %><%=ViewData["Base"] %> <span class="title"><%= ViewData["Title"]%></span>
   	</div> 
<ul id="menu">
   <li class="simple">
      <%= Html.ActionLink("Projekto ataskaita", "ProjectManagerReport", new { project_id = (int)ViewData["project_id"]}) %>
   </li>
   <li class="selected">
      <%= Html.ActionLink("Projekto intensyvumas", "ProjectIntensivityReport", new { project_id = (int)ViewData["project_id"] })%>                    
   </li>
</ul>
    
    <label style="margin-left: 30px; font-size: larger"><b>Projekto kodas: </b><%= ((ViewData["projectCode"] != null)?ViewData["projectCode"].ToString():"") %></label><br />
	<% string[] legends = {"Viso", "Projekto skyriaus darbuotojų", "Kitų darbuotojų" }; %>
	<% string[] yAxes = {"TotalWorkedHours", "ProjectsWorkersWorkedHours", "OthersWorkedHours"}; %>
	<% System.Drawing.Color[] colors = { System.Drawing.Color.Blue, System.Drawing.Color.Red, System.Drawing.Color.Black };  %>
    <%= Html.LineChart<ProjectIntensivity>(legends, ViewData.Model, "Period", yAxes, colors, System.Drawing.Color.White, "Projekto intensyvumas", "\nLaikotarpis (mėn.)", "Dirbo (Val.)", (ViewData.Model.Count > 5) ? ViewData.Model.Count * 50 + 160 : 600, 400)%>

    <% IPagedList<ProjectIntensivity> pagedModel = ViewData.Model.ToPagedList((int)ViewData["curPage"] - 1, (int)ViewData["itemsPerPage"]); %>    
    <div class = "pager">
       <%= Html.Pager(pagedModel.PageSize, pagedModel.PageNumber, pagedModel.TotalItemCount, new { project_id = ViewData["project_id"]})%>
    </div>
	<table class = "grid">
	   <tr>
	      <th>Laikotarpis</th>
	      <th>Viso dirbta</th>
	      <th>Projekto skyriaus darbuotojų dirbta</th>
	      <th>Darbuotojų iš kitų skyrių dirbta</th>
	   </tr>	  	  
	   <% foreach (ProjectIntensivity projectIntensivity in pagedModel) %>
       <% { %>            
            <tr>             
             <td><%= projectIntensivity.Period %></td>
             <td style="text-align:right"><%= projectIntensivity.TotalWorkedHours %></td>             
             <td style="text-align:right"><%= projectIntensivity.ProjectsWorkersWorkedHours %></td>             
             <td style="text-align:right"><%= projectIntensivity.OthersWorkedHours %></td>
          </tr>
	   <% } %>
	   <% if (ViewData.Model.Count == 0) %>
	   <% { %>
	      <tr>
	        <td>Projekte dar neatlikta jokių darbų</td>
	      </tr>
	   <% } %>
	</table>

</asp:Content>
