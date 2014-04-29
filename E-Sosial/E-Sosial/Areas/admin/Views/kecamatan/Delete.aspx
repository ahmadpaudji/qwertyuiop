﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.t_wilayah>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Delete</h2>

<h3>Are you sure you want to delete this?</h3>
<fieldset>
    <legend>t_wilayah</legend>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.wil_id) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.wil_id) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.parent_id) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.parent_id) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.wil_name) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.wil_name) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.wil_type) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.wil_type) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.wil_address) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.wil_address) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.wil_phone) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.wil_phone) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.geo_location) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.geo_location) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.web_url) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.web_url) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="Delete" /> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
<% } %>

</asp:Content>
