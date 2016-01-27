/* jquery 表单验证使用实例！  */
//获取Request notnull
var validateField = "validate-field";

function isRequestNotNull(obj) {
    obj = $.trim(obj);
    if (obj.length == 0) {
        return true;
    }
    else
        return false;
}
//验证不为空 notnull
function isNotNull(obj) {
    obj = $.trim(obj);
    if (obj.length == 0) {
        return true;
    }
    else
        return false;
}

//验证数字 num
function isInteger(obj) {
    var reg = /^[-+]?\d+$/;

    if (!reg.test(obj)) {
        return false;
    } else {
        return true;
    }
}

//验证数字 num  或者null,空
function isIntegerOrNull(obj) {
    var controlObj = $.trim(obj);
    if (controlObj.length == 0) {
        return true;
    }

    return isInteger(obj);
}

//Email验证 email
function isEmail(obj) {
    var reg = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
    if (!reg.test(obj)) {
        return false;
    } else {
        return true;
    }
}

//Email验证 email   或者null,空
function isEmailOrNull(obj) {
    var controlObj = $.trim(obj);
    if (controlObj.length == 0) {
        return true;
    }

    return isEmail(obj);
}

//验证只能输入英文字符串 echar
function isEnglishStr(obj) {
    var reg = /^[a-z,A-Z]+$/;
    if (!reg.test(obj)) {
        return false;
    } else {
        return true;
    }
}

//验证只能输入英文字符串 echar 或者null,空
function isEnglishStrOrNull(obj) {
    var controlObj = $.trim(obj);
    if (controlObj.length == 0) {
        return true;
    }

    return isEnglishStr(obj);
}

//验证是否是n位数字字符串编号 nnum
function isLenNum(obj, n) {
    var reg = /^[0-9]+$/;
    obj = $.trim(obj);
    if (obj.length > n)
        return false;
    if (!reg.test(obj)) {
        return false;
    } else {
        return true;
    }
}

//验证是否是n位数字字符串编号 nnum或者null,空
function isLenNumOrNull(obj, n) {
    var controlObj = $.trim(obj);
    if (controlObj.length == 0) {
        return true;
    }

    return isLenNum(obj, n);
}

//验证是否小于等于n位数的字符串 nchar
function isLenStr(obj, n) {
    //reg = /^[A-Za-z0-9\u0391-\uFFE5]+$/;
    obj = $.trim(obj);
    if (obj.length == 0 || obj.length > n)
        return false;
    else
        return true;
}

//验证是否小于等于n位数的字符串 nchar或者null,空
function isLenStrOrNull(obj, n) {
    var controlObj = $.trim(obj);
    if (controlObj.length == 0) {
        return true;
    }
    obj = $.trim(obj);
    if (obj.length > n)
        return false;
    else
        return true;
}

//验证是否电话号码 phone
function isTelephone(obj) {
    var reg = /^(\d{3,4}\-)?[1-9]\d{6,7}$/;
    if (!reg.test(obj)) {
        return false;
    } else {
        return true;
    }
}

//验证是否电话号码 phone或者null,空
function isTelephoneOrNull(obj) {
    var controlObj = $.trim(obj);
    if (controlObj.length == 0) {
        return true;
    }

    return isTelephone(obj);
}

//验证是否手机号 mobile
function isMobile(obj) {
    var reg = /^(\+\d{2,3}\-)?\d{11}$/;
    if (!reg.test(obj)) {
        return false;
    } else {
        return true;
    }
}

//验证是否手机号 mobile或者null,空
function isMobileOrnull(obj) {
    var controlObj = $.trim(obj);
    if (controlObj.length == 0) {
        return true;
    }

    return isMobile(obj);
}

//验证是否手机号或电话号码 mobile phone 
function isMobileOrPhone(obj) {
    var regMobile = /^(\+\d{2,3}\-)?\d{11}$/;
    var regPhone = /^(\d{3,4}\-)?[1-9]\d{6,7}$/;
    if (!regMobile.test(obj) && !regPhone.test(obj)) {
        return false;
    } else {
        return true;
    }
}

//验证是否手机号或电话号码 mobile phone或者null,空
function isMobileOrPhoneOrNull(obj) {
    var controlObj = $.trim(obj);
    if (controlObj.length == 0) {
        return true;
    }

    return isMobileOrPhone(obj);
}

