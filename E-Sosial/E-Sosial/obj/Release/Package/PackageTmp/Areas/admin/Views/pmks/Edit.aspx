<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.t_kesejahteraan>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Penyandang Masalah Kesejahteraan Masyarakat
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="wrap">
        <div class="head">
            <div class="info">
                <h1>Penyandang Masalah Kesejahteraan Sosial</h1>
            </div>
            <div class="search">
            </div>
        </div>
        <div class="content">
            <div class="row-fluid">
                <div class="span6">
                    <div class="block">
                        <div class="head">
                            <h2>Ubah Data PMKS</h2>
                        </div>
                        <% using (Html.BeginForm()) { %>
                        <%: Html.ValidationSummary(true) %>
                        <div class="content np">
                            <%: Html.HiddenFor(model => model.ks_id) %>
                            <%: Html.HiddenFor(model=>model.ks_type) %>
                            <div class="controls-row">
                                <div class="span4">
                                    Nama :
                                </div>
                                <div class="span8">
                                    <%: Html.TextBoxFor(model => model.ks_name) %>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.ks_name) %></span>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span4">
                                    Jumlah :
                                </div>
                                <div class="span8">
                                    <%: Html.EditorFor(model => model.ks_jumlah) %>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.ks_jumlah) %></span>
                                </div>
                            </div>
                            
                            <div class="controls-row">
                                <div class="span4">
                                    Satuan
                                </div>
                                <div class="span8">
                                    <%: Html.DropDownList("ks_satuan",(IEnumerable<SelectListItem>)ViewBag.satuan)%>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span4">
                                    Tahun :
                                </div>
                                <div class="span8">
                                    <%: Html.EditorFor(model => model.ks_year) %>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.ks_year) %></span>
                                </div>
                            </div>
                            <div class="footer">
                                <div class="side fr">
                                    <button id="tes" type="submit" class="btn btn-primary">Simpan</button>
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
