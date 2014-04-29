<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.t_volunteer>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Relawan
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="wrap">
        <div class="head">
            <div class="info">
                <h1>Relawan</h1>
            </div>
            <div class="search">
            </div>
        </div>
        <div class="content">
            <div class="row-fluid">
                <div class="span12">

                    <div class="block">
                        <div class="head">
                            <h2>Detil Relawan</h2>
                            <ul class="buttons">
                                <li><a href="#" class="block_toggle"><span class="i-arrow-down-3"></span></a></li>
                                <li><a href="#" class="block_remove"><span class="i-cancel-2"></span></a></li>
                            </ul>
                        </div>
                        <div class="content np">

                            <table cellpadding="0" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>No. KTP</th>
                                        <th>Nama</th>
                                        <th>Handphone</th>
                                        <th>Alamat</th>
                                        <th>Pekerjaan</th>
                                        <th>E-Mail</th>
                                        <th>Kegiatan</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <%: Html.DisplayFor(model=>model.vol_card_id) %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(model=>model.vol_name) %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(model=>model.vol_phone) %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(model=>model.vol_address) %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(model=>model.vol_occupation) %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(model=>model.vol_email) %>
                                        </td>
                                        <td>
                                            <% if (ViewBag.kegiatan != null) { %>
                                            <%: ViewBag.kegiatan %>
                                            <% } %>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
</asp:Content>
