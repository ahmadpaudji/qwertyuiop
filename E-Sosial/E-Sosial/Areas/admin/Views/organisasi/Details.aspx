<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.t_organisasi>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend>t_organisasi</legend>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.t_organisasi1) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.t_organisasi1) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.t_nama) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.t_nama) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.t_jabatan) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.t_jabatan) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.t_path) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.t_path) %>
    </div>
</fieldset>
<p>
    <%: Html.ActionLink("Edit", "Edit", new { /* id=Model.PrimaryKey */ }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
