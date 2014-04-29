<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Front.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<E_Sosial.Models.unduh>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="blog column c-2 clearfix">
        <h3>Download</h3>
        <br>
        <table width="100%">
            <thead>
                <tr>
                    <th>No</th>
                    <th width="30%">Nama</th>
                    <th>Keterangan</th>
                    <th>Aksi</th>
                </tr>
            </thead>
            <tbody>
                <% int i = 1; foreach (var item in Model) { %>
                <tr>
                    <td><%: i++ %></td>
                    <td><%: Html.DisplayFor(modelItem=>item.nama) %></td>
                    <td><%: Html.DisplayFor(modelItem=>item.keterangan) %></td>
                    <td><%: Html.ActionLink("Download", "download", new { url = item.url })%></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Slider" runat="server">
</asp:Content>
