function ValidateLogin() {
    try {
        $("#divsessionexpired").hide();
        if ($.trim($("#txtLoginID").val()).length == 0 || $.trim($("#txtPassword").val()).length == 0) {

            if ($.trim($("#txtLoginID").val()).length == 0) {
                $('#errormsg').text("Username is required");
                $("#divsessionexpired").show();
            }
            else if ($.trim($("#txtPassword").val()).length == 0) {
                $('#errormsg').text("Password is required");
                $("#divsessionexpired").show();
            }
        }
        else {
            var RememberMe = false;
            if ($("#chkRemember")[0].checked == true) {
                RememberMe = true;
            }

                                          

            var res = ExecuteSynchronously('Login.aspx', 'ValidateLogin', { LoginId: $("#txtLoginID").val().trim(), Password: $("#txtPassword").val().trim() });
            if (res.d == 1) {
                location.href = 'Dashboard.aspx';
                if (RememberMe == true) {
                    setCookie("LoginID", $("#txtLoginID").val().trim(), 20);
                    setCookie("Password", $("#txtPassword").val().trim(), 20);
                }
            }
            else if (res.d== 0) {
                $('#errormsg').text("UserName/Password combination is InCorrect");
                $("#divsessionexpired").show();
            }
        }
    }
    catch (e) {
        alert(e.message);
    }
}


function TryAutoLogin() {
    var res = ExecuteSynchronously('Login.aspx', 'ValidateLogin', { LoginId: getCookie("LoginID"), Password: getCookie("Password") });
    if (res.d == 1) {
        location.href = 'Dashboard.aspx';
    }
    else if (res.d == 0) {
        $('#errormsg').text("UserName/Password combination is InCorrect");
        $("#divsessionexpired").show();
    }
}

$(document).ready(function () {
    if (getCookie("LoginID") != undefined && getCookie("Password") != undefined) {
        TryAutoLogin();
    }

});

