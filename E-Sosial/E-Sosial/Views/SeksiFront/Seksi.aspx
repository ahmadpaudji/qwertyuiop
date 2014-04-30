<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Front.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.Models.seksi>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

         
    <div class="blog column c-2 clearfix">
        <div class="box">
            <h4><%: Html.DisplayFor(model=>model.judul) %></h4>
            
            <div class="boxInfo examInfo">
                <ul>
                    <li class="proExm"><%: Html.DisplayFor(model=>model.pj) %></li>
                    <li style="background-position: -30px -200px;"></li>
                </ul>
                <div>
                    <img src="<%: Url.Content(Model.foto) %>" />
                    <%: Html.Raw(Model.isi) %>
                    <br />
                    <% if (Url.Content(Model.gambar) != "Kosong") { %>
                    <div class="boxInfo examInfo">
                        <ul>
                            <li style="background-position: -30px -200px;"></li>
                        </ul>
                        <div>
                            <a title="Struktur Organisasi" class="gHover" href="<%: Url.Content(Model.gambar) %>" rel="lightbox">
                                <img class="fwidth" src="<%: Url.Content(Model.gambar) %>" alt="">
                            </a>
                        </div>
                    </div>
                    <% } %>
                    
                </div>
            </div>
        </div>
    </div> <!-- END  -->  
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Slider" runat="server">
</asp:Content>
