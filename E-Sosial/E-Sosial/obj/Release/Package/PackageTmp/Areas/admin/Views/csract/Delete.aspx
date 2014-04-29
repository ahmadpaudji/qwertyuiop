<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.t_csr_activity>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Delete</h2>

<h3>Are you sure you want to delete this?</h3>
<fieldset>
    <legend>t_csr_activity</legend>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.csr_activity_id) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.csr_activity_id) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.user_id) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.user_id) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.csr_activity_name) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.csr_activity_name) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.csr_activity_content) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.csr_activity_content) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.csr_activity_path) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.csr_activity_path) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.csr_activity_date) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.csr_activity_date) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="Delete" /> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
<% } %>

</asp:Content>
