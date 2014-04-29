﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.t_wilayah>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Kelurahan
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="wrap">
        <div class="head">
            <div class="info">
                <h1>Kelurahan</h1>
            </div>
            <div class="search">
            </div>
        </div>
        <div class="content">
            <div class="row-fluid">
                <div class="span12">

                    <div class="block">
                        <div class="head">
                            <h2>Detail Kelurahan</h2>
                            <ul class="buttons">
                                <li><a href="#" class="block_toggle"><span class="i-arrow-down-3"></span></a></li>
                                
                            </ul>
                        </div>
                        <div class="content np">

                            <table cellpadding="0" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>Kecamatan</th>
                                        <th>Nama Kelurahan</th>
                                        <th>Alamat</th>
                                        <th>Telepon</th>
                                        <th>E-Mail</th>
                                        <th>Website</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <%: ViewBag.kecamatan %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(model=>model.wil_name) %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(model=>model.wil_address) %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(model=>model.wil_phone) %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(model=>model.wil_email) %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(model=>model.web_url) %>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="row-fluid">
                        <div class="span12">

                            <div class="block">
                                <div class="head">
                                    <h2>Map Kelurahan <%: Html.DisplayFor(model=>model.wil_name) %></h2>
                                </div>
                                <div class="content np nb">
                                    <div id="google_world_map" style="width: 100%; height: 300px;"><%: Html.Raw(Model.geo_location) %></div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
