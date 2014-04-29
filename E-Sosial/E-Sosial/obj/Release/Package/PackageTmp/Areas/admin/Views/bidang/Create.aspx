<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.Areas.admin.Models.BidangCreate>" %>

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
                            <h2>Tambah Bidang</h2>
                        </div>
                        <% using (Html.BeginForm("Create", "bidang", FormMethod.Post, new { enctype = "multipart/form-data" }))
                           { %>
                        <%: Html.ValidationSummary(true) %>
                        <div class="content np">
                            <div class="controls-row">
                                <div class="span4">
                                    Nama Bidang
                                </div>
                                <div class="span8">
                                    <%: Html.EditorFor(model => model.bidang_title) %>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.bidang_title) %></span>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span4">
                                    Nama Penanggung Jawab
                                </div>
                                <div class="span8">
                                    <%: Html.EditorFor(model => model.bidang_name) %>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.bidang_name) %></span>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span4">
                                    Foto Penanggung Jawab :
                                </div>
                                <div class="span8">
                                    <input type="file" accept="image/jpeg" name="gambar_pj" id="gambar_pj" class="uni" />
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span4">
                                    Gambar Deskripsi :
                                </div>
                                <div class="span8">
                                    <input type="file" accept="image/jpeg" name="gambar_des" id="gambar_des" class="uni" />
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
                                            <%: Html.HiddenFor(model => model.bidang_desc, new {id="konten"})%>
                                            <%: Html.ValidationMessageFor(model => model.bidang_desc)%>
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
