<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Front.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<E_Sosial.Models.relawan>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="column c-2 clearfix">
        <!-- NEWS -->
        <h3>Relawan Sosial</h3>
        <div class="box contactUs ">
            <table>
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Nama</th>
                        <th>Handphone</th>
                        <th>E-mail</th>

                    </tr>
                </thead>
                <tbody>
                    <%int i = 1; foreach(var item in Model) { %>
                    <tr>
                        <td><%: i++ %></td>
                        <td><%: Html.DisplayFor(modelItem=>item.nama) %></td>
                        <td><%: Html.DisplayFor(modelItem=>item.hp) %></td>
                        <td><%: Html.DisplayFor(modelItem=>item.email) %></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Slider" runat="server">
</asp:Content>
