<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.t_donatur>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Donatur
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="wrap">
        <div class="head">
            <div class="info">
                <h1>Donatur</h1>
            </div>
            <div class="search">
            </div>
        </div>
        <div class="content">
            <div class="row-fluid">
                <div class="span12">

                    <div class="block">
                        <div class="head">
                            <h2>Detail Donatur</h2>
                            <ul class="buttons">
                                <li><a href="#" class="block_toggle"><span class="i-arrow-down-3"></span></a></li>
                                <li><a href="#" class="block_remove"><span class="i-cancel-2"></span></a></li>
                            </ul>
                        </div>
                        <div class="content np">

                            <table cellpadding="0" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>Nama</th>
                                        <th>Telepon</th>
                                        <th>Alamat</th>
                                        <th>E-Mail</th>
                                        <th>Donasi</th>
                                        <th>Pembayaran</th>
                                        <th>Bencana</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <%: Html.DisplayFor(model=>model.donatur_name) %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(model=>model.donatur_phone) %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(model=>model.donatur_address) %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(model=>model.donatur_email) %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(model=>model.donasi) %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(model=>model.pembayaran) %>
                                        </td>
                                        <td>
                                            <%: ViewBag.wilayah %>
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
