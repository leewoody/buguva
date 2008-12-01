﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" CodeBehind="New.aspx.cs" Inherits="mvc.Views.Projects.New" %>
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
    <% Html.BeginForm("Insert", "Projects", new {}, FormMethod.Post); %>
    <% { %>
          <fieldset>
        <legend>Projektas</legend>
        <% POADataModelsDataContext data = new POADataModelsDataContext(); %>
        <% SelectList list = new SelectList(data.Workers.ToList(), "id", "Fullname", ViewData.Model.project_manager_id); %>
        <p>
            <label for="title">Projekto pavadinimas:</label><%= Html.TextBox("title") %>
        </p>         
        <p> 
            <label for="project_manager_id">Projekto vadovas:</label><%= Html.DropDownList("project_manager_id", list) %>
        </p>
        </fieldset>
        <input type="submit" value = "Sukurti" />                                                             
    <% } %>
</asp:Content>