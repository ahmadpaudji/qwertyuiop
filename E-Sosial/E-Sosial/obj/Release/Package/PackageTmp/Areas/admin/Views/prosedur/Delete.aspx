<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.t_content>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Delete</h2>

<h3>Are you sure you want to delete this?</h3>
<fieldset>
    <legend>t_content</legend>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.content_id) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.content_id) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.content_name) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.content_name) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.content_type) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.content_type) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.content) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.content) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.user_id) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.user_id) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.url) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.url) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.content_time) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.content_time) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="Delete" /> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
<% } %>

</asp:Content>
