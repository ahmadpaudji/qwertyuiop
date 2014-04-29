<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<E_Sosial.t_organisasi>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Struktur Organisasi
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="wrap">
        <div class="head">
            <div class="info">
                <h1>Struktur Organisasi</h1>
            </div>
            <div class="side fr">
                <%: Html.ActionLink("Tambah", "Create", "organisasi", new { @class = "btn btn-primary" })%>
            </div> 
            <div class="search">
            </div>
        </div>
        <div class="content">
            <div class="row-fluid">
                <div class="span12">

                    <div class="block">
                        <div class="head">
                            <h2>Data Struktur Organisasi</h2>
                            <ul class="buttons">
                                <li><a href="#" class="block_toggle"><span class="i-arrow-down-3"></span></a></li>
                            </ul>
                        </div>
                        <div class="content np table-sorting">

                            <table cellpadding="0" cellspacing="0" width="100%" class="sortc">
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>Foto</th>
                                        <th>Nama</th>
                                        <th>Jabatan</th>
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
                                        <td align="center">
                                            <a class="fancybox" rel="group" href="<%: Url.Content(item.t_path) %>"><img width="50" height="50" src="<%: Url.Content(item.t_path) %>" class="img-polaroid"/></a>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(modelItem => item.t_nama) %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(modelItem => item.t_jabatan) %>
                                        </td>
                                        <td> 
                                            <%: Html.ActionLink("Ubah", "Edit", new { id = item.t_organisasi1})%>
                                            <% if (User.IsInRole("super_admin")) { %> |
                                            <%: Html.ActionLink("Hapus", "Delete", new { id = item.t_organisasi1}, new {onclick = "return confirm('Anda yakin ingin menghapus ?');"})%>
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
