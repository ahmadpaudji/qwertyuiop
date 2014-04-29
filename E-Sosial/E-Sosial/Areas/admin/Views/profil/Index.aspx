<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<E_Sosial.Areas.admin.Models.Modul>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Profil
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     <div class="wrap">
        <div class="head">
            <div class="info">
                <h1>Profil</h1>
            </div>
            <div class="side fr">
                <%: Html.ActionLink("Tambah", "Create", "profil", new { @class = "btn btn-primary" })%>
            </div>
            <div class="search">
            </div>
        </div>
        <div class="content">
            <div class="row-fluid">
                <div class="span12">

                    <div class="block">
                        <div class="head">
                            <h2>Data Profil</h2>
                            <ul class="buttons">
                                <li><a href="#" class="block_loading"><span class="i-cycle"></span></a></li>
                                <li><a href="#" class="block_toggle"><span class="i-arrow-down-3"></span></a></li>
                                <li><a href="#" class="block_remove"><span class="i-cancel-2"></span></a></li>
                            </ul>
                        </div>
                        <div class="content np table-sorting">

                            <table cellpadding="0" cellspacing="0" width="100%" class="sortc">
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>Profil</th>
                                        <th>Tanggal</th>
                                        <th>User</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                    <% int i = 1; foreach (var item in Model.Where(m => m.tipe == "Profil"))
                                       { %>
                                    <tr>
                                        <td>
                                            <%: i++ %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(modelItem => item.nama) %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(modelItem => item.tanggal) %> 
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(modelItem=>item.user) %>
                                        </td>
                                        <td>
                                            <%: Html.ActionLink("Ubah", "Edit", new { id=item.modulId }) %> |
                                            <%: Html.ActionLink("Detil", "Details", new { id=item.modulId }) %> |
                                            <%: Html.ActionLink("Hapus", "Delete", new { id = item.modulId}, new {onclick = "return confirm('Anda yakin ingin menghapus ?');"})%>
                                        </td>
                                    </tr>
                                    <% } %>
                                </tbody>
                            </table>

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

</asp:Content>
