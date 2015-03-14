﻿var loginopen = false;
function validateEmail(email) {
    var re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}
function genclick() {
    if (loginopen) {
        hidelogin();
    }
}
function showlogin() {
    $('#login_box').css("display", "block");
    $('#login_box').animate({ marginTop: "0px", opacity: 1 }, 600, function () {
        $('#username_box').focus();
        loginopen = true;
    });
    ResetLogin();
}
function hidelogin() {
    $('#login_box').animate({ marginTop: "-140px", opacity: 0 }, 600, function () {
        $('body').focus();
        $('#password_box').val("");
        $('#login_box').css("display", "none");
        loginopen = false;
    });
}
$('#username_box').on('focus', function () {
    ResetLogin(); 
});
$('#password_box').on('focus', function () {
    ResetLogin();
});
$("#loginbtn").on("click", function () {
    if (!($('#username_box').val() == "" || $('#username_box').val().length < 4 || $('#username_box').val().length > 16)) {
        if (!(validateEmail($('#username_box').val()))) { 
            ShowLoginErr("Email is not valid");
            $('#username_box').animate({ "border-color": "#ff0000", "color": "#f00" }, 600);
            return;
        }
        var parms = {
            uname: $('#username_box').val(),
            password: $('#password_box').val()
        };
        $.ajax({
            type: "POST",
            url: "../operators/loginreq.aspx",
            async: false,
            data: parms,
            traditional: true,
            dataType: "json",
            success: function (data) {
                if (data == "1") {
                    hidelogin();
                    $('#logerrdiv').css('display', 'none');
                    return;
                } 
                ShowLoginErr("Login Failed"); 
            },
            error: function (data) {
                ShowLoginErr("Connection Error");  
            }
        });
    }
    else {
        ShowLoginErr("UserName or Password is invalid"); 
        $('#username_box').animate({ "border-color": "#ff0000", "color": "#f00" }, 600);
        $('#password_box').animate({ "border-color": "#ff0000", "color": "#f00" }, 600);
    }
}); 
function ShowLoginErr(text) {
    $('#logerrdiv').html("UserName or Password is not valid.");
    $('#logerrdiv').css('display', 'block');
    $('#logerrdiv').animate({ opacity: 1 }, 300, function () { return; });
}
function HideLoginErr() {
    $('#logerrdiv').animate({ opacity: 0 }, 300, function () {
        $('#logerrdiv').css('display', 'none');
    });
}
function ResetLogin() { 
    HideLoginErr();
    $('#username_box').animate({ "border-color": "#ccc", "color":"#000" }, 300);
    $('#password_box').animate({ "border-color": "#ccc", "color": "#000" }, 300);
}