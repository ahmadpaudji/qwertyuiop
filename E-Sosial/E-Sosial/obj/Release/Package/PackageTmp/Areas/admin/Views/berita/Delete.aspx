<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.t_news>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Delete</h2>

<h3>Are you sure you want to delete this?</h3>
<fieldset>
    <legend>t_news</legend>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.news_id) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.news_id) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.user_id) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.user_id) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.news_date) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.news_date) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.news_title) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.news_title) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.news_content) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.news_content) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.news_status) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.news_status) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.news_modified) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.news_modified) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.news_parent) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.news_parent) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.news_type) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.news_type) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.news_url) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.news_url) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.news_category) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.news_category) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="Delete" /> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
<% } %>

</asp:Content>
