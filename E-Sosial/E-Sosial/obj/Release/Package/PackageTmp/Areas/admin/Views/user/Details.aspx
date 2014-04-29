<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.user>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Profil
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="wrap">
        <div class="head">
            <div class="info">
                <h1></h1>
            </div>
            <div class="side fr">
                <%: Html.ActionLink("Ubah", "Edit", new { id=Model.id_user}, new { @class = "btn btn-primary" })%>
            </div> 
            <div class="search">
            </div>
        </div>
        <div class="content">
            <div class="row-fluid">
                <div class="span12">
                    <div class="block">
                        <div class="head">
                            <h2>Profil User</h2>
                        </div>
                        <div class="content np">
                            <div class="controls-row">
                                <div class="span4">
                                    <a href="<%: Url.Action("EditFoto", new { id=Model.id_user })%>"><img width="50" height="50" src="<%: Url.Content(ViewBag.fotoUser) %>" class="img-polaroid" style="margin-bottom: 5px;" /></a>
                                </div>
                            </div>      
                            <div class="controls-row">
                                <div class="span2">Name:</div>
                                <div class="span6">
                                    <%: Html.DisplayFor(model=>model.nama) %></div>
                            </div>
                            <div class="controls-row">
                                <div class="span2">E-mail:</div>
                                <div class="span6">
                                    <%: Html.DisplayFor(model=>model.email) %></div>
                            </div>
                            <div class="controls-row">
                                <div class="span2">Telepon:</div>
                                <div class="span6">
                                    <%: Html.DisplayFor(model=>model.hp) %></div>
                            </div>
                            <div class="controls-row">
                                <div class="span2">Alamat:</div>
                                <div class="span6">
                                    <%: Html.DisplayFor(model=>model.alamat) %></div>
                            </div>
                            <div class="controls-row">
                                <div class="span2">Tanggal Daftar</div>
                                <div class="span6">
                                    <%: Html.DisplayFor(model=>model.tanggal) %></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
