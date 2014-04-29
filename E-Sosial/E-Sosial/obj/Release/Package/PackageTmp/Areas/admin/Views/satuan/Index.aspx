<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<E_Sosial.t_satuan>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Satuan
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     <div class="wrap">
        <div class="head">
            <div class="info">
                <h1>Satuan</h1>
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
                            <h2>Satuan</h2>
                            <ul class="buttons">
                                <li><a href="#" class="block_toggle"><span class="i-arrow-down-3"></span></a></li>
                            </ul>
                        </div>
                        <div class="content np table-sorting">

                            <table cellpadding="0" cellspacing="0" width="100%" class="sortc">
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>ID</th>
                                        <th>Satuan</th>
                                        <th>Tanggal</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                    <% int i = 1; foreach (var item in Model)
                                       { %>
                                    <tr>
                                        <td>
                                            <%: i++ %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(modelItem => item.id_satuan) %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(modelItem => item.satuan) %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(modelItem => item.tanggal) %> 
                                        </td>
                                        <td>
                                            <%: Html.ActionLink("Ubah", "Edit", new { id=item.id_satuan }) %>
                                            <% if (User.IsInRole("super_admin")) { %> |
                                            <%: Html.ActionLink("Hapus", "Delete", new { id = item.id_satuan}, new {onclick = "return confirm('Anda yakin ingin menghapus ?');"})%>
                                            <% } %>
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
