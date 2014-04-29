<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Front.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<E_Sosial.Models.kesejahteraan>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="blog column c-2 clearfix">
        <h3><% if (ViewBag.tipe == "PMKS") {%>
                Penyandang Masalah Kesejahteraan Sosial
            <% } else { %>
                Potensi Sumber Kesejahteraan Sosial
            <% } %> Pemkot Bandung
        <br>
            Tahun 2012</h3>
        <br>

        <table>
            <thead>
                <tr>
                    <th>No</th>
                    <th>Nama</th>
                    <th>Jumlah</th>

                </tr>
            </thead>
            <tbody>
                <% int i = 1; foreach (var item in Model)
                   { %>
                <tr>
                    <td><%: i++ %></td>
                    <td><%: Html.DisplayFor(modelItem=>item.nama) %></td>
                    <td><%: Html.DisplayFor(modelItem=>item.jumlah) %> <%: Html.DisplayFor(modelItem=>item.satuan) %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Slider" runat="server">
</asp:Content>
