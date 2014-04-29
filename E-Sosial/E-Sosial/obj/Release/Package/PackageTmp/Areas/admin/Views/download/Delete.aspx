<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.t_download>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Delete</h2>

<h3>Are you sure you want to delete this?</h3>
<fieldset>
    <legend>t_download</legend>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.download_id) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.download_id) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.download_title) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.download_title) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.download_path) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.download_path) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.download_desc) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.download_desc) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.download_date) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.download_date) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.user_id) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.user_id) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="Delete" /> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
<% } %>

</asp:Content>
