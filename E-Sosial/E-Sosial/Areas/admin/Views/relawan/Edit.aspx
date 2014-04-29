<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.t_volunteer>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Relawan
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="wrap">
        <div class="head">
            <div class="info">
                <h1>Relawan</h1>
            </div>
            <div class="search">
            </div>
        </div>
        <div class="content">
            <div class="row-fluid">
                <div class="span6">
                    <div class="block">
                        <div class="head">
                            <h2>Ubah Relawan</h2>
                        </div>
                        <% using (Html.BeginForm()) { %>
                        <%: Html.ValidationSummary(true) %>
                        <div class="content np">
                            <div class="controls-row">
                                <div class="span4">
                                    No. KTP :
                                </div>
                                <div class="span8">
                                    <%: Html.TextBoxFor(model => model.vol_card_id) %>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.vol_card_id) %></span>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span4">
                                    Nama :
                                </div>
                                <div class="span8">
                                    <%: Html.EditorFor(model => model.vol_name) %>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.vol_name) %></span>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span4">
                                    Handphone :
                                </div>
                                <div class="span8">
                                    <%: Html.EditorFor(model => model.vol_phone) %>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.vol_phone) %></span>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span4">
                                    Alamat :
                                </div>
                                <div class="span8">
                                    <%: Html.EditorFor(model => model.vol_address) %>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.vol_address) %></span>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span4">
                                    E-Mail :
                                </div>
                                <div class="span8">
                                    <%: Html.TextBoxFor(model => model.vol_email, new { @placeholder="contoh@contoh.com" }) %>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.vol_email) %></span>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span4">
                                    Pekerjaan :
                                </div>
                                <div class="span8">
                                    <%: Html.TextBoxFor(model => model.vol_occupation) %>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.vol_occupation) %></span>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span4">
                                    Kegiatan :
                                </div>
                                <div class="span8">
                                    <%: Html.DropDownList("kegiatan_id",(IEnumerable<SelectListItem>)ViewBag.kegiatan) %>
                                </div>
                            </div>
                            <div class="footer">
                                <div class="side fr">
                                    <button id="submit" type="submit" class="btn btn-primary">Simpan</button>
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
