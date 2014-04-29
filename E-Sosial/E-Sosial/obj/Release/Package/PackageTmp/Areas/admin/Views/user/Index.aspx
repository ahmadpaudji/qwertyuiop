<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<E_Sosial.user>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Profil User
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <div class="wrap">
        <div class="head">
            <div class="info">
                <h1>Data User</h1>
            </div>
            <div class="side fr">
                <%: Html.ActionLink("Tambah", "Create", "user", new { @class = "btn btn-primary" })%>
            </div> 
            <div class="search">
            </div>
        </div>
        <div class="content">
            <div class="row-fluid">
                <div class="span12">

                    <div class="block">
                        <div class="head">
                            <h2>Data User</h2>
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
                                        <th>Nama (Hak Akses)</th>
                                        <th>Kontak (No. Handphone)</th>
                                        <th>Alamat</th>
                                        <th>Tanggal</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                    <% foreach (var item in Model)
                                       { %>
                                    <tr>
                                        <td>
                                            <%: Html.DisplayFor(modelItem => item.nama) %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(modelItem => item.email) %> (<%: Html.DisplayFor(modelItem => item.hp) %>)
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(modelItem => item.alamat) %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(modelItem => item.tanggal) %>
                                        </td>
                                        <td>
                                            <%: Html.ActionLink("Ubah", "EditUser", new { id = item.id_user})%> |
                                            <%: Html.ActionLink("Hapus", "Delete", new { id = item.id_user}, new {onclick = "return confirm('Anda yakin ingin menghapus ?');"})%>
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
