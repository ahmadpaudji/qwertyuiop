<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.t_csr_ph>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    CSR Perusahaan
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="wrap">
        <div class="head">
            <div class="info">
                <h1>CSR Perusahaan</h1>
            </div>
            <div class="search">
            </div>
        </div>
        <div class="content">
            <div class="row-fluid">
                <div class="span12">

                    <div class="block">
                        <div class="head">
                            <h2>Detil CSR Perusahaan</h2>
                            <ul class="buttons">
                                <li><a href="#" class="block_toggle"><span class="i-arrow-down-3"></span></a></li>
                            </ul>
                        </div>
                        <div class="content np">

                            <table cellpadding="0" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>Nama Perusahaan</th>
                                        <th>Alamat</th>
                                        <th>Tanggal dibuat</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <%: Html.DisplayFor(model=>model.csr_ph_name) %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(model=>model.csr_ph_address) %>
                                        </td>
                                        <td>
                                            <%: Html.DisplayFor(model=>model.csr_ph_date) %>
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
                            <h2>Aktifitas <%: Html.DisplayFor(model=>model.csr_ph_name) %></h2>
                        </div>
                        <div class="content">
                            <%: Html.Raw(Model.csr_ph_activity) %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
