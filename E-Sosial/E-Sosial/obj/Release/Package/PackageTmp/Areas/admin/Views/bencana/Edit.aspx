<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.Areas.admin.Models.BencanaCreate>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Bencana
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="wrap">
        <div class="head">
            <div class="info">
                <h1>Bencana</h1>
            </div>
            <div class="search">
            </div>
        </div>
        <div class="content">
            <div class="row-fluid">
                <div class="span12">
                    <div class="block">
                        <div class="head">
                            <h2>Ubah Bencana</h2>
                        </div>
                        <% using (Html.BeginForm("Edit", "bencana", FormMethod.Post, new { enctype = "multipart/form-data" }))
                           { %>
                        <%: Html.ValidationSummary(true) %>
                        <%: Html.HiddenFor(model=>model.report_id) %>
                        <%: Html.HiddenFor(model=>model.gambar) %>
                        <%: Html.HiddenFor(model=>model.wil_id) %>
                        <div class="content np">
                            <div class="controls-row">
                                <div class="span1">
                                    Pelapor :
                                </div>
                                <div class="span8">
                                    <%: Html.EditorFor(model => model.report_author) %>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.report_author) %></span>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span1">
                                    Alamat :
                                </div>
                                <div class="span8">
                                    <%: Html.EditorFor(model => model.address) %>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.address) %></span>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span1">
                                    Telepon :
                                </div>
                                <div class="span8">
                                    <%: Html.EditorFor(model => model.phone) %>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.phone) %></span>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span1">
                                    Wilayah :
                                </div>
                                <div class="span8">
                                    <%: Html.DropDownList("wil_id",(IEnumerable<SelectListItem>)ViewBag.wilayah)%>
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
                                            <%: Html.HiddenFor(model => model.report_content, new {id="konten"})%>
                                            <%: Html.ValidationMessageFor(model => model.report_content)%>
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
