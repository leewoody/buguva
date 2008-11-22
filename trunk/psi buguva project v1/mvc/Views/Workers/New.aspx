﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" CodeBehind="New.aspx.cs" Inherits="mvc.Views.Workers.New" %>
<%@ Import Namespace="mvc.Common"%>
<%@ Import Namespace="mvc.Models"%>
<%@ Import Namespace="System.Web.Mvc.Html"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class = "errors">
      <%= Html.ErrorSummary("Klaidų sąrašas:", (string[])TempData["errors"]) %>
    </div>
    <% Html.BeginForm("Insert", "Workers", new {}, FormMethod.Post); %>
    <% { %>
         <p>
            <label for="name">Vardas:</label><%= Html.TextBox("name") %>
         </p>
         <p>
            <label for="surname">Pavardė:</label><%= Html.TextBox("surname") %>
         </p>
         <p>
            <% POADataModelsDataContext dbConnection = new POADataModelsDataContext(); %>
            <% SelectList departments = new SelectList(dbConnection.Departments, "id", "title");  %>
            <label for="director">Skyrius:</label><%= Html.DropDownList("department_id", departments) %>
         </p>
         <input type="submit" value = "Sukurti" />                                                             
    <% } %>
   
</asp:Content>