<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.t_report>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Delete</h2>

<h3>Are you sure you want to delete this?</h3>
<fieldset>
    <legend>t_report</legend>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.report_id) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.report_id) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.report_author) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.report_author) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.wil_id) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.wil_id) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.address) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.address) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.phone) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.phone) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.report_content) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.report_content) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.report_time) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.report_time) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="Delete" /> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
<% } %>

</asp:Content>
