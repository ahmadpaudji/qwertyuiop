<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<IEnumerable<E_Sosial.Models.bencana>>" %>

<%int i = 1; foreach (var item in Model)
                              { %>
                            <tr>
                                <td><%: i++ %></td>
                                <td><% var konten = Regex.Replace(item.isi, @"<[^>]*>", String.Empty);
                                       if (konten.Length > 20)
                                       { %>
                                    <%: konten.Substring(0,20)%>...
                                                <% }
                                                else
                                                { %>
                                    <%: konten %>
                                    <% } %></td>
                                <td><%: item.lokasi %></td>
                                <td><a href="#">
                                    <button>Donasi</button></a></td>
                            </tr>
                            <% } %>