//验证网址 uri
function isUri(obj) {
    var reg = /^http:\/\/[a-zA-Z0-9]+\.[a-zA-Z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/;
    if (!reg.test(obj)) {
        return false;
    } else {
        return true;
    }
}

//验证网址 uri或者null,空
function isUriOrnull(obj) {
    var controlObj = $.trim(obj);
    if (controlObj.length == 0) {
        return true;
    }

    return isUri(obj);
}

//验证两个值是否相等 equals
function isEqual(obj1, controlObj) {
    if (obj1.length != 0 && controlObj.length != 0) {
        if (obj1 == controlObj)
            return true;
        else
            return false;
    }
    else
        return false;
}

//判断日期类型是否为YYYY-MM-DD格式的类型 date
function isDate(obj) {
    if (obj.length != 0) {
        var reg = /^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/;
        if (!reg.test(obj)) {
            return false;
        }
        else {
            return true;
        }
    }

    return false;
}

//判断日期类型是否为YYYY-MM-DD格式的类型 date或者null,空
function isDateOrNull(obj) {
    var controlObj = $.trim(obj);
    if (controlObj.length == 0) {
        return true;
    }

    return isDate(obj);
}

//判断日期类型是否为YYYY-MM-DD hh:mm:ss格式的类型 datetime
function isDateTime(obj) {
    if (obj.length != 0) {
        var reg = /^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2}) (\d{1,2}):(\d{1,2})(\:\d{1,2})?$/;
        if (!reg.test(obj)) {
            return false;
        }
        else {
            return true;
        }
    }

    return false;
}

//判断日期类型是否为YYYY-MM-DD hh:mm:ss格式的类型 datetime或者null,空
function isDateTimeOrNull(obj) {
    var controlObj = $.trim(obj);
    if (controlObj.length == 0) {
        return true;
    }

    return isDateTime(obj);
}

//判断日期类型是否为hh:mm:ss格式的类型 time
function isTime(obj) {
    if (obj.length != 0) {
        var reg = /^((20|21|22|23|[0-1]\d)\:[0-5][0-9])(\:[0-5][0-9])?$/;
        if (!reg.test(obj)) {
            return false;
        }
        else {
            return true;
        }
    }

    return false;
}

//判断日期类型是否为hh:mm:ss格式的类型 time或者null,空
function isTimeOrNull(obj) {
    var controlObj = $.trim(obj);
    if (controlObj.length == 0) {
        return true;
    }

    return isTime(obj);
}

//判断输入的字符是否为中文 cchar 
function isChinese(obj) {
    if (obj.length != 0) {
        var reg = /^[\u0391-\uFFE5]+$/;
        if (!reg.test(obj)) {
            return false;
        }
        else {
            return true;
        }
    }

    return false;
}

//判断输入的字符是否为中文 cchar或者null,空
function isChineseOrNull(obj) {
    var controlObj = $.trim(obj);
    if (controlObj.length == 0) {
        return true;
    }

    return isChinese(obj);
}

//判断输入的邮编(只能为六位)是否正确 zip
function isZip(obj) {
    if (obj.length != 0) {
        var reg = /^\d{6}$/;
        if (!reg.test(obj)) {
            return false;
        }
        else {
            return true;
        }
    }

    return false;
}

//判断输入的邮编(只能为六位)是否正确 zip或者null,空
function isZipOrNull(obj) {
    var controlObj = $.trim(obj);
    if (controlObj.length == 0) {
        return true;
    }

    return isZip(obj);
}

//判断输入的字符是否为双精度 double
function isDouble(obj) {
    if (obj.length != 0) {
        var reg = /^[-\+]?\d+(\.\d+)?$/;
        if (!reg.test(obj)) {
            return false;
        }
        else {
            return true;
        }
    }

    return false;
}

//判断输入的字符是否为双精度 double或者null,空
function isDoubleOrNull(obj) {
    var controlObj = $.trim(obj);
    if (controlObj.length == 0) {
        return true;
    }

    return isDouble(obj);
}

//判断是否为身份证 idcard
function isIDCard(obj) {
    if (obj.length != 0) {
        var reg = /^\d{15}(\d{2}[A-Za-z0-9;])?$/;
        if (!reg.test(obj))
            return false;
        else
            return true;
    }

    return false;
}

//判断是否为身份证 idcard或者null,空
function isIDCardOrNull(obj) {
    var controlObj = $.trim(obj);
    if (controlObj.length == 0) {
        return true;
    }

    return isIDCard(obj);
}

//验证是否为浮点长度格式。
function isNumCommaNum(obj) {
    var reg = /^([1-9]?\d)+(\,)+(\d)$/;
    if (!reg.test(obj)) {
        return false;
    } else {
        return true;
    }
}

