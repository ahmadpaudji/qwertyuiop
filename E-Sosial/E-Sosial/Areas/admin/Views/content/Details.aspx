<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.user>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend>user</legend>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.id_user) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.id_user) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.username) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.username) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.user_password) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.user_password) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.user_passwordsalt) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.user_passwordsalt) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.nama) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.nama) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.email) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.email) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.hp) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.hp) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.alamat) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.alamat) %>
    </div>
</fieldset>
<p>
    <%: Html.ActionLink("Edit", "Edit", new { /* id=Model.PrimaryKey */ }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
