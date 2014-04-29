<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<E_Sosial.Areas.admin.Models.Download>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Download
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="wrap">
        <div class="head">
            <div class="info">
                <h1>Download</h1>
            </div>
            <div class="side fr">
                <%: Html.ActionLink("Tambah", "Create", "download", new { @class = "btn btn-primary" })%>
            </div> 
            <div class="search">
            </div>
        </div>
        <div class="content">
            <div class="row-fluid">
                <div class="span12">

                    <div class="block">
                        <div class="head">
                            <h2>Download</h2>
                            <ul class="buttons">
                                <li><a href="#" class="block_toggle"><span class="i-arrow-down-3"></span></a></li>
                            </ul>
                        </div>
                        <div class="content np table-sorting">

                            <table cellpadding="0" cellspacing="0" width="100%" class="sortc">
                                <thead>
                                    <tr>
                                        <th>User</th>
                                        <th>Judul</th>
                                        <th>Deskripsi</th>
                                        <th>Tanggal</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% foreach (var item in Model)
                                       { %>
                                    <tr>
                                        <td>
                                            <%: Html.DisplayFor(modelItem => item.user) %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(modelItem => item.download_title) %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(modelItem => item.download_desc) %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(modelItem => item.download_date) %>
                                        </td>
                                        <td>
                                            <%: Html.ActionLink("Download", "download", new { url = item.download_path})%> | 
                                            <%: Html.ActionLink("Ubah", "Edit", new { id = item.download_id})%>
                                            <% if (User.IsInRole("super_admin")) { %> |
                                            <%: Html.ActionLink("Hapus", "Delete", new { id = item.download_id}, new {onclick = "return confirm('Anda yakin ingin menghapus ?');"})%>
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
