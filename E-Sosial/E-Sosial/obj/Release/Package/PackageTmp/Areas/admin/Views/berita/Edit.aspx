<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.t_news>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Berita
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="wrap">
        <div class="head">
            <div class="info">
                <h1>Berita</h1>
            </div>
            <div class="search">
            </div>
        </div>
        <div class="content">
            <div class="row-fluid">
                <div class="span12">
                    <div class="block">
                        <div class="head">
                            <h2>Tambah Berita</h2>
                        </div>
                        <% using (Html.BeginForm("Edit", "berita", FormMethod.Post, new { enctype = "multipart/form-data" })) { %>
                        <%: Html.ValidationSummary(true) %>
                        <%: Html.HiddenFor(model=>model.news_id) %>
                        <%: Html.HiddenFor(model=>model.news_date) %>
                        <%: Html.HiddenFor(model=>model.news_modified) %>
                        <%: Html.HiddenFor(model=>model.news_parent) %>
                        <%: Html.HiddenFor(model=>model.user_id) %>
                        <div class="content np">
                            <div class="controls-row">
                                <div class="span1">
                                    Judul :
                                </div>
                                <div class="span8">
                                    <%: Html.EditorFor(model => model.news_title) %>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.news_title) %></span>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span1">
                                    Status :
                                </div>
                                <div class="span8">
                                    <label class="radio-uni inline">
                                    <%: Html.RadioButtonFor(model => model.news_status,"aktif",new { @checked = "checked", @class="uni" }) %>
                                        Aktif
                                    </label>
                                    <label class="radio-uni inline">
                                    <%: Html.RadioButtonFor(model => model.news_status,"tidak_aktif",new { @class="uni" }) %>
                                        Tidak Aktif
                                    </label>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.news_status) %></span>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span1">
                                    Tipe :
                                </div>
                                <div class="span8">
                                    <label class="radio-uni inline">
                                    <%: Html.RadioButtonFor(model => model.news_type,"umum",new { @checked = "checked", @class="uni" }) %>
                                        Umum
                                    </label>
                                    <label class="radio-uni inline">
                                    <%: Html.RadioButtonFor(model => model.news_type,"privasi",new { @class="uni" }) %>
                                        Privasi
                                    </label>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.news_type) %></span>
                                </div>
                            </div>
                           
                            <div class="controls-row">
                                <div class="span1">
                                    Kategori :
                                </div>
                                <div class="span8">
                                    <%: Html.DropDownList("news_category",(IEnumerable<SelectListItem>)ViewBag.news_category)%>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span1">
                                    Gambar :
                                </div>
                                <div class="span8">
                                    <input type="file" name="gambar" id="gambar" class="uni" />
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span12">
                                    
                                    <div class="block">
                                        <div class="head">
                                            <h2>Konten</h2>
                                        </div>
                                        <div class="content np">
                                            <textarea id="clEditor" class="nm nb input-block-level"></textarea>
                                            <%: Html.HiddenFor(model => model.news_content, new {id="konten"})%>
                                            <%: Html.ValidationMessageFor(model => model.news_content)%>
                                        </div>
                                        
                                    </div>

                                </div>
                            </div>

                            <div class="footer">
                                <div class="side fr">
                                    <button id="simpan" type="submit" class="btn btn-primary" onclick="$('#konten').val($('#clEditor').val());">Simpan</button>
                                </div>
                            </div>
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
