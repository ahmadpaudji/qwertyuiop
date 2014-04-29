<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/admin/Views/Shared/admin.Master" Inherits="System.Web.Mvc.ViewPage<E_Sosial.Areas.admin.Models.adminModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Login
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="signin_block">
        <div class="row-fluid">
            <div align="center"><img src='/Areas/admin/img/logologin.png' width="337"></div>
            <div class="alert alert-info">
                <strong>Mohon !</strong> Jangan beritahu username dan password anda
                                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
            <div class="block">
                <div class="head">
                    <h2>Login</h2>
                </div>

                <%using (Html.BeginForm())
                  { %>
                <%:Html.ValidationSummary(true)%>
                    <div class="content np">
                        <% if (ViewBag.error == 'y')
                           { %>
                        <div class="alert alert-error">
                            <strong>Login gagal !</strong> Username atau password salah.
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                        </div>
                        <% } %>
                        <div class="controls-row">
                            <div class="span3">Username :</div>
                            <div class="span9">
                                <%: Html.TextBoxFor(model => model.username)%>
                                <span class="help-inline"><%: Html.ValidationMessageFor(model => model.username)%></span>
                                
                            </div>
                        </div>
                        <div class="controls-row">
                            <div class="span3">Password:</div>
                            <div class="span9">
                                <%: Html.PasswordFor(model => model.password)%>
                                <span class="help-inline"><%: Html.ValidationMessageFor(model => model.password)%></span>
                            </div>
                        </div>
                    </div>
                    <div class="footer">
                        
                        <div class="side fr">
                            <button type="submit" class="btn btn-primary">Login</button>
                        </div>
                    </div>
                   <%} %>
            </div>
        </div>
    </div>
</asp:Content>
