<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Front.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<E_Sosial.Models.beranda>>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Slider" runat="server">
                <div id="homeSlider" class="clearfix flexslider">
                <div class="thumbs"></div>
                <ul class="slides">
                    <li data-thumb="/img/slider/1st_thumb.jpg">
                        <img src="/img/slider/1st.jpg" alt="A Classroom"></li>
                    <li data-thumb="/img/slider/2nd_thumb.jpg">
                        <img src="/img/slider/2nd.jpg" alt="Just a different perspective over this new issue"></li>
                    <li data-thumb="/img/slider/3rd_thumb.jpg">
                        <img src="/img/slider/3rd.jpg" alt="A Classroom"></li>

                </ul>
                <ul class="captions">
                    <li>
                        <h3>Dinas Sosial Kota Bandung</h3>
                        <p>Website resmi Dinas Sosial Kota Bandung ini dibuat sebagai pelayanan kepada masyarakat kota Bandung untuk dapat melihat aktifitas dan informasi kegiatan yang ada di Dinsos kota Bandung.</p>

                    </li>
                    <li>
                        <h3>Bandung Juara </h3>
                        <p>Dengan semangat hari jadi ke 203, kita wujudkan Bandung Juara</p>
                    </li>
                    <li>
                        <h3>Misi Dinas Sosial Kota Bandung </h3>
                        <p>Mewujudkan kesejahteraan sosial melalui peningkatan partisipasi sosial dan masyarakat, dimana terdapat peran aktif dari masyarakat dalam penanganan masalah kesejahteraan sosial </p>
                    </li>


                </ul>
            </div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
            
    <div class="blog column c-2 clearfix">

        <!-- NEWS -->
        <h3>Berita Terkini</h3>
        <br>
        <% foreach (var item in Model)
           { %>
        <div class="box">
            <a href="berita_readmore.html">
                <h4><%: Html.DisplayFor(modelItem => item.judul) %></h4>
            </a>
            <div class="boxInfo examInfo">
                <ul>
                    <li class="proExm"><%: Html.DisplayFor(modelItem =>item.user) %></li>
                    <li class="dateExm"><%: Html.DisplayFor(modelItem =>item.date) %></li>
                    <li style="background-position: -30px -200px;"></li>
                </ul>
                <div>
                    <img class="fwidth" src="<%: Url.Content(item.gambar) %>" alt="">
                    <% var konten = Regex.Replace(item.konten, @"<[^>]*>", String.Empty);
                       if (konten.Length > 100)
                       { %>
                    <p><%: konten.Substring(0,95)%>... </p>
                    <% }
                                   else
                                   { %>
                    <p><%: konten %> </p>
                    <% } %>
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
        <div class="box">
            <a href="#">
                <h3>Donasi Bantuan Masyarakat</h3>
            </a>
            <div class="boxInfo examInfo">
                <div>
                    <table>
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Keterangan</th>
                                <th>Lokasi</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% Html.RenderAction("BencanaList","BencanaFront"); %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>


    </div> <!-- END  -->  
                
 <!-- ================  Conten Bawah ======================= -->                
                <div class="wrapper">
                    <div class="column c-3 clearfix">
                        <div class="box">
                            <h5>MOU CSR</h5>
                            <div class="boxInfo">
                                <a title="2014-03-20 15.47.45 Bantuan bencana bg kel.Pasteur, kel.Sindangjaya, kel.Sukaluyu3" class="gHover" href="img/events/foto_4.jpg" rel="lightbox"><img class="fwidth" src="img/events/foto_4.jpg" alt=""></a>
                                
                            </div>
                        </div>
                    </div>
                    <div class="column c-3 clearfix">
                        <div class="box">
                            <h5>Penyuluhan</h5>
                            <div class="boxInfo">
                                <a title="Penyampaian bantuan masyarakat Kota Bdg kpd Pemkab Cianjur " class="gHover" href="img/events/foto_1.jpg" rel="lightbox"><img class="fwidth" src="img/events/foto_1.jpg" alt=""></a>
                                
                            </div>
                        </div>
                    </div>
                    <div class="column c-3 clearfix">
                     <div class="box">
                              <h5>Bantuan Bencana</h5>
                            <div class="boxInfo">
                                <a title="2014-03-20 15.47.45 Bantuan bencana bg kel.Pasteur, kel.Sindangjaya, kel.Sukaluyu3" class="gHover" href="img/events/foto_2.jpg" rel="lightbox"><img class="fwidth" src="img/events/foto_2.jpg" alt=""></a>
                                
                            </div>
                        </div>
                    </div>
                    
                    <div class="column c-3 clearfix">
                        <div class="box">
                            <h5>Rapat Orsos</h5>
                            <div class="boxInfo">
                                <a title="Penyampaian bantuan masyarakat Kota Bdg kpd Pemkab Cianjur " class="gHover" href="img/events/foto_3.jpg" rel="lightbox"><img class="fwidth" src="img/events/foto_3.jpg" alt=""></a>
                                
                            </div>
                        </div>
                    </div>
                    
                    <div class="column c-3 clearfix">
                        <div class="box">
                            <h5>Kunjungan RPA</h5>
                            <div class="boxInfo">
                                <a title="2014-03-20 15.47.45 Kunjunagn RPA" class="gHover" href="img/events/foto_5.jpg" rel="lightbox"><img class="fwidth" src="img/events/foto_5.jpg" alt=""></a>
                                
                            </div>
                        </div>
                    </div>
                </div> 

</asp:Content>
