<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.Areas.admin.Models.organisasiCreate>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Struktur Organisasi
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    
    <div class="wrap">
        <div class="head">
            <div class="info">
                <h1>Struktur Organisasi</h1>
            </div>
            <div class="search">
            </div>
        </div>
        <div class="content">
            <div class="row-fluid">
                <div class="span12">
                    <div class="block">
                        <div class="head">
                            <h2>Ubah</h2>
                        </div>
                        <% using (Html.BeginForm("edit", "organisasi", FormMethod.Post, new { enctype = "multipart/form-data" }))
                           { %>
                        <%: Html.ValidationSummary(true) %>
                        <%: Html.HiddenFor(model=>model.t_organisasi1) %>
                        <div class="content np">
                            <div class="controls-row">
                                <div class="span4">
                                    Nama :
                                </div>
                                <div class="span8">
                                    <%: Html.EditorFor(model => model.t_nama) %>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.t_nama) %></span>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span4">
                                    Jabatan :
                                </div>
                                <div class="span8">
                                    <%: Html.EditorFor(model => model.t_jabatan) %>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.t_jabatan) %></span>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span4">
                                    Foto :
                                </div>
                                <div class="span8">
                                    <input type="file" accept="image/jpeg" name="t_path" id="t_path" class="uni" />
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
