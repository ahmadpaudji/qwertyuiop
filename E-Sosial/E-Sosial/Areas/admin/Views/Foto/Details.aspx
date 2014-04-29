<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.t_dokumentasi>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

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
<p>
    <%: Html.ActionLink("Edit", "Edit", new { /* id=Model.PrimaryKey */ }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
