<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.t_csr_activity>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Aktifitas CSR
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="wrap">
        <div class="head">
            <div class="info">
                <h1>Aktifitas CSR</h1>
            </div>
            <div class="search">
            </div>
        </div>
        <div class="content">
            <div class="row-fluid">
                <div class="span12">

                    <div class="block">
                        <div class="head">
                            <h2>Detil Aktifitas CSR</h2>
                            <ul class="buttons">
                                <li><a href="#" class="block_toggle"><span class="i-arrow-down-3"></span></a></li>
                            </ul>
                        </div>
                        <div class="content np">

                            <table cellpadding="0" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>User</th>
                                        <th>Perusahaan</th>
                                        <th>Aktifitas</th>
                                        <th>Tanggal dibuat</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <%: ViewBag.user %>
                                        </td>
                                        <td>
                                            <%: ViewBag.csr_ph%>
                                        </td>
                                        <td>
                                            <%: ViewBag.act_name%>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(model=>model.csr_activity_date) %>
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
                            <h2>Deskripsi</h2>
                        </div>
                        <div class="content">
                            <img width="200" height="200" src="<%: Url.Content(Model.csr_activity_path) %>"><br />
                            <%: Html.Raw(Model.csr_activity_content) %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
