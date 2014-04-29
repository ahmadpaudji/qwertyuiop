<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Front.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.Models.profile>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Slider" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
          
    <div class="blog column c-2 clearfix">

        <h3>Program Kerja</h3>
        <br>
        <div class="box">
            <a href="berita_readmore.html">
                <h4><%: Html.DisplayFor(model=>model.judul) %></h4>
            </a>
            <div class="boxInfo examInfo">
                <ul>
                    <li class="proExm"><%: Html.DisplayFor(model=>model.user) %></li>
                    <li class="dateExm"><%: Html.DisplayFor(model=>model.tanggal) %></li>
                    <li style="background-position: -30px -200px;"></li>
                </ul>
                <div>
                    <%: Html.Raw(Model.isi) %>
                </div>
            </div>
        </div>
    </div> <!-- END  -->  
</asp:Content>
