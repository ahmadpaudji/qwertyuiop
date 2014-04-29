<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.t_dokumentasi>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Delete</h2>

<h3>Are you sure you want to delete this?</h3>
<fieldset>
    <legend>t_dokumentasi</legend>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.dokumentasi_id) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.dokumentasi_id) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.album_id) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.album_id) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.dokumentasi_path) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.dokumentasi_path) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.dokumentasi_title) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.dokumentasi_title) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.dokumentasi_type) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.dokumentasi_type) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.dokumentasi_date) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.dokumentasi_date) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="Delete" /> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
<% } %>

</asp:Content>
