function trim(str, chars) {
    return ltrim(rtrim(str, chars), chars);
}

function ltrim(str, chars) {
    chars = chars || "\\s";
    return str.replace(new RegExp("^[" + chars + "]+", "g"), "");
}

function rtrim(str, chars) {
    chars = chars || "\\s";
    return str.replace(new RegExp("[" + chars + "]+$", "g"), "");
}

function FillAlias() {
    $('#txtalias').val($('#txtname').val().trim());
}

function trim(stringToTrim) {
    return stringToTrim.replace(/^\s+|\s+$/g, "");
}
function ltrim(stringToTrim) {
    return stringToTrim.replace(/^\s+/, "");
}
function rtrim(stringToTrim) {
    return stringToTrim.replace(/\s+$/, "");
}

function setCookie(c_name, value, exdays) {
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var c_value = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toUTCString());
    document.cookie = c_name + "=" + c_value;
}

function getCookie(c_name) {
    var i, x, y, ARRcookies = document.cookie.split(";");
    for (i = 0; i < ARRcookies.length; i++) {
        x = ARRcookies[i].substr(0, ARRcookies[i].indexOf("="));
        y = ARRcookies[i].substr(ARRcookies[i].indexOf("=") + 1);
        x = x.replace(/^\s+|\s+$/g, "");
        if (x == c_name) {
            return unescape(y);
        }
    }
}

function pad(number, length) {

    var str = '' + number;
    while (str.length < length) {
        str = '0' + str;
    }

    return str;

}

function dummyFunction() { }

function PopulateControl(controlId, list) {
    if (document.getElementById(controlId) != null) {
        var numberOfOptions = $get(controlId).options.length
        for (i = 0; i < numberOfOptions; i++) {
            $get(controlId).remove(0)
        }
        if (list != null) {
            for (var i = 0; i < list.length; i++) {
                var theOption = new Option;
                theOption.text = list[i].Text;
                theOption.value = list[i].Value;
                $get(controlId).options[i] = theOption;
                if (list[i].DefaultValue == list[i].Value) {
                    $get(controlId).options[i].selected = true;
                    $get(controlId).value = list[i].Value;
                }
            }
        }
    }
}

function PopulateGridControl(controlId, list,DefaultValue) {
    if (document.getElementById(controlId) != null) {
        var numberOfOptions = $get(controlId).options.length
        for (i = 0; i < numberOfOptions; i++) {
            $get(controlId).remove(0)
        }
        // alert(list.length);
        for (var i = 0; i < list.length; i++) {
            var theOption = new Option;
            //  alert(list[i].Value);
            theOption.text = list[i].Value;
            theOption.value = list[i].ID;
            $get(controlId).options[i] = theOption;
            if (DefaultValue == list[i].ID) {
                $get(controlId).options[i].selected = true;
                $get(controlId).value = list[i].ID;
            }
        }
    }
}

(function ($) {
    $.QueryString = (function (a) {
        if (a == "") return {};
        var b = {};
        for (var i = 0; i < a.length; ++i) {
            var p = a[i].split('=');
            if (p.length != 2) continue;
            b[p[0]] = decodeURIComponent(p[1].replace(/\+/g, " "));
        }
        return b;
    })(window.location.search.substr(1).split('&'))
})(jQuery);
