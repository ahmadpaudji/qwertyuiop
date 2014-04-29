<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Front.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<E_Sosial.Models.csr>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="blog column c-2 clearfix">
        <h3>CSR Perusahaan</h3>
        <br>

        <table>
            <thead>
                <tr>
                    <th>No</th>
                    <th>Perusahaan</th>
                    <th>Kegiatan</th>
                    <th>Alamat</th>
                </tr>
            </thead>
            <tbody>
                <% int i = 1; foreach (var item in Model) { %>
                <tr>
                    <td><%: i++ %></td>
                    <td><%: Html.DisplayFor(modelItem=>item.ph) %></td>
                    <td><%: Html.DisplayFor(modelItem=>item.kegiatan) %></td>
                    <td><%: Html.DisplayFor(modelItem=>item.alamat) %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
                


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Slider" runat="server">
</asp:Content>
