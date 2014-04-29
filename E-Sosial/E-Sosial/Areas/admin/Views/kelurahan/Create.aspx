<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.t_wilayah>" %>

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
                <div class="span6">
                    <div class="block">
                        <div class="head">
                            <h2>Tambah Kelurahan</h2>
                        </div>
                        <% using (Html.BeginForm()) { %>
                        <%: Html.ValidationSummary(true) %>
                        <div class="content np">
                            <div class="controls-row">
                                <div class="span4">
                                    Nama Kelurahan :
                                </div>
                                <div class="span8">
                                    <%: Html.TextBoxFor(model => model.wil_name) %>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.wil_name) %></span>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span4">
                                    Telepon :
                                </div>
                                <div class="span8">
                                    <%: Html.EditorFor(model => model.wil_phone) %>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.wil_phone) %></span>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span4">
                                    Kecamatan :
                                </div>
                                <div class="span8">
                                    <%: Html.DropDownList("parent_id",(IEnumerable<SelectListItem>)ViewBag.parent_id) %>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span4">
                                    Alamat :
                                </div>
                                <div class="span8">
                                    <%: Html.EditorFor(model => model.wil_address) %>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.wil_address) %></span>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span4">
                                    E-Mail :
                                </div>
                                <div class="span8">
                                    <%: Html.TextBoxFor(model => model.wil_email, new { @placeholder="contoh@contoh.com" }) %>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.wil_email) %></span>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span4">
                                    Google Location :
                                </div>
                                <div class="span8">
                                    <%: Html.TextBoxFor(model => model.geo_location) %>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.geo_location) %></span>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span4">
                                    Website
                                </div>
                                <div class="span8">
                                    <%: Html.TextBoxFor(model => model.web_url, new { @placeholder="http://www.contoh.com" }) %>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.web_url) %></span>
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
