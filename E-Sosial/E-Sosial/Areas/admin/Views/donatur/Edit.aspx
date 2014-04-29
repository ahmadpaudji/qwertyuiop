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
                <div class="span6">
                    <div class="block">
                        <div class="head">
                            <h2>Ubah Data Donatur</h2>
                        </div>
                        <% using (Html.BeginForm()) { %>
                        <%: Html.ValidationSummary(true) %>
                        <%: Html.HiddenFor(model=>model.donatur_id) %>
                        <div class="content np">
                            <div class="controls-row">
                                <div class="span4">
                                    Nama :
                                </div>
                                <div class="span8">
                                    <%: Html.TextBoxFor(model => model.donatur_name) %>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.donatur_name) %></span>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span4">
                                    Telepon/Handphone :
                                </div>
                                <div class="span8">
                                    <%: Html.EditorFor(model => model.donatur_phone) %>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.donatur_phone) %></span>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span4">
                                    Alamat :
                                </div>
                                <div class="span8">
                                    <%: Html.EditorFor(model => model.donatur_address) %>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.donatur_address) %></span>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span4">
                                    E-Mail :
                                </div>
                                <div class="span8">
                                    <%: Html.EditorFor(model => model.donatur_email) %>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.donatur_email) %></span>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span4">
                                    Donasi :
                                </div>
                                <div class="span8">
                                    <%: Html.EditorFor(model => model.donasi) %>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.donasi) %></span>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span4">
                                    Pembayaran :
                                </div>
                                <div class="span8">
                                    <%: Html.EditorFor(model => model.pembayaran) %>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.pembayaran) %></span>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span4">
                                    Bencana :
                                </div>
                                <div class="span8">
                                    <%: Html.DropDownList("report_id",(IEnumerable<SelectListItem>)ViewBag.bencana) %>
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
