<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.Areas.admin.Models.SeksiCreate>" %>

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
                            <h2>Tambah Seksi</h2>
                        </div>
                        <% using (Html.BeginForm("Create", "seksi", FormMethod.Post, new { enctype = "multipart/form-data" }))
                           { %>
                        <%: Html.ValidationSummary(true) %>
                        <div class="content np">
                            <div class="controls-row">
                                <div class="span4">
                                    Nama Seksi
                                </div>
                                <div class="span8">
                                    <%: Html.EditorFor(model => model.seksi_title) %>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.seksi_title) %></span>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span4">
                                    Nama Penanggung Jawab
                                </div>
                                <div class="span8">
                                    <%: Html.EditorFor(model => model.seksi_name) %>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.seksi_name) %></span>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span4">
                                    Bidang :
                                </div>
                                <div class="span8">
                                    <%: Html.DropDownList("bidang_id", (IEnumerable<SelectListItem>)ViewBag.bidang_id)%>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span4">
                                    Foto Penanggung Jawab :
                                </div>
                                <div class="span8">
                                    <input type="file" accept="image/jpeg" name="seksi_foto" id="seksi_foto" class="uni" />
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span4">
                                    Gambar Deskripsi :
                                </div>
                                <div class="span8">
                                    <input type="file" accept="image/jpeg" name="seksi_desc_foto" id="seksi_desc_foto" class="uni" />
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
                                            <%: Html.HiddenFor(model => model.seksi_description, new {id="konten"})%>
                                            <%: Html.ValidationMessageFor(model => model.seksi_description)%>
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
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
