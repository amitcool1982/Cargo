<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Cargo.Login" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="utf-8">
    <title>Login LionExpress Administration System</title>
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Bootstrap, a sleek, intuitive, and powerful mobile first front-end framework for faster and easier web development.">
    <meta name="keywords" content="HTML, CSS, JS, JavaScript, framework, bootstrap, front-end, frontend, web development">

    <!-- Bootstrap core CSS -->
    <link href="Content/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->    
    <link href="Content/signin.css" rel="stylesheet" />

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="../Scripts/jquery-1.9.1.min.js"></script>

    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script type="text/javascript"  src="../Scripts/DT_bootstrap.js"></script>
   
    <script type="text/javascript" src="../Scripts/Login/Login.js"></script>
</head>
<body>
    <div id="wrap">
        <div class="container">

            <form id="form1" runat="server" class="form-signin" action="javascript:dummyFunction();">
                <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="7200"
                    EnablePageMethods="true" AsyncPostBackErrorMessage="Failed to Call WebService"
                    ScriptMode="Auto">
                    <Scripts>
                        <asp:ScriptReference Path="~/Scripts/Synchronous.js" />
                        <asp:ScriptReference Path="~/Scripts/XMLHttpSyncExecutor.js" />
                    </Scripts>
                </asp:ScriptManager>
                <h3 class="form-signin-heading text-center">
                    <img src="images/logo_2.png"></h3>
                <input id="txtLoginID" name="txtLoginID" class="form-control" placeholder="Username" required="" autofocus="" type="text">
                <input id="txtPassword" name="txtPassword" class="form-control" placeholder="Password" required="" type="password">
                <label class="checkbox">
                    <input id="chkRemember" name="chkRemember" type="checkbox">
                    Keep me login
                </label>
                <button class="btn btn-lg btn-danger" style="width: 100%;" type="submit" onclick="javascript:ValidateLogin();">Log in</button>
                <div class="alert alert-warning" style="margin-top: 10px;">
                    <strong>Your session time has been expired, please re-login.</strong>
                </div>

            </form>
        </div>
        <!-- /container -->
    </div>
    <div id="footer">
        <div class="container">
            <p class="text-muted credit">cargo-express.com Administrator System V.1.0 developed by <a href="http://totalit.co.id/">Total Solusi Teknologi</a>.</p>
        </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!--<script src="http://admin.cargo.totalit.co.id/openbox/js/jquery.min.js"></script>

    <!-- Placed at the end of the document so the pages load faster -->


</body>
</html>

