<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.t_kegiatan>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Delete</h2>

<h3>Are you sure you want to delete this?</h3>
<fieldset>
    <legend>t_kegiatan</legend>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.kegiatan_id) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.kegiatan_id) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.user_id) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.user_id) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.wilayah_id) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.wilayah_id) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.kegiatan_nama) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.kegiatan_nama) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.kegiatan_deskripsi) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.kegiatan_deskripsi) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.kegiatan_tgl_update) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.kegiatan_tgl_update) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.kegiatan_tgl_acara) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.kegiatan_tgl_acara) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="Delete" /> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
<% } %>

</asp:Content>
