<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.t_satuan>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend>t_satuan</legend>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.id_satuan) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.id_satuan) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.satuan) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.satuan) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.tanggal) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.tanggal) %>
    </div>
</fieldset>
<p>
    <%: Html.ActionLink("Edit", "Edit", new { /* id=Model.PrimaryKey */ }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
