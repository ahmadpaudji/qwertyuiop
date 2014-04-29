<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.Areas.admin.Models.FotoAdmin>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Foto
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="wrap">
        <div class="head">
            <div class="info">
                <h1>Foto</h1>
            </div>
            <div class="search">
            </div>
        </div>
        <div class="content">
            <div class="row-fluid">
                <div class="span4">
                    <div class="block">
                        <div class="head">
                            <h2>Ubah Foto</h2>
                        </div>
                        <% using (Html.BeginForm("EditFoto", "user", FormMethod.Post, new { enctype = "multipart/form-data" }))
                           { %>
                        <%: Html.ValidationSummary(true) %>
                        <div class="controls-row">
                            <div class="span4">
                                <input type="file" accept="image/jpeg" name="foto" id="foto" class="uni" />
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
</asp:Content>
