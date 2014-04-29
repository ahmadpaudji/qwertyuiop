<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<E_Sosial.t_news>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Berita
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="wrap">
        <div class="head">
            <div class="info">
                <h1>Berita</h1>
            </div>
            <div class="side fr">
                <%: Html.ActionLink("Tambah", "Create", "berita", new { @class = "btn btn-primary" })%>
            </div> 
            <div class="search">
            </div>
        </div>
        <div class="content">
            <div class="row-fluid">
                <div class="span12">

                    <div class="block">
                        <div class="head">
                            <h2>Berita Aktif</h2>
                            <ul class="buttons">
                                <li><a href="#" class="block_toggle"><span class="i-arrow-down-3"></span></a></li>
                            </ul>
                        </div>
                        <div class="content np table-sorting">

                            <table cellpadding="0" cellspacing="0" width="100%" class="sortc">
                                <thead>
                                    <tr>
                                        <th>User Id</th>
                                        <th>Tanggal di buat</th>
                                        <th>Judul</th>
                                        <th>Status</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                    <% foreach (var item in Model.Where(i=>i.news_status == "aktif"))
                                       { %>
                                    <tr>
                                        <td>
                                            <%: Html.DisplayFor(modelItem => item.user_id) %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(modelItem => item.news_date) %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(modelItem => item.news_title) %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(modelItem => item.news_status) %>
                                        </td>
                                        
                                        <td>
                                            <%: Html.ActionLink("Ubah", "Edit", new { id=item.news_id }) %> |
                                            <%: Html.ActionLink("Detil", "Details", new { id=item.news_id }) %>
                                            <% if (User.IsInRole("super_admin")) {%> |
                                            <%: Html.ActionLink("Hapus", "Delete", new { id = item.news_id }, new {onclick = "return confirm('Anda yakin ingin menghapus ?');"})%>
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
   