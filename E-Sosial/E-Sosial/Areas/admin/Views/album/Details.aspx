<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.t_album>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Album
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   
    <div class="wrap">
        <div class="head">
            <div class="info">
                <h1>Album</h1>
            </div>
            <div class="search">
            </div>
        </div>
        <div class="content">
            <div class="row-fluid">
                <div class="span12">

                    <div class="block">
                        <div class="head">
                            <h2>Detail Album</h2>
                            <ul class="buttons">
                                <li><a href="#" class="block_toggle"><span class="i-arrow-down-3"></span></a></li>
                                <li><a href="#" class="block_remove"><span class="i-cancel-2"></span></a></li>
                            </ul>
                        </div>
                        <div class="content np">

                            <table cellpadding="0" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>User</th>
                                        <th>Judul</th>
                                        <th>Tanggal</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <%--<%: Html.DisplayFor(model=>model.user_id) %>--%>
                                            <%: ViewBag.userNama %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(model=>model.album_title) %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(model=>model.album_date) %>
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
                                    <h2>Deskripsi</h2>
                                </div>
                                <div class="content">
                                    <%: Html.Raw(Model.album_desc) %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
