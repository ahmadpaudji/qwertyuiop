<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.t_kegiatan>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Kegiatan
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="wrap">
        <div class="head">
            <div class="info">
                <h1>Kegiatan</h1>
            </div>
            <div class="search">
            </div>
        </div>
        <div class="content">
            <div class="row-fluid">
                <div class="span12">
                    <div class="block">
                        <div class="head">
                            <h2>Tambah Kegiatan</h2>
                        </div>
                        <% using (Html.BeginForm()) { %>
                        <%: Html.ValidationSummary(true) %>
                        <div class="content np">
                            <div class="controls-row">
                                <div class="span4">
                                    Nama Kegiatan :
                                </div>
                                <div class="span8">
                                    <%: Html.TextBoxFor(model => model.kegiatan_nama) %>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.kegiatan_nama) %></span>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span4">
                                    Pelaksanaan :
                                </div>
                                <div class="span8">
                                    <div class="input-prepend">
                                        <span class="add-on"><i class="i-star"></i></span>
                                       <%-- <%: Html.EditorFor(model => model.kegiatan_tgl_acara, new { @class="datetimepicker" })%>--%>
                                        <input id="kegiatan_tgl_acara" name="kegiatan_tgl_acara" type="text" class="datetimepicker"/>
                                    </div>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.kegiatan_tgl_acara) %></span>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span4">
                                    Wilayah :
                                </div>
                                <div class="span8">
                                    <%: Html.DropDownList("wilayah_id",(IEnumerable<SelectListItem>)ViewBag.wilayah_id) %>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span12">
                                    <div class="block">
                                        <div class="head">
                                            <h2>Deskripsi</h2>
                                        </div>
                                        <div class="content np">
                                            <textarea id="clEditor" class="nm nb input-block-level"></textarea>
                                            <%: Html.HiddenFor(model => model.kegiatan_deskripsi, new { id = "konten" })%>
                                            <%: Html.ValidationMessageFor(model => model.kegiatan_deskripsi)%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="footer">
                                <div class="side fr">
                                    <button id="simpan" type="submit" class="btn btn-primary">Simpan</button>
                                </div>
                            </div>
                            <script type="text/javascript">
                                $('#simpan').click(function () {
                                    $('#konten').val($('#clEditor').val());
                                })
                            </script>
                        </div>
                        <% } %>
                        <script type="text/javascript">
                            $('#clEditor').val($('#konten').val());
                        </script>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
