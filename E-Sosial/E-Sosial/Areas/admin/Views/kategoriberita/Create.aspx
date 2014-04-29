<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.t_news_category>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Kategori Berita
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="wrap">
        <div class="head">
            <div class="info">
                <h1>Kategori Berita</h1>
            </div>
            <div class="search">
            </div>
        </div>
        <div class="content">
            <div class="row-fluid">
                <div class="span6">
                    <div class="block">
                        <div class="head">
                            <h2>Tambah Kategori Berita</h2>
                        </div>
                        <% using (Html.BeginForm()) { %>
                        <%: Html.ValidationSummary(true) %>
                        <div class="content np">
                            <div class="controls-row">
                                <div class="span4">
                                    Nama :
                                </div>
                                <div class="span8">
                                    <%: Html.TextBoxFor(model => model.category_title) %>
                                    <span class="help-inline"><%: Html.ValidationMessageFor(model => model.category_title) %></span>
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
