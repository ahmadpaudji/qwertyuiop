<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<E_Sosial.t_wilayah>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Kecamatan
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="wrap">
        <div class="head">
            <div class="info">
                <h1>Kecamatan</h1>
            </div>
            <div class="side fr">
                <%: Html.ActionLink("Tambah", "Create", "kecamatan", new { @class = "btn btn-primary" })%>
            </div> 
            <div class="search">
            </div>
        </div>
        <div class="content">
            <div class="row-fluid">
                <div class="span12">

                    <div class="block">
                        <div class="head">
                            <h2>Data Kecamatan</h2>
                            <ul class="buttons">
                                <li><a href="#" class="block_toggle"><span class="i-arrow-down-3"></span></a></li>
                            </ul>
                        </div>
                        <div class="content np table-sorting">

                            <table cellpadding="0" cellspacing="0" width="100%" class="sortc">
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>Nama Kecamatan</th>
                                        <th>Telepon</th>
                                        <th>Alamat</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                    <% int i = 1; foreach (var item in Model.Where(m => m.wil_type == "Kecamatan"))
                                       { %>
                                    <tr>
                                        <td>
                                            <%: i++ %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(modelItem => item.wil_name) %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(modelItem => item.wil_phone) %> 
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(modelItem => item.wil_address) %>
                                        </td>
                                        <td>
                                            <%: Html.ActionLink("Ubah", "Edit", new { id=item.wil_id }) %> |
                                            <%: Html.ActionLink("Detil", "Details", new { id=item.wil_id }) %>
                                            <% if (User.IsInRole("super_admin")) { %> |
                                            <%: Html.ActionLink("Hapus", "Delete", new { id = item.wil_id }, new {onclick = "return confirm('Anda yakin ingin menghapus ?');"})%>
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
