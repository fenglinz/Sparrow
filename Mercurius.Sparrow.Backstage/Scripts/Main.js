var winIndex = 0;

/**初始化**/
$(document).ready(function () {
    iframeresize();
});

/**自应高度**/
function iframeresize() {
    function resizeU() {
        var divkuangH = $(window).height();
        $("#sidebar").height(divkuangH - 48);
        $("#MainContent").height(divkuangH - 50);
    }

    resizeU();
    $(window).resize(resizeU);
}

// 链接内框架frames
function Navigator(url, target) {
    if (url != "" && url != "#") {
        NavMenuUrl(url, target);
    }
}

function OnSidebarItemClick(source, url, target) {
    NavMenuUrl(url, target);

    if (url != '#') {
        $('#sidebar li').removeClass('active').removeClass('selected');

        $(source).parent().addClass('active');
        $(source).parents('li.open').addClass('selected');
    }

    return false;
}

function NavMenuUrl(url, target) {
    if (url == '#') {
        return false;
    }

    mercurius.OnWaitProcess(function () {
        url = (url.indexOf("http") == 0 || url.indexOf(mercurius.BaseUrl) == 0) ? url : mercurius.BaseUrl + url;

        switch (target) {
            case "Iframe":
            case "href":
                $("#main").attr("src", url);

                break;

            case "Open":
                window.open(url, 'newwindow' + (winIndex++));

                break;
        }
    });

    return false;
}

/**安全退出**/
function OnLogOff() {
    top.mercurius.ShowConfirmMessage('确定要安全退出吗？', function (r) {
        window.location.href = mercurius.BaseUrl + '/Account/LogOff';
    });
}

function GetDateTime() {
    var todayDate = new Date();
    var date = todayDate.getDate();
    var month = todayDate.getMonth() + 1;
    var year = todayDate.getYear();
    var hours = todayDate.getHours();
    var minutes = todayDate.getMinutes();
    var seconds = todayDate.getSeconds();
    var msg = '';

    if (navigator.appVersion.indexOf("MSIE") != -1) {
        msg += year + '年';
    }
    else if (navigator.appName == "Netscape") {
        msg += (1900 + year) + '年';
    }

    if (month < 10) {
        msg += '0' + month + '月';
    }
    else {
        msg += month + '月';
    }
    if (date < 10) {
        msg += '0' + date + '日&nbsp;';
    }
    else {
        msg += date + '日&nbsp;';
    }
    if (minutes <= 9) {
        minutes = "0" + minutes;
    }
    if (seconds <= 9) {
        seconds = "0" + seconds;
    }

    //change font size here to your desire
    msg += "" + hours + ":" + minutes + ":" + seconds + '&nbsp;';

    switch (todayDate.getDay()) {
        case 0:
            msg += "星期日";
            break;
        case 1:
            msg += "星期一";
            break;
        case 2:
            msg += "星期二";
            break;
        case 3:
            msg += "星期三";
            break;
        case 4:
            msg += "星期四";
            break;
        case 5:
            msg += "星期五";
            break;
        case 6:
            msg += "星期六";
            break;
        default:
            break;
    }

    return msg;
}

function _ShowDateTime() {
    var obj = document.getElementById('datetime');
    if (obj) {
        obj.innerHTML = GetDateTime();
    }
}

function ShowDateTime() {
    var iv = setInterval("_ShowDateTime();", 1000);
}

ShowDateTime();