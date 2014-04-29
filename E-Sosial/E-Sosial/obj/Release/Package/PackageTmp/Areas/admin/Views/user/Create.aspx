<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.user>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Create</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>

    <fieldset>
        <legend>user</legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.id_user) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.id_user) %>
            <%: Html.ValidationMessageFor(model => model.id_user) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.username) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.username) %>
            <%: Html.ValidationMessageFor(model => model.username) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.user_password) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.user_password) %>
            <%: Html.ValidationMessageFor(model => model.user_password) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.user_passwordsalt) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.user_passwordsalt) %>
            <%: Html.ValidationMessageFor(model => model.user_passwordsalt) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.nama) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.nama) %>
            <%: Html.ValidationMessageFor(model => model.nama) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.email) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.email) %>
            <%: Html.ValidationMessageFor(model => model.email) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.hp) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.hp) %>
            <%: Html.ValidationMessageFor(model => model.hp) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.alamat) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.alamat) %>
            <%: Html.ValidationMessageFor(model => model.alamat) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.tanggal) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.tanggal) %>
            <%: Html.ValidationMessageFor(model => model.tanggal) %>
        </div>

        <p>
            <input type="submit" value="Create" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Back to List", "Index") %>
</div>

</asp:Content>
