<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.t_kesejahteraan>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend>t_kesejahteraan</legend>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.ks_id) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.ks_id) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.ks_name) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.ks_name) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.ks_jumlah) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.ks_jumlah) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.ks_type) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.ks_type) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.ks_satuan) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.ks_satuan) %>
    </div>
</fieldset>
<p>
    <%: Html.ActionLink("Edit", "Edit", new { id=Model.ks_id}) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
