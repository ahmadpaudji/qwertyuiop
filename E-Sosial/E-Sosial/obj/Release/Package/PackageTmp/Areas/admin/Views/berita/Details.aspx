<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.t_news>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Berita
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="wrap">
        <div class="head">
            <div class="info">
                <h1>Berita</h1>
            </div>
            <div class="search">
            </div>
        </div>
        <div class="content">
            <div class="row-fluid">
                <div class="span12">

                    <div class="block">
                        <div class="head">
                            <h2>Detail Berita</h2>
                            <ul class="buttons">
                                <li><a href="#" class="block_toggle"><span class="i-arrow-down-3"></span></a></li>
                            </ul>
                        </div>
                        <div class="content np">

                            <table cellpadding="0" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>User</th>
                                        <th>Tanggal dibuat</th>
                                        <th>Status</th>
                                        <th>Tanggal diubah</th>
                                        <th>Tipe</th>
                                        <th>Kategori</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <%--<%: Html.DisplayFor(model=>model.user_id) %>--%>
                                            <%: ViewBag.userNama %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(model=>model.news_date) %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(model=>model.news_status) %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(model=>model.news_modified) %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(model=>model.news_type) %>
                                        </td>
                                        <td>
                                            <%--<%: Html.DisplayFor(model=>model.news_category) %>--%>
                                            <% if (ViewBag.namaKategori != null){ %>
                                            <%: ViewBag.namaKategori %>
                                            <%} else { %>
                                             Umum
                                            <%  } %>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="row-fluid scRow">
                        <div class="span12 scCol">

                            <div class="block" id="grid_block_1">
                                <div class="head">
                                    <h2><%: Html.DisplayFor(model=>model.news_title) %></h2>
                                </div>
                                <div class="content">
                                    <% if (ViewBag.gambar != null){ %>
                                    <img width="200" height="200" src="<%: Url.Content(ViewBag.gambar) %>"><br />
                                    <% } %>
                                    <%: Html.Raw(Model.news_content) %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
