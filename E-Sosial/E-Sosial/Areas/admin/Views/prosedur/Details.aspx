<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.t_content>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Prosedur
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="wrap">
        <div class="head">
            <div class="info">
                <h1>Prosedur</h1>
            </div>
            <div class="search">
            </div>
        </div>
        <div class="content">
            <div class="row-fluid">
                <div class="span12">

                    <div class="block">
                        <div class="head">
                            <h2>Detail Prosedur</h2>
                            <ul class="buttons">
                                <li><a href="#" class="block_toggle"><span class="i-arrow-down-3"></span></a></li>
                            </ul>
                        </div>
                        <div class="content np">

                            <table cellpadding="0" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>User</th>
                                        <th>Prosedur</th>
                                        <th>Tanggal</th>
                                        <th>Dokumen</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <%: ViewBag.user %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(model=>model.content_name) %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(model=>model.content_time) %>
                                        </td>
                                        <td>
                                            <% if (ViewBag.file != null) { %>
                                            <%: Html.ActionLink("Download","download", new{url = ViewBag.file}) %>
                                            <% } %>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    
                </div>
            </div>
            <div class="row-fluid scRow">
                <div class="span12 scCol">

                    <div class="block" id="grid_block_1">
                        <div class="head">
                            <h2>Konten</h2>
                        </div>
                        <div class="content">
                            <% if (ViewBag.gambar != null){ %>
                                    <img width="200" height="200" src="<%: Url.Content(ViewBag.gambar) %>"><br />
                                    <% } %>
                            <%: Html.Raw(Model.content) %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
