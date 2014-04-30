<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<IEnumerable<E_Sosial.Models.seksi>>" %>

<% foreach(var item in Model)
{
%>
    <li><%: Html.ActionLink(item.judul, "Seksi", "SeksiFront", new { id = item.judul }, new { })%></li>
<% } %>