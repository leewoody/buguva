﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="mvc.Views.Tasks.List" %>
<%@ Import Namespace="mvc.Common"%>
<%@ Import Namespace="mvc.Models"%>
<%@ Import Namespace="System.Web.Mvc.Html"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
    <div class = "path">
   	  <%= Html.Path() %>
   	</div>   
    <div class = "errors">
      <%= Html.ErrorSummary("Įvyko klaida:", (string[])TempData["errors"]) %>
    </div>   	
   	<div class="pager">   	
	  <%= Html.Pager(ViewData.Model.PageSize, ViewData.Model.PageNumber, ViewData.Model.TotalItemCount) %>
	</div>   
	<table class = "grid">
	   <tr>
	      <th>ID</th>
	      <th>Projektas</th>
	      <th>Dalyvis</th>
	      <th>Mėnuo</th>
	      <th>Dirbtos valandos</th>
	      <th>Veiksmai</th>
	   </tr>    
	   <% foreach (Task task in ViewData.Model) %>
	   <% { %>
	      <tr>
	        <td><%= task.id %></td>
	        <td><%= (task.Project != null)?task.Project.title:"Nepaskirtas" %></td>
	        <td><%= (task.Worker != null)?task.Worker.Fullname:"Nepaskirtas" %></td>
	        <td><%= (new MonthOfYear(task.year, task.month)).ToString() %></td>
	        <td><%= task.worked_hours %></td>
	        <td>
	          <%= Html.ActionImageLink("../Content/edit.png", "Koreguoti", "Edit", new {id = task.id}) %>
	          <%= Html.ActionImageLink("../Content/delete.png", "Trinti", "Delete", new {id = task.id}, true, "Ar tikrai norite ištrinti šią užduotį?") %>	          
	        </td>
	      </tr>
	   <% } %>
	</table>
	<%= Html.ActionImageLink("../Content/new.png", "", "New", new {}) %><%= Html.ActionLink("Nauja užduotis", "New") %>
</asp:Content>