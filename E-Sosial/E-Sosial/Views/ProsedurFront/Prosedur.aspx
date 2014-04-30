<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Front.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.Models.prosedur>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="blog column c-2 clearfix">
        <!-- Profil -->
        <h3>Prosedur</h3>
        <br>
        <div class="box">
            <h4><%: Html.DisplayFor(model=>model.nama) %></h4>
            <div class="boxInfo examInfo">
                <ul>
                    <li class="proExm"><a href="#"><%: Html.DisplayFor(model=>model.user) %></a></li>
                    <li class="dateExm"><%: Html.DisplayFor(model=>model.tanggal) %></li>
                    <li style="background-position: -30px -200px;"></li>
                    <li style="background-position: -30px -200px;"></li>
                </ul>

                <div>
                    <%: Html.Raw(Model.isi) %>
                    <% if (ViewBag.gambar != null) { %>
                    <img src="<%: ViewBag.gambar %>" />
                    <% } %>
                </div>
                <% if (ViewBag.file != null) { %>
                <p style="text-align: right;">Link : <%: Html.ActionLink("Download", "download", new { id = ViewBag.file })%></p>
                <% } %>
            </div>
        </div>
    </div>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Slider" runat="server">
</asp:Content>
