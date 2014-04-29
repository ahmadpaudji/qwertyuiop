<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<E_Sosial.Areas.admin.Models.Foto>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Video
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     
    <div class="wrap">
        <div class="head">
            <div class="info">
                <h1>Album Video</h1>
            </div>
            <div class="side fr">
                <%: Html.ActionLink("Tambah", "Create", "video", new { @class = "btn btn-primary" })%>
            </div> 
            <div class="search">
            </div>
        </div>
        <div class="content">
            <div class="row-fluid">
                <div class="span12">

                    <div class="block">
                        <div class="head">
                            <h2>Daftar Video</h2>
                            <ul class="buttons">
                                <li><a href="#" class="block_toggle"><span class="i-arrow-down-3"></span></a></li>
                            </ul>
                        </div>
                        <div class="content np table-sorting">

                            <table cellpadding="0" cellspacing="0" width="100%" class="sortc">
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>Album</th>
                                        <th>Judul</th>
                                        <th>Tanggal</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                    <% int i = 1; foreach (var item in Model.Where(t => t.dokumentasi_type == "video"))
                                       { %>
                                    <tr>
                                        <td align="center">
                                            <%: i++ %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(modelItem=>item.album) %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(modelItem => item.dokumentasi_title) %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(modelItem => item.dokumentasi_date) %>
                                        </td>
                                        
                                        <td>
                                            <%: Html.ActionLink("Download", "download", new { url=item.dokumentasi_path}) %> | 
                                            <%: Html.ActionLink("Ubah", "Edit", new { id=item.dokumentasi_id}) %>
                                            <% if (User.IsInRole("super_admin")) {%> |
                                            <%: Html.ActionLink("Hapus", "Delete", new { id = item.dokumentasi_id }, new {onclick = "return confirm('Anda yakin ingin menghapus ?');"})%>
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
