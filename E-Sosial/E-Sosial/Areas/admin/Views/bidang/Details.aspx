<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.t_bidang>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Bidang
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   
    <div class="wrap">
        <div class="head">
            <div class="info">
                <h1>Bidang</h1>
            </div>
            <div class="search">
            </div>
        </div>
        <div class="content">
            <div class="row-fluid">
                <div class="span12">
                    <div class="block">
                        <div class="head">
                            <h2>Profil User</h2>
                        </div>
                        <div class="content np">
                            <div class="controls-row">
                                <div class="span4">
                                    <img width="50" height="50" src="<%: Url.Content(Model.bidang_person_foto) %>" class="img-polaroid" style="margin-bottom: 5px;" />
                                </div>
                            </div>      
                            <div class="controls-row">
                                <div class="span2">Penanggung Jawab:</div>
                                <div class="span6">
                                    <%: Html.DisplayFor(model=>model.bidang_name) %></div>
                            </div>
                            
                        </div>
                    </div>
                    <div class="block">
                        <div class="head">
                            <h2>Detail Bidang</h2>
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
                                        <th>Nama Bidang</th>
                                        <th>Tanggal dibuat</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <%--<%: Html.DisplayFor(model=>model.user_id) %>--%>
                                            <%: ViewBag.userNama %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(model=>model.bidang_title) %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(model=>model.bidang_date) %>
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
                                    <% if (Url.Content(Model.bidang_desc_foto) != "Kosong"){ %>
                                    <img width="500" height="500" src="<%: Url.Content(Model.bidang_desc_foto) %>" class="img-polaroid"><br />
                                    <% } %>
                                    <%: Html.Raw(Model.bidang_desc) %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
