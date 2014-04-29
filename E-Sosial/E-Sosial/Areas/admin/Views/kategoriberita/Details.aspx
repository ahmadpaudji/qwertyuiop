<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.t_news_category>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend>t_news_category</legend>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.news_category_id) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.news_category_id) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.user_id) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.user_id) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.category_title) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.category_title) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.category_date) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.category_date) %>
    </div>
</fieldset>
<p>
    <%: Html.ActionLink("Edit", "Edit", new { /* id=Model.PrimaryKey */ }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
