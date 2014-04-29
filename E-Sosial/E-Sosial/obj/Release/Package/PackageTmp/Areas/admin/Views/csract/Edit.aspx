<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.Areas.admin.Models.CSRactCreate>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Aktifitas CSR
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="wrap">
        <div class="head">
            <div class="info">
                <h1>Aktifitas CSR</h1>
            </div>
            <div class="search">
            </div>
        </div>
        <div class="content">
            <div class="row-fluid">
                <div class="span12">
                    <div class="block">
                        <div class="head">
                            <h2>Ubah Aktifitas CSR</h2>
                        </div>
                        <% using (Html.BeginForm("Edit", "csract", FormMethod.Post, new { enctype = "multipart/form-data" }))
                           { %>
                        <%: Html.ValidationSummary(true) %>
                        <div class="content np">
                            <div class="controls-row">
                                <div class="span2">
                                    Aktifitas :
                                </div>
                                <div class="span8">
                                    <%: Html.DropDownList("csr_ph_id",(IEnumerable<SelectListItem>)ViewBag.csr_ph) %>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span2">
                                    Gambar :
                                </div>
                                <div class="span8">
                                    <input type="file" accept="image/jpeg" name="gambar" id="gambar" class="uni" />
                                    <%: Html.ValidationMessageFor(model=>model.gambar) %>
                                </div>
                            </div>
                            <div class="controls-row">
                                <div class="span12">

                                    <div class="block">
                                        <div class="head">
                                            <h2>Deskripsi Aktifitas</h2>
                                        </div>
                                        <div class="content np">
                                            <textarea id="clEditor" class="nm nb input-block-level"></textarea>
                                            <%: Html.HiddenFor(model => model.csr_activity_content, new {id="konten"})%>
                                            <%: Html.ValidationMessageFor(model => model.csr_activity_content)%>
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
