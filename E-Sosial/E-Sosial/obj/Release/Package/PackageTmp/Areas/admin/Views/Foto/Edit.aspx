<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.Areas.admin.Models.FotoCreate>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="wrap">
        <div class="head">
            <div class="info">
                <h1>Album Foto</h1>
            </div>
            <div class="search">
            </div>
        </div>
        <div class="content">
            <div class="row-fluid">
                <div class="span10">
                    <div class="block">
                        <div class="head">
                            <h2>Ubah Foto</h2>
                        </div>
                        <% using (Html.BeginForm("Edit", "foto", FormMethod.Post, new { enctype = "multipart/form-data" }))
                           { %>
                        <%: Html.ValidationSummary(true) %>
                        <%: Html.HiddenFor(model=>model.dokumentasi_id) %>
                        <div class="content np">
                            <div class="controls-row">
                                <div class="span2">
                                    Judul :
                                </div>
                                <div class="span8">
                                    <%: Html.EditorFor(model => model.dokumentasi_title) %>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.dokumentasi_title) %></span>
                                </div>
                            </div>
                            
                            <div class="controls-row">
                                <div class="span2">
                                    Kategori Foto :
                                </div>
                                <div class="span8">
                                    <%: Html.DropDownListFor(model=>model.album_id, (IEnumerable<SelectListItem>)ViewBag.album_id)%>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span2">
                                    Foto :
                                </div>
                                <div class="span8">
                                    <input type="file" accept="image/jpeg" name="dokumentasi_path" id="dokumentasi_path" class="uni" />
                                </div>
                            </div>
                            
                            <div class="footer">
                                <div class="side fr">
                                    <button id="simpan" type="submit" class="btn btn-primary">Simpan</button>
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
