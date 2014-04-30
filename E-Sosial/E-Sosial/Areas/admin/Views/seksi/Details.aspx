<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.Areas.admin.Models.SeksiUpdate>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Seksi
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 
    <div class="wrap">
        <div class="head">
            <div class="info">
                <h1>Seksi</h1>
            </div>
            <div class="search">
            </div>
        </div>
        <div class="content">
            <div class="row-fluid">
                <div class="span12">
                    <div class="block">
                        <div class="head">
                            <h2>Penanggung Jawab</h2>
                        </div>
                        <div class="content np">
                            <div class="controls-row">
                                <div class="span4">
                                    <img width="50" height="50" src="<%: Url.Content(Model.seksi_foto) %>" class="img-polaroid" style="margin-bottom: 5px;" />
                                </div>
                            </div>      
                            <div class="controls-row">
                                <div class="span1">Nama :</div>
                                <div class="span6">
                                    <%: Html.DisplayFor(model=>model.seksi_name) %></div>
                            </div>
                            
                        </div>
                    </div>
                    <div class="block">
                        <div class="head">
                            <h2>Detail Seksi</h2>
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
                                        <th>Seksi Bagian</th>
                                        <th>Bidang</th>
                                        <th>Tanggal dibuat</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <%: Html.DisplayFor(model=>model.user) %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(model=>model.seksi_title) %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(model=>model.bidang) %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(model=>model.seksi_date) %>
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
                                    <% if (Url.Content(Model.seksi_desc_foto) != "Kosong"){ %>
                                    <img width="500" height="500" src="<%: Url.Content(Model.seksi_desc_foto) %>" class="img-polaroid" /><br />
                                    <% } %>
                                    <%: Html.Raw(Model.seksi_description) %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
