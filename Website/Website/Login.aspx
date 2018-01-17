<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Website.Login" %>

<%@ Import Namespace="System.Web.Optimization" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>ETH | Login</title>

    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="<%=ResolveUrl("~") %>Components/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="<%=ResolveUrl("~") %>Components/bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="<%=ResolveUrl("~") %>Components/bower_components/Ionicons/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="<%=ResolveUrl("~") %>Components/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
    folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="<%=ResolveUrl("~") %>Components/dist/css/skins/_all-skins.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="<%=ResolveUrl("~") %>Components/plugins/iCheck/square/blue.css">

    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Font Awesome CDM -->
    <%--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />--%>
    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition login-page">
    <form id="form1" runat="server">
        <div class="login-box">
            <div class="login-logo">
                <a href="<%=ResolveUrl("~") %>/default"><b>My</b>Office</a>
            </div>
            <!-- /.login-logo -->
            <div class="login-box-body">
                <p class="login-box-msg">Sign in to start your session</p>
                <div class="form-group has-feedback">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Email"></asp:TextBox>
                    <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Password"></asp:TextBox>
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                </div>
                <div class="row">
                    <div class="col-xs-8">
                        <a href="<%=ResolveUrl("~") %>/forgot">I forgot my password</a>
                    </div>
                    <!-- /.col -->
                    <div class="col-xs-4">
                        <asp:Button ID="btnSubmit" runat="server" Text="Sign In" OnClientClick="return SubmitsEncry();"
                            OnClick="btnSubmit_Click" CssClass="btn btn-primary btn-block btn-flat" />
                    </div>
                    <!-- /.col -->
                </div>
                <br>
            </div>
            <!-- /.login-box-body -->
        </div>
        <!-- /.login-box -->
    </form>
</body>

<!-- jQuery 3 -->
<script src="<%=ResolveUrl("~") %>Components/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="<%=ResolveUrl("~") %>Components/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="<%=ResolveUrl("~") %>Components/bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="<%=ResolveUrl("~") %>Components/dist/js/adminlte.min.js"></script>
<!-- iCheck -->
<script src="<%=ResolveUrl("~") %>Components/plugins/iCheck/icheck.min.js"></script>
<!-- AES Encryption -->
<script src="<%=ResolveUrl("~") %>Components/plugins/encryption/aes.js"></script>

<script>

    function SubmitsEncry() {
        var txtUserName = document.getElementById("<%=txtEmail.ClientID %>").value.trim();
        var txtpassword = document.getElementById("<%=txtPassword.ClientID %>").value.trim();

        if (txtUserName == "") {
            alert('Please enter UserName');
            return false;
        }
        else if (txtpassword == "") {
            alert('Please enter Password');
            return false;
        }
        else {
            var key = CryptoJS.enc.Utf8.parse('8080808080808080');
            var iv = CryptoJS.enc.Utf8.parse('8080808080808080');

            var encryptedpassword = CryptoJS.AES.encrypt(CryptoJS.enc.Utf8.parse(txtpassword), key,
            {
                keySize: 128 / 8,
                iv: iv,
                mode: CryptoJS.mode.CBC,
                padding: CryptoJS.pad.Pkcs7
            });

            document.getElementById("<%=txtPassword.ClientID %>").value = encryptedpassword;
        }
}

$(function () {
    $('input').iCheck({
        checkboxClass: 'icheckbox_square-blue',
        radioClass: 'iradio_square-blue',
        increaseArea: '20%' /* optional */
    });
});
</script>
</html>
