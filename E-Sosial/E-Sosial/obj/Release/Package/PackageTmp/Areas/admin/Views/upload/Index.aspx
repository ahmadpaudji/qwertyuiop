<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.Areas.admin.Models.Upload>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Index</h2>

    <% using (Html.BeginForm(null,null,FormMethod.Post, new {enctype = "multipart/form-data"})) { %>
    <table>
        <tr>
            <td>
                File
            </td>
            <td>
                <input type="file" name="file" id="file" />
            </td>
        </tr>
        <tr>
            <td>
                <input type="submit" name="submit" value="Upload" />
            </td>
        </tr>
    </table>
    <%} %>

</asp:Content>
