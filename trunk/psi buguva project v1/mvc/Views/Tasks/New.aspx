﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" CodeBehind="New.aspx.cs" Inherits="mvc.Views.Tasks.New" %>
<%@ Import Namespace="mvc.Common"%>
<%@ Import Namespace="mvc.Models"%>
<%@ Import Namespace="System.Web.Mvc.Html"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class = "errors">
        <%= Html.ErrorSummary("Klaidų sąrašas:", (string[])TempData["errors"]) %>
    </div>
    <% Html.BeginForm("Insert", "Tasks", new {}, FormMethod.Post); %>
    <% { %>
        <% POADataModelsDataContext data = new POADataModelsDataContext(); %>
        <% SelectList list = new SelectList(data.Workers.ToList(), "id", "Fullname", ViewData.Model.id); %>
        <% SelectList listProjects = new SelectList(data.Projects.ToList(), "id", "title", ViewData.Model.id); %>
        <% SelectList listMonth = MonthOfYear.monthsList(ViewData.Model.month); %>
        <p> 
            <label for="project_id">Projekto pavadinimas:</label><%= Html.DropDownList("project_id", listProjects) %>
        </p>
        <p> 
            <label for="project_participant_id">Projekto dalyvis:</label><%= Html.DropDownList("project_participant_id", list) %>
        </p>
        <p>
            <label for="year">Metai:</label><%= Html.TextBox("year") %>
        </p>   
        <p> 
            <label for="month">Mėnesis:</label><%= Html.DropDownList("month", listMonth) %>
        </p>      
        <p>
            <label for="worked_hours">Dirbo valandų:</label><%= Html.TextBox("worked_hours") %>
        </p>   
        <input type="submit" value = "Sukurti" />                                                             
    <% } %>
</asp:Content>