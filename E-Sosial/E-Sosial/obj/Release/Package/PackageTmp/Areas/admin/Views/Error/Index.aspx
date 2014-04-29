<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>

<html>
<head>        
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />    
    <!--[if gt IE 8]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />        
    <![endif]-->                
    <title>404 Not Found</title>
    
    <link href="/Areas/admin/css/stylesheets.css" rel="stylesheet" type="text/css" />
    
    <!--[if lte IE 7]>
        <script type='text/javascript' src='js/other/lte-ie7.js'></script>
    <![endif]-->    
    
    <script type='text/javascript' src='/Areas/admin/js/jquery/jquery-2.0.0.min.js'></script>
    <script type='text/javascript' src='/Areas/admin/js/jquery/jquery-ui-1.10.3.custom.min.js'></script>
    <script type='text/javascript' src='/Areas/admin/js/jquery/jquery-migrate-1.1.1.min.js'></script>
    <script type='text/javascript' src='/Areas/admin/js/jquery/globalize.js'></script>
    
    <script type='text/javascript' src='/Areas/admin/js/bootstrap/bootstrap.min.js'></script>
    <script type='text/javascript' src='/Areas/admin/js/cookies/jquery.cookies.2.2.0.min.js'></script>
    
    <script type='text/javascript' src='/Areas/admin/js/scrollup/jquery.scrollUp.min.js'></script>
    
    <script type='text/javascript' src='/Areas/admin/js/plugins.js'></script>    
    <script type='text/javascript' src='/Areas/admin/js/actions.js'></script>
</head>
<body>        
    <div id="wrapper" class="screen_wide sidebar_off">       
        <div id="layout">
            <div id="content">                        
                <div class="wrap nm">
                    <div class="errorPage">        
                        <p class="name">404</p>
                        <p class="description">Not Found</p>        
                        <p><button class="btn btn-primary" onClick="document.location.href = '<%: Url.Action("Index","Home") %>';">Back to main</button> <button class="btn" onClick="history.back();">Previous page</button></p>        
                    </div>                    
                    
                </div>
            </div>
        </div>               
        
    </div>
    
</body>

<!-- Mirrored from aqvatarius.com/themes/leo_v12/sample_error_404.html by HTTrack Website Copier/3.x [XR&CO'2010], Tue, 26 Nov 2013 09:50:34 GMT -->
</html>
