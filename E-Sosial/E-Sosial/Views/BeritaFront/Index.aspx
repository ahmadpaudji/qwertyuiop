<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Front.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<E_Sosial.Models.berita>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="blog column c-2 clearfix">
        <!-- NEWS -->
        <h3>Berita Terkini</h3>
        <br>
        <% foreach (var item in Model) { %>
        <div class="box">
            <h4><%: Html.DisplayFor(modelItem => item.judul) %></h4>
            <div class="boxInfo examInfo">
                <ul>
                    <li class="proExm"><%: Html.DisplayFor(modelItem=>item.user) %></li>
                    <li class="dateExm"><%: Html.DisplayFor(modelItem=>item.tanggal) %></li>
                    <li style="background-position: -30px -200px;"></li>
                </ul>
                <div>
                    <img class="fwidth" src="<%: Url.Content(item.gambar) %>" alt="">
                    <% var konten = Regex.Replace(item.isi, @"<[^>]*>", String.Empty);
                       if (konten.Length > 100)
                       { %>
                    <p><%: konten.Substring(0,95)%>... </p>
                    <% } else { %>
                    <p><%: konten %> </p>
                    <% } %>
                    <br>
                    <p style="text-align: right;"><%: Html.ActionLink("Read More..", "Details", new { id = item.id })%> </p>
                </div>
            </div>
        </div>
        <% } %>

        <ul class="pgNr">
            <li><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">></a></li>
        </ul>
    </div>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Slider" runat="server">
</asp:Content>
