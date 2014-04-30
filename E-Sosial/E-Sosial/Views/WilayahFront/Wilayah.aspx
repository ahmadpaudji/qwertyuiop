<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Front.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<E_Sosial.Models.wilayah>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="blog column c-2 clearfix">
        <h3>Daftar  <%: ViewBag.wilayah %> Kota Bandung</h3>
        <br>
        <table align="100%">
            <thead>
                <tr>
                    <th>No</th>
                    <th align="30%"><%: ViewBag.wilayah %></th>
                    <th>Telepon</th>
                    <th>Alamat</th>
                    <th>Link</th>
                </tr>
            </thead>
            <tbody>
                <% int i = 1; foreach(var item in Model) { %>
                <tr>
                    <td><%: i++ %></td>
                    <td><%: Html.DisplayFor(modelItem=>item.nama) %></td>
                    <td><%: Html.DisplayFor(modelItem=>item.telepon) %></td>
                    <td><%: Html.DisplayFor(modelItem=>item.alamat) %></td>
                    <td>
                        <% if (item.link == null) { %>
                            Kosong
                        <% } else { %>
                            <a href="<%: Url.Action(item.link) %>" target="_blank"><%: Html.DisplayFor(modelItem=>item.link) %></a>
                        <% } %>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Slider" runat="server">
</asp:Content>
