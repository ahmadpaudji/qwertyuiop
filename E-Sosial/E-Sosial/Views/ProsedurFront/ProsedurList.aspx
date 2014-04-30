<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<IEnumerable<E_Sosial.Models.prosedur>>" %>

<% foreach(var item in Model) {
    if (item.nama.Length > 26)
    { %>
        <li><%: Html.ActionLink(item.nama, "Prosedur", "ProsedurFront", new { id = item.nama }, new { })%><br /></li>
<% } else {  %>
        <li><%: Html.ActionLink(item.nama, "Prosedur", "ProsedurFront", new { id = item.nama }, new { })%></li>
<% } } %>