<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.t_content>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Profil
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <div class="wrap">
        <div class="head">
            <div class="info">
                <h1>Profil</h1>
            </div>
            <div class="search">
            </div>
        </div>
        <div class="content">
            <div class="row-fluid">
                <div class="span12">

                    <div class="block">
                        <div class="head">
                            <h2>Detail Profil</h2>
                            <ul class="buttons">
                                <li><a href="#" class="block_toggle"><span class="i-arrow-down-3"></span></a></li>
                                <li><a href="#" class="block_remove"><span class="i-cancel-2"></span></a></li>
                            </ul>
                        </div>
                        <div class="content np">

                            <table cellpadding="0" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>Profil</th>
                                        <th>Tanggal</th>
                                        <th>User</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <%: Html.DisplayFor(model=>model.content_name) %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(model=>model.content_time) %>
                                        </td>
                                        <td>
                                            <%: ViewBag.user %>
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
                            <% if (ViewBag.file != null) { %>
                            <img src="<%: Url.Content(ViewBag.file) %>" />
                            <% } %>
                            <%: Html.Raw(Model.content) %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
