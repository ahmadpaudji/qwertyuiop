<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<E_Sosial.t_volunteer>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Relawan
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="wrap">
        <div class="head">
            <div class="info">
                <h1>Relawan</h1>
            </div>
            <div class="side fr">
                <%: Html.ActionLink("Tambah", "Create", "relawan", new { @class = "btn btn-primary" })%>
                
            </div> 
            <div class="search">
            </div>
        </div>
        <div class="content">
            <div class="row-fluid">
                <div class="span12">

                    <div class="block">
                        <div class="head">
                            <h2>Data Relawan</h2>
                            <ul class="buttons">
                                <li><a href="#" class="block_toggle"><span class="i-arrow-down-3"></span></a></li>
                            </ul>
                        </div>
                        <div class="content np table-sorting">

                            <table cellpadding="0" cellspacing="0" width="100%" class="sortc">
                                <thead>
                                    <tr>
                                        <th>No. KTP</th>
                                        <th>Nama</th>
                                        <th>Alamat</th>
                                        <th>Pekerjaan</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                    <% foreach (var item in Model)
                                       { %>
                                    <tr>
                                        <td>
                                            <%: Html.DisplayFor(modelItem => item.vol_card_id) %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(modelItem => item.vol_name) %> 
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(modelItem => item.vol_address) %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(modelItem => item.vol_occupation) %>
                                        </td>
                                        <td>
                                            <%: Html.ActionLink("Ubah", "Edit", new { id=item.vol_id }) %> |
                                            <%: Html.ActionLink("Detil", "Details", new { id = item.vol_id })%>
                                            <% if (User.IsInRole("super_admin")) { %> |
                                            <%: Html.ActionLink("Hapus", "Delete", new { id = item.vol_id }, new {onclick = "return confirm('Anda yakin ingin menghapus ?');"})%>
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