//验证IP格式和有效性
function isIP(obj) {
    var reg = /^(22[0-3]|2[0,1]\d{1}|1\d{2}|[1-9]?\d).((25[0-5]|2[0-4]\d{1}|1\d{2}|[1-9]?\d).){2}(25[0-5]|2[0-4]\d{1}|1\d{2}|[1-9]?\d)$/;
    if (!reg.test(obj)) {
        return false;
    }
    else {
        return true;
    }
}

// 验证脚本
// containerObj为当前input所在的空间容器 (例如：Div,Panel)
// 脚本中 validate-rule为验证规则，validate-field属性表示被验证表单的【中文名称】。
function JudgeValidate(containerObj) {
    var first = 0;
    var isValidate = true;

    $(containerObj).find("[validate-rule]").each(function () {
        var temp = ValidateElement(this);

        if (!temp) {
            isValidate = false;

            if (first == 0) {
                first++;
                $(this).focus();
            }
        }
    });

    return isValidate;
}

function ValidateElement(element, isCallback) {
    isCallback = isCallback || false;

    if ($(element).attr("validate-rule") != undefined) {
        var errorMessage = '';
        var field = $(element).attr(validateField);

        field = field == undefined ? '' : field;

        switch ($(element).attr("validate-rule")) {
            case "default":
                if (isNotNull($(element).val())) {
                    errorMessage = field + "\n";
                }

                break;
            case "notNull":
                if (isNotNull($(element).val())) {
                    errorMessage = field + "不能为空！\n";
                }

                break;
            case "int":
                if (!isInteger($(element).val())) {
                    errorMessage = field + "必须为数字！\n";
                }

                break;
            case "intOrNull":
                if (!isIntegerOrNull($(element).val())) {
                    errorMessage = field + "必须为数字！\n";
                }

                break;
            case "email":
                if (!isEmail($(element).val())) {
                    errorMessage = field + "必须为E-mail格式！\n";
                }

                break;
            case "emailOrNull":
                if (!isEmailOrNull($(element).val())) {
                    errorMessage = field + "必须为E-mail格式！\n";
                }

                break;
            case "english":
                if (!isEnglishStr($(element).val())) {
                    errorMessage = field + "必须为英文字符串！\n";
                }

                break;
            case "englishOrNull":
                if (!isEnglishStrOrNull($(element).val())) {
                    errorMessage = field + "必须为字符串！\n";
                }

                break;
            case "limitInt":
                if (!isLenNum($(element).val(), $(element).attr("length"))) {
                    errorMessage = field + "不能为空且必须小于" + $(element).attr("length") + "位数字！\n";
                }

                break;
            case "limitIntOrNull":
                if (!isLenNumOrNull($(element).val(), $(element).attr("length"))) {
                    errorMessage = field + "必须为" + $(element).attr("length") + "位数字！\n";
                }

                break;
            case "limit":
                if (!isLenStr($(element).val(), $(element).attr("length"))) {
                    errorMessage = field + "不能为空且必须小于" + $(element).attr("length") + "位字符！\n";
                }

                break;
            case "limitOrNull":
                if (!isLenStrOrNull($(element).val(), $(element).attr("length"))) {
                    errorMessage = field + "必须小于" + $(element).attr("length") + "位字符！\n";
                }

                break;
            case "phone":
                if (!isTelephone($(element).val())) {
                    errorMessage = field + "必须电话格式！\n";
                }

                break;
            case "fax":
                if (!isTelephoneOrNull($(element).val())) {
                    errorMessage = field + "必须为传真格式！\n";
                }

                break;
            case "phoneOrNull":
                if (!isTelephoneOrNull($(element).val())) {
                    errorMessage = field + "必须电话格式！\n";
                }

                break;
            case "mobile":
                if (!isMobile($(element).val())) {
                    errorMessage = field + "必须为手机格式！\n";
                }

                break;
            case "mobileOrNull":
                if (!isMobileOrnull($(element).val())) {
                    errorMessage = field + "必须为手机格式！\n";
                }

                break;
            case "mobileOrPhone":
                if (!isMobileOrPhone($(element).val())) {
                    errorMessage = field + "必须为电话格式或手机格式！\n";
                }

                break;
            case "mobileOrPhoneOrNull":
                if (!isMobileOrPhoneOrNull($(element).val())) {
                    errorMessage = field + "必须为电话格式或手机格式！\n";
                }

                break;
            case "uri":
                if (!isUri($(element).val())) {
                    errorMessage = field + "必须为网址格式！\n";
                }

                break;
            case "uriOrNull":
                if (!isUriOrnull($(element).val())) {
                    errorMessage = field + "必须为网址格式！\n";
                }

                break;
            case "equal":
                if (!isEqual($(element).val(), $(element).attr("equal-value"))) {
                    errorMessage = field + "不相等！\n";
                }

                break;
            case "date":
                if (!isDate($(element).val())) {
                    errorMessage = field + "必须为日期格式！\n";
                }

                break;
            case "dateOrNull":
                if (!isDateOrNull($(element).val())) {
                    errorMessage = field + "必须为日期格式！\n";
                }

                break;
            case "dateTime":
                if (!isDateTime($(element).val())) {
                    errorMessage = field + "必须为日期时间格式！\n";
                }

                break;
            case "dateTimeOrNull":
                if (!isDateTimeOrNull($(element).val())) {
                    errorMessage = field + "必须为日期时间格式！\n";
                }

                break;
            case "time":
                if (!isTime($(element).val())) {
                    errorMessage = field + "必须为时间格式！\n";
                }

                break;
            case "timeOrNull":
                if (!isTimeOrNull($(element).val())) {
                    errorMessage = field + "必须为时间格式！\n";
                }

                break;
            case "chinese":
                if (!isChinese($(element).val())) {
                    errorMessage = field + "必须为中文！\n";
                }

                break;
            case "chineseOrNull":
                if (!isChineseOrNull($(element).val())) {
                    errorMessage = field + "必须为中文！\n";
                }

                break;
            case "zip":
                if (!isZip($(element).val())) {
                    errorMessage = field + "必须为邮编格式！\n";
                }

                break;
            case "zipOrNull":
                if (!isZipOrNull($(element).val())) {
                    errorMessage = field + "必须为邮编格式！\n";
                }

                break;
            case "double":
                if (!isDouble($(element).val())) {
                    errorMessage = field + "必须为小数！\n";
                }

                break;
            case "doubleOrNull":
                if (!isDoubleOrNull($(element).val())) {
                    errorMessage = field + "必须为小数！\n";
                }

                break;
            case "IDCard":
                if (!isIDCard($(element).val())) {
                    errorMessage = field + "必须为身份证格式！\n";
                }

                break;
            case "IDCardOrNull":
                if (!isIDCardOrNull($(element).val())) {
                    errorMessage = field + "必须为身份证格式！\n";
                }

                break;
            case "requestNotNull":
                if (isNotNull($(element).val())) {
                    errorMessage = field + "！\n";
                }

                break;

            case "isCommaNumber": //格式 例如:(10,2)
                if (!isNumCommaNum($(element).val())) {
                    errorMessage = field + "！\n";
                }

                break;
            case "ipAddress": //格式 例如:(192.168.0.1)
                if (!isIP($(element).val())) {
                    errorMessage = field + "必须为有效IPV4！\n";
                }

                break;
        }

        if (errorMessage != '') {
            ChangeCss(element, errorMessage, isCallback);

            return false;
        }
    }

    return true;
}

