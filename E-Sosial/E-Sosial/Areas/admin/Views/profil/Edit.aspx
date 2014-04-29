<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.Areas.admin.Models.ContentCreate>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Profil
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
      <div class="wrap">
        <div class="head">
            <div class="info">
                <h1>Profil</h1>
            </div>
            <div class="search">
            </div>
        </div>
        <div class="content">
            <div class="row-fluid">
                <div class="span12">
                    <div class="block">
                        <div class="head">
                            <h2>Ubah Profil</h2>
                        </div>
                        <% using (Html.BeginForm("Edit", "profil", FormMethod.Post, new { enctype = "multipart/form-data" }))
                           { %>
                        <%: Html.ValidationSummary(true) %>
                        <%: Html.HiddenFor(model=>model.content_id) %>
                        <%: Html.HiddenFor(model=>model.content_type) %>
                        <%: Html.HiddenFor(model=>model.user_id) %>
                        <%: Html.HiddenFor(model=>model.url) %>
                        <%: Html.HiddenFor(model=>model.content_time) %>
                        <div class="content np">
                            <div class="controls-row">
                                <div class="span1">
                                    Nama :
                                </div>
                                <div class="span8">
                                    <%: Html.EditorFor(model => model.content_name) %>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.content_name) %></span>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span1">
                                    Gambar :
                                </div>
                                <div class="span8">
                                    <input type="file" accept="image/jpeg" name="file" id="file" />
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
                                            <%: Html.HiddenFor(model => model.content, new {id="konten"})%>
                                            <%: Html.ValidationMessageFor(model => model.content)%>
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
