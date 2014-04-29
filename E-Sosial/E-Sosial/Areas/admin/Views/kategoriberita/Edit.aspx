<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.t_news_category>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<%--<h2>Edit</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>

    <fieldset>
        <legend>t_news_category</legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.news_category_id) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.news_category_id) %>
            <%: Html.ValidationMessageFor(model => model.news_category_id) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.user_id) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.user_id) %>
            <%: Html.ValidationMessageFor(model => model.user_id) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.category_title) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.category_title) %>
            <%: Html.ValidationMessageFor(model => model.category_title) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.category_date) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.category_date) %>
            <%: Html.ValidationMessageFor(model => model.category_date) %>
        </div>

        <p>
            <input type="submit" value="Save" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Back to List", "Index") %>
</div>--%>

    
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
                            <h2>Ubah Kategori Berita</h2>
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