//修改出错的input的外观
function ChangeCss(obj, validatemsg, isCallback) {
    if (!isCallback) {
        $(obj).addClass("tooltipinputerr");

        if ($(obj).prop('nodeName').toUpperCase() == "SELECT") {
	        $(obj).css('background-position', $(obj).width() - 10);
	        $(obj).after('<msg style="background:#FFF7E3;position: absolute;top: 8px;left: 20px;color: gray;font-size: 1.15em;">' + validatemsg + '</msg>');

	        $(obj).click(function() {
		        if (ValidateElement(obj, true)) {
			        $(obj).addClass("tooltipinputok");
			        $(obj).removeClass("tooltipinputerr");

			        $(obj).nextAll('msg').remove();
		        } else {
                    $(obj).addClass("tooltipinputerr");
                    $(obj).removeClass("tooltipinputok");
			        $(obj).after('<msg style="background:#FFF7E3;position: absolute;top: 8px;left: 20px;color: gray;font-size: 1.15em;">' + validatemsg + '</msg>');
		        }
	        });
        } else {
            $(obj).css('background-position', $(obj).width() - 1);
            $(obj).val('');
            $(obj).prop('placeholder', validatemsg);

            $(obj).on("blur", function () {
                if (ValidateElement(obj, true)) {
                    $(obj).addClass("tooltipinputok");
                    $(obj).removeClass("tooltipinputerr");

                    $(obj).prop('placeholder', '');
                } else {
                    $(obj).val('');
                    $(obj).addClass("tooltipinputerr");
                    $(obj).removeClass("tooltipinputok");
                    $(obj).prop('placeholder', validatemsg);
                }
            });
        }
    }
}
