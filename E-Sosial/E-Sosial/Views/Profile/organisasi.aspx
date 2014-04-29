<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Front.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<E_Sosial.Models.organisasi>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="blog column c-2 clearfix">
        <!-- NEWS -->
        <h3>Profil</h3>
        <br>
        <div class="box">
            <a href="#">
                <h4>Struktur Organisasi</h4>
            </a>
            <div class="boxInfo examInfo">
                <ul>
                    <li style="background-position: -30px -200px;"></li>
                    <li style="background-position: -30px -200px;"></li>
                </ul>
                <div>
                    <a title="Struktur Organisasi" class="gHover" href="/img/struktur_organisasi.jpg" rel="lightbox">
                        <img class="fwidth" src="/img/struktur_organisasi.jpg" alt="">
                    </a>
                </div>
            </div>
        </div>
        <br>
        <table width="100%">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Foto</th>
                    <th width="40%">Nama</th>
                    <th width="50%">Jabatan</th>
                </tr>
            </thead>
            <tbody>
                <% int i = 1; foreach (var item in Model) { %>
                <tr>
                    <td><%: i++ %></td>
                    <td>
                        <img src="<%: Url.Content(item.gambar) %>" class="imgBorder" style="margin: 5px;"></td>
                    <td><%: Html.DisplayFor(modelItem=>item.nama) %></td>
                    <td><%: Html.DisplayFor(modelItem=>item.jabatan) %></td>
                    <td></td>

                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Slider" runat="server">
</asp:Content>
