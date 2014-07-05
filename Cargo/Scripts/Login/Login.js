function ValidateLogin() {
    try {
        cleardiv();
        if ($.trim($("#txtLoginID").val()).length == 0 || $.trim($("#txtPassword").val()).length == 0) {

            if ($.trim($("#txtLoginID").val()).length == 0) {
                $("#errordiv").append('<div class="alert alert-danger" style="visibility:visible;"><span aria-hidden="true" class="icon icon-warning-sign"></span>' + msgArray["LOGIN_LoginIDRequired"] + '</div>');
            }
            else if ($.trim($("#txtPassword").val()).length == 0) {
                $("#errordiv").append('<div class="alert alert-danger" style="visibility:visible;"><span aria-hidden="true" class="icon icon-warning-sign"></span>' + msgArray["LOGIN_PasswordRequired"] + '</div>');
            }
        }
        else {
            var RememberMe = false;
            if ($("#chkRemember")[0].checked == true) {
                RememberMe = true;
            }

            if (RememberMe == true) {
                setCookie("LoginID", $("#txtLoginID").val().trim(), 20);
                setCookie("Password", $("#txtPassword").val().trim(), 20);
            }
            var User = new Object();

            User.LoginId = $("#txtLoginID").val().trim();
            User.Password = $("#txtPassword").val().trim();

            var myDate = new Date();
            var FromDate = new Date(myDate.getFullYear(), myDate.getMonth(), myDate.getDate() - 1, myDate.getHours(), myDate.getMinutes(), myDate.getSeconds(), myDate.getMilliseconds())
            setCookie("PageToDate", myDate.getFullYear() + '-' + pad((myDate.getMonth() + 1), 2) + '-' + pad(myDate.getDate(), 2), 20);

            setCookie("PageFromDate", FromDate.getFullYear() + '-' + pad((FromDate.getMonth() + 1), 2) + '-' + pad(FromDate.getDate(), 2), 20);                        

            setCookie("Login", $("#txtLoginID").val(), 20);                       

            var res = ExecuteSynchronously('Login.aspx', 'ValidateLogin', { objUser: User });
            if (res.d.Status == 0) {
                location.href = 'Dashboard.aspx';
            }
            else if (res.d.Status == 1) {
                $("#errordiv").append('<div class="alert alert-danger" style="visibility:visible;"><span aria-hidden="true" class="icon icon-warning-sign"></span>' + res.d.ValidationMessage + '</div>');
            }
            else if (res.d.Status == 4) {
                $("#errordiv").append('<div class="alert alert-danger" style="visibility:visible;"><span aria-hidden="true" class="icon icon-warning-sign"></span>Dashboard redirection</div>');
            }
        }
    }
    catch (e) {
        alert(e.Message);
    }
}
function errormsg(msg) {
    $("#mydiv").append('<div class="alert alert-danger" style="visibility:visible;"><span aria-hidden="true" class="icon icon-warning-sign"></span>' + msg + '</div>');

}

function cleardiv() {
    $("#errordiv").empty();
}

function isvalid(obj) {
    var $password_input = $(obj);
    if ($password_input.length > 0) {

        $password_input.rules("add", {
            minlength: 7,
            maxlength: 15,
            // greaterThanZero: true,
            at_least_one_uppercase: true,
            at_least_one_lowercase: true,
            at_least_one_special: true,
            messages: {
                at_least_one_uppercase: jQuery.format(msgArray["LOGIN_PwdUpperCaseMsg"]),
                at_least_one_lowercase: jQuery.format(msgArray["LOGIN_PwdLowerCaseMsg"]),
                at_least_one_special: jQuery.format(msgArray["LOGIN_PwdSpecialCharMsg"]),
                minlength: jQuery.format(msgArray["LOGIN_PwdMinLengthMsg"]),
                maxlength: jQuery.format(msgArray["LOGIN_PwdMaxLengthMsg"])
            }
        });
    }
}

function checkCookie() {    
    var LoginID = getCookie("LoginID");
    var Password = getCookie("Password");
    if (LoginID != undefined && LoginID == $("#txtLoginID").val().trim()) {
        $("#txtPassword").val(Password.trim());
        $("#txtPassword").text(Password.trim());
    }
}

function LoadRecoverLoginModal() {
    $('#model2').empty();
    cleardiv();
    $('.empnumber').mask('00000000000000000000');
    $('#recover_login').modal('show');
}