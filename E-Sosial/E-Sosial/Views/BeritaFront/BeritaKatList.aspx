<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<IEnumerable<E_Sosial.Models.BeritaKat>>" %>

<% foreach (var item in Model) { %>
<li><a href="#"><%: item.kategori %></a></li>
<% } %>