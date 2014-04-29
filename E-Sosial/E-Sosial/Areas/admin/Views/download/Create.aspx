<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.Areas.admin.Models.DownloadCreate>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Download
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="wrap">
        <div class="head">
            <div class="info">
                <h1>Download</h1>
            </div>
            <div class="search">
            </div>
        </div>
        <div class="content">
            <div class="row-fluid">
                <div class="span8">
                    <div class="block">
                        <div class="head">
                            <h2>Tambah File Download</h2>
                        </div>
                        <% using (Html.BeginForm("Create", "download", FormMethod.Post, new { enctype = "multipart/form-data" }))
                           { %>
                        <%: Html.ValidationSummary(true) %>
                        <div class="content np">
                            <div class="controls-row">
                                <div class="span4">
                                    Judul :
                                </div>
                                <div class="span8">
                                    <%: Html.TextBoxFor(model => model.download_title) %>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.download_title) %></span>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span4">
                                    Deskripsi :
                                </div>
                                <div class="span8">
                                    <%: Html.TextBoxFor(model => model.download_desc) %>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.download_desc) %></span>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span4">
                                    File :
                                </div>
                                <div class="span8">
                                    <input type="file" accept="application/pdf" name="dokumen" id="dokumen" class="uni"/>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model=>model.dokumen) %></span>
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
