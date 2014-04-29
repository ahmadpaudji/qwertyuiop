<%--<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<E_Sosial.user>>" %>--%>
<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/content.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<E_Sosial.t_kesejahteraan>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Beranda
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

   <div class="wrap">
        <div class="head">
            <div class="info">
                <h1>Beranda</h1>
            </div>
            <div class="search">
            </div>
        </div>
       <div class="content">
           <div class="row-fluid">
               <div class="span6">
                   <div class="block">
                       <div class="head">
                           <h2>Statistik</h2>
                           <ul class="buttons">
                               <li><a href="#" class="block_toggle"><span class="i-arrow-down-3"></span></a></li>
                           </ul>
                       </div>
                       <div class="content np">
                           <table cellpadding="0" cellspacing="0" width="100%" class="list">
                               <thead>
                                   <tr>
                                       <th>Nama Data</th>
                                       <th width="99">Jumlah</th>
                                   </tr>
                               </thead>
                               <tbody>
                                   <% if (Roles.IsUserInRole("super_admin"))
                                      { %>
                                   <tr>
                                       <td><%: Html.ActionLink("User","Index","user") %></td>
                                       <td><span class="price"><%: ViewBag.user %></span></td>
                                   </tr>
                                   <% } %>
                                   <tr>
                                       <td><%: Html.ActionLink("Berita","Index","berita") %></td>
                                       <td><span class="price"><%: ViewBag.berita %></span></td>
                                   </tr>
                                   <tr>
                                       <td><%: Html.ActionLink("Donatur","Index","donatur" )%></td>
                                       <td><span class="price"><%: ViewBag.donatur %></span></td>
                                   </tr>
                                   <tr>
                                       <td><%: Html.ActionLink("Download","Index","download" )%></td>
                                       <td><span class="price"><%: ViewBag.download %></span></td>
                                   </tr>
                                   <tr>
                                       <td>V-Prog</td>
                                       <td><span class="price">37</span></td>
                                   </tr>
                               </tbody>
                               <tfoot>
                                   <tr>
                                       <td colspan="2" align="right">

                                       </td>
                                   </tr>
                               </tfoot>
                           </table>
                       </div>
                   </div>
               </div>
               <div class="span6 scCol">
                   <div class="widgets">
                       <a class="button text-success" href="#">
                           <div class="icon">
                               <span class="mChartBar" sparktype="pie" sparkwidth="30" sparkheight="30"><%: ViewBag.today %>,<%: ViewBag.month %>,<%: ViewBag.year %></span>
                           </div>
                           <div class="info">
                               <span>Visitors</span>
                               <p>Hari ini: <%: ViewBag.today %>; Bulan ini: <%: ViewBag.month %>;</p>
                               <p>Tahun ini: <%: ViewBag.year %>;</p>
                           </div>
                       </a>

                   </div>
               </div>
                <div class="span6 scCol">
                   <div class="widgets">
                       <a class="button text-success" href="#">
                           <div class="icon">
                               <span class="mChartBar" sparktype="pie" sparkwidth="30" sparkheight="30"><%: ViewBag.todayHit %>,<%: ViewBag.monthHit %>,<%: ViewBag.yearHit %></span>
                           </div>
                           <div class="info">
                               <span>Hits</span>
                               <p>Hari ini: <%: ViewBag.todayHit %>; Bulan ini: <%: ViewBag.monthHit %>;</p>
                               <p>Tahun ini: <%: ViewBag.yearHit %>;</p>
                           </div>
                       </a>

                   </div>
               </div>
           </div>
           <div class="row-fluid">
               <div class="span12">
                   <div class="block">
                       <div class="head">
                           <h2>Data PMKS</h2>
                       </div>
                       <div class="content">
                           <div id="pmks" style="height: 300px; margin-top: 10px;"></div>
                           <script type="text/javascript">
                               (function ($) {
                                   var i =0
                                   var series = [{
                                       data: [
                                           <% int i = 1; foreach (var item in Model.Where(m=>m.ks_type == "PMKS" && m.ks_year == DateTime.Today.Year)) { %>
                                           [<%: i++ %>, <%: Html.DisplayFor(modelItem => item.ks_jumlah) %>],
                                           <% } %>
                                       ],
                                       label : 'Tahun <%: DateTime.Today.Year %>'
                                   }];

                                   var options = {
                                       xaxis: {
                                           ticks: [
                                               <% int x = 1; foreach (var item in Model.Where(m => m.ks_type == "PMKS" && m.ks_year == DateTime.Today.Year))
                                                  { %>
                                               [<%: x++ %>, '<%: Html.DisplayFor(modelItem => item.ks_name) %>'],
                                               <% } %>
                                           ]
                                       },
                                       series: {
                                           bars: {
                                               show: true,
                                               barWidth: .9,
                                               align: "center"
                                           },
                                           stack: 0
                                       }
                                   };

                                   $.plot("#pmks", series, options);
                               })(jQuery);
                           </script>
                       </div>
                   </div>
               </div>

           </div>   
           <div class="row-fluid">
               <div class="span12">
                   <div class="block">
                       <div class="head">
                           <h2>Data PSKS</h2>
                       </div>

                       <div class="content">
                           <div id="psks" style="height: 300px; margin-top: 10px;"></div>
                           <script type="text/javascript">
                               (function ($) {
                                   var i =0
                                   var series = [{
                                       data: [
                                           <% foreach (var item in Model.Where(m=>m.ks_type == "PSKS" && m.ks_year == DateTime.Now.Year)) { %>
                                           [<%: i++ %>, <%: Html.DisplayFor(modelItem => item.ks_jumlah) %>],
                                           <% } %>
                                       ],
                                       label : 'Tahun <%: DateTime.Now.Year %>'
                                   }];

                                   var options = {
                                       xaxis: {
                                           ticks: [
                                               <% foreach (var item in Model.Where(m => m.ks_type == "PSKS" && m.ks_year == DateTime.Now.Year)) { %>
                                               [<%: x++ %>, '<%: Html.DisplayFor(modelItem => item.ks_name) %>'],
                                               <% } %>
                                           ]
                                       },
                                       series: {
                                           bars: {
                                               show: true,
                                               barWidth: .9,
                                               align: "center"
                                           },
                                           stack: 0
                                       }
                                   };

                                   $.plot("#psks", series, options);
                               })(jQuery);
                           </script>
                       </div>
                   </div>
               </div>

           </div>   
       </div>
    </div>

</asp:Content>
