<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.t_volunteer>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Delete</h2>

<h3>Are you sure you want to delete this?</h3>
<fieldset>
    <legend>t_volunteer</legend>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.vol_id) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.vol_id) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.vol_card_id) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.vol_card_id) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.vol_name) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.vol_name) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.vol_phone) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.vol_phone) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.vol_address) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.vol_address) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.vol_occupation) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.vol_occupation) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.vol_email) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.vol_email) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.kegiatan_id) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.kegiatan_id) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="Delete" /> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
<% } %>

</asp:Content>
