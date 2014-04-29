<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.Areas.admin.Models.adminModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    User
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="wrap">
        <div class="head">
            <div class="info">
                <h1>Ubah User</h1>
            </div>
            <div class="search">
            </div>
        </div>
        <div class="content">
            <div class="row-fluid">
                <div class="span12">
                    <div class="block">
                        <div class="head">
                            <h2>Form Ubah User</h2>
                        </div>
                        <% using (Html.BeginForm())
                           { %>
                        <%: Html.ValidationSummary(true)%>
                        <div class="content np">
                            <% if (ViewBag.error == 'y')
                               { %>
                        <div class="alert alert-error">
                            <strong>Registrasi gagal !</strong> Harap isi data dengan benar.
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                        </div>
                        <% } %>
                            <% if (ViewBag.errorUsername == 'y')
                               { %>
                        <div class="alert alert-error">
                            <strong>Registrasi gagal !</strong> Username sudah ada.
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                        </div>
                        <% } %>
                            <% if (ViewBag.errorPassword == 'y') { %>
                        <div class="alert alert-error">
                            <strong>Registrasi gagal !</strong> Password tidak sama dengan Retype Password.
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                        </div>
                        <% } %>
                            <div class="controls-row">
                                <div class="span3">
                                    Username :
                                </div>
                                <div class="span8">
                                    <%: Html.EditorFor(model => model.username)%>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.username)%></span>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span3">
                                    Password :
                                </div>
                                <div class="span8">
                                    <%: Html.EditorFor(model => model.password)%>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.password)%></span>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span3">
                                    Retype Password :
                                </div>
                                <div class="span8">
                                    <%: Html.EditorFor(model => model.retype_password) %>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.retype_password) %></span>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span3">
                                    Nama :
                                </div>
                                <div class="span8">
                                    <%: Html.EditorFor(model => model.nama)%>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.nama)%></span>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span3">
                                    Alamat :
                                </div>
                                <div class="span8">
                                   <%: Html.EditorFor(model => model.alamat)%>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.alamat)%></span>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span3">
                                   E-Mail :
                                </div>
                                <div class="span8">
                                   <%: Html.EditorFor(model => model.email)%>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.email)%></span>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span3">
                                    No. Handphone :
                                </div>
                                <div class="span8">
                                   <%: Html.EditorFor(model => model.hp)%>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.hp)%></span>
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
