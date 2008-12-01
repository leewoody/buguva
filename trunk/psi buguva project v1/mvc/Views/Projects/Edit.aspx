﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="mvc.Views.Projects.Edit" %>
<%@ Import Namespace="mvc.Common"%>
<%@ Import Namespace="mvc.Models"%>
<%@ Import Namespace="System.Web.Mvc.Html"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class = "path">
   	  <%= ViewData["Image"] %><%=ViewData["Base"] %> <span class="title"><%= ViewData["Title"]%></span>
   	</div> 
    <div class = "errors">
      <%= Html.ErrorSummary("Klaidų sąrašas:", (string[])TempData["errors"]) %>
    </div>
    <% Page.Title = ViewData["Title"].ToString(); %>
    <% Html.BeginForm("Update", "Projects", new {id = ViewData.Model.id}, FormMethod.Post); %>
    <% { %>
      <fieldset>
        <legend>Projektas ID <%= ViewData.Model.id %></legend>
        <% POADataModelsDataContext data = new POADataModelsDataContext(); %>
        <% SelectList list = new SelectList(data.Workers.Where(w => (w.deleted.HasValue == false)).ToList(), "id", "Fullname", ViewData.Model.project_manager_id); %>
         <p>
            <label for="title">Projekto pavadinimas:</label><%= Html.TextBox("title") %>
         </p>
         <p> 
            <label for="project_manager_id">Projekto vadovas:</label><%= Html.DropDownList("project_manager_id", list) %>
        </p>
        </fieldset>
         <input type="submit" value = "Keisti" />                         
    <% } %>
    <% Html.EndForm(); %>
</asp:Content>