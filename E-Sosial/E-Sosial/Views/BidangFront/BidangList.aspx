<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<IEnumerable<E_Sosial.Models.bidangFront>>" %>

<%foreach(var item in Model)
{
 if (item.judul.Length > 23)
 {
%>
    <li><%: Html.ActionLink(item.judul, "Bidang", "BidangFront", new { id = item.judul }, new { })%><br /></li>
<% } else {  %>
    <li><%: Html.ActionLink(item.judul, "Bidang", "BidangFront", new { id = item.judul }, new { })%></li>
<% } } %>