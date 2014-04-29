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
                            <h2>Tambah CSR Perusahaan</h2>
                        </div>
                        <% using (Html.BeginForm()) { %>
                        <%: Html.ValidationSummary(true) %>
                        <div class="content np">
                            <div class="controls-row">
                                <div class="span4">
                                    Nama Perusahaan :
                                </div>
                                <div class="span8">
                                    <%: Html.TextBoxFor(model => model.csr_ph_name) %>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.csr_ph_name) %></span>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span4">
                                    Alamat :
                                </div>
                                <div class="span8">
                                    <%: Html.TextBoxFor(model => model.csr_ph_address) %>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.csr_ph_address) %></span>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span4">
                                    Aktifitas :
                                </div>
                                <div class="span8">
                                    <%: Html.TextBoxFor(model => model.csr_ph_activity) %>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.csr_ph_activity) %></span>
                                </div>
                            </div>
                            <div class="footer">
                                <div class="side fr">
                                    <button id="simpan" type="submit" class="btn btn-primary">Simpan</button>
                                </div>
                            </div>
                            
                        </div>
                        <% } %>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
