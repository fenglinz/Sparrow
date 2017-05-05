/**
 * description: 自定义验证插件，
 *   validate-rule为验证规则
 *   validate-field属性表示被验证表单的中文名称
 * author:fenglinz
 * create:2017-3-30
 */
(function () {
    var validateField = "valid-field";

    /**
     * 验证必填。
     * @param {string} value 字符
     */
    function isRequired(value) {
        value = $.trim(value);

        if (value.length == 0) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 验证必填整数。
     * @param {string} value 字符
     * @param {number} min 最小值
     * @param {number} max 最大值
     */
    function isInt(value, min, max) {
        var regx = /^[-+]?\d+$/;

        if (!regx.test(value)) {
            return false;
        } else {
            var result = true;
            var number = parseInt(value);

            if (!isNaN(min)) {
                result = number >= min;
            }

            if (!isNaN(max)) {
                result = number <= max;
            }

            return result;
        }
    }

    /**
     * 验证可为空的整数。
     * @param {string} value 字符
     * @param {number} min 最小值
     * @param {number} max 最大值
     */
    function isIntOrNull(value, min, max) {
        var trimedValue = $.trim(value);

        if (trimedValue.length == 0) {
            return true;
        }

        return isInt(value);
    }

    /**
     * 验证必填浮点数。
     * @param {string} value 字符
     * @param {number} min 最小值
     * @param {number} max 最大值
     */
    function isNumber(value, min, max) {
        if (value.length != 0) {
            var regx = /^[-\+]?\d+(\.\d+)?$/;

            if (!regx.test(value)) {
                return false;
            } else {
                var result = true;
                var real = parseFloat(value);

                if (!isNaN(min)) {
                    result = number >= min;
                }

                if (!isNaN(max)) {
                    result = number <= max;
                }

                return result;
            }
        }

        return false;
    }

    /**
     * 验证可空浮点数。
     * @param {string} value 字符
     * @param {number} min 最小值
     * @param {number} max 最大值
     */
    function isNumberOrNull(value, min, max) {
        var trimedValue = $.trim(value);

        if (trimedValue.length == 0) {
            return true;
        }

        return isNumber(value, min, max);
    }

    /**
     * 验证必填的逗号分隔的整数。
     * @param {string} value 字符
     */
    function isCommaNumber(value) {
        var regx = /^([1-9]?\d)+(\,)+(\d)$/;

        if (!regx.test(value)) {
            return false;
        } else {
            return true;
        }
    }

    /**
     * 判断是否为必填日期。
     * @param {string} value 字符
     */
    function isDate(value) {
        if (value.length != 0) {
            var regx = /^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/;

            if (!regx.test(value)) {
                return false;
            } else {
                return true;
            }
        }

        return false;
    }

    /**
     * 验证可空日期。
     * @param {string} value 字符
     */
    function isDateOrNull(value) {
        var trimedValue = $.trim(value);

        if (trimedValue.length == 0) {
            return true;
        }

        return isDate(value);
    }

    /**
     * 验证必填日期+时间。
     * @param {string} value 字符
     */
    function isDateTime(value) {
        if (value.length != 0) {
            var regx = /^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2}) (\d{1,2}):(\d{1,2})(\:\d{1,2})?$/;

            if (!regx.test(value)) {
                return false;
            } else {
                return true;
            }
        }

        return false;
    }

    /**
     * 验证可空日期+时间。
     * @param {string} value 字符
     */
    function isDateTimeOrNull(value) {
        var trimedValue = $.trim(value);

        if (trimedValue.length == 0) {
            return true;
        }

        return isDateTime(value);
    }

    /**
     * 验证必填时间。
     * @param {string} value 字符
     */
    function isTime(value) {
        if (value.length != 0) {
            var regx = /^((20|21|22|23|[0-1]\d)\:[0-5][0-9])(\:[0-5][0-9])?$/;

            if (!regx.test(value)) {
                return false;
            } else {
                return true;
            }
        }

        return false;
    }

    /**
     * 验证可空时间。
     * @param {string} value 字符
     */
    function isTimeOrNull(value) {
        var trimedValue = $.trim(value);

        if (trimedValue.length == 0) {
            return true;
        }

        return isTime(value);
    }

    /**
     * 验证必填字符串。
     * @param {string} vlaue 字符
     * @param {number} minLength 最小长度
     * @param {number} maxLength 最大长度
     */
    function isLimitChars(vlaue, minLength, maxLength) {
        var result = false;

        vlaue = $.trim(vlaue);
        minLength = minLength || 1;

        if (vlaue.length >= minLength) {
            result = true;
        }

        if (!isNaN(maxLength)) {
            result = value.length <= maxLength;
        }

        return result;
    }

    /**
     * 验证可空字符串。
     * @param {string} vlaue 字符
     * @param {number} minLength 最小长度
     * @param {number} maxLength 最大长度
     */
    function isLimitCharsOrNull(vlaue, minValue, maxValue) {
        vlaue = $.trim(vlaue);

        if (vlaue.length == 0) {
            return true;
        }

        return isLimitChars(value, minLength, maxLength);
    }

    /**
     * 验证必填英文字符。
     * @param {string} value 字符
     * @param {number} minLength 最小长度
     * @param {number} maxLength 最大长度
     */
    function isEnglishChars(value, minLength, maxLength) {
        var regx = /^[a-z,A-Z]+$/;

        if (!regx.test(value)) {
            return false;
        } else {
            return isLimitChars(value, minLength, maxLength);
        }
    }

    /**
     * 验证可空英文字符。
     * @param {string} value 字符
     * @param {number} minLength 最小长度
     * @param {number} maxLength 最大长度
     */
    function isEnglishCharsOrNull(value, minLength, maxLength) {
        var trimedValue = $.trim(value);

        if (trimedValue.length == 0) {
            return true;
        }

        return isEnglishChars(value, minLength, maxLength);
    }

    /**
     * 验证必填中文字符。
     * @param {string} value 字符
     * @param {number} minLength 最小长度
     * @param {number} maxLength 最大长度
     */
    function isChineseChars(value, minLength, maxLength) {
        if (value.length != 0) {
            var regx = /^[\u0391-\uFFE5]+$/;

            if (!regx.test(value)) {
                return false;
            } else {
                return isLimitChars(value, minLength, maxLength);
            }
        }

        return false;
    }

    /**
     * 验证可空中文字符。
     * @param {string} value 字符
     * @param {number} minLength 最小长度
     * @param {number} maxLength 最大长度
     */
    function isChineseOrNull(value, minLength, maxLength) {
        var trimedValue = $.trim(value);

        if (trimedValue.length == 0) {
            return true;
        }

        return isChineseChars(value, minLength, maxLength);
    }

    /**
     * 是否相等。
     * @param {string} value1 字符1
     * @param {string} value2 字符2
     */
    function isEqual(value1, value2) {
        if (value1.length != 0 && value2.length != 0) {
            if (value1 == value2) {
                return true;
            }
            else {
                return false;
            }
        }

        return false;
    }

    /**
     * 验证必填邮箱。
     * @param {string} value 字符
     */
    function isEmail(value) {
        var regx = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;

        if (!regx.test(value)) {
            return false;
        } else {
            return true;
        }
    }

    /**
     * 验证可空邮箱。
     * @param {string} value 字符
     */
    function isEmailOrNull(value) {
        var trimedValue = $.trim(value);

        if (trimedValue.length == 0) {
            return true;
        }

        return isEmail(value);
    }

    /**
     * 验证必填电话号码。
     * @param {string} value 字符
     */
    function isTelephone(value) {
        var regx = /^(\d{3,4}\-)?[1-9]\d{6,7}$/;

        if (!regx.test(value)) {
            return false;
        } else {
            return true;
        }
    }

    /**
     * 验证可空电话号码。
     * @param {string} value 字符
     */
    function isTelephoneOrNull(value) {
        var trimedValue = $.trim(value);

        if (trimedValue.length == 0) {
            return true;
        }

        return isTelephone(value);
    }

    /**
     * 验证必填手机号码。
     * @param {string} value 字符
     */
    function isMobile(value) {
        var regx = /^(\+\d{2,3}\-)?\d{11}$/;

        if (!regx.test(value)) {
            return false;
        } else {
            return true;
        }
    }

    /**
     * 验证可空手机号码。
     * @param {string} value 字符
     */
    function isMobileOrnull(value) {
        var trimedValue = $.trim(value);

        if (trimedValue.length == 0) {
            return true;
        }

        return isMobile(value);
    }

    /**
     * 验证必填电话号码或手机号码。
     * @param {string} value 字符
     */
    function isMobileOrPhone(value) {
        return isMobile(value) || isTelephone(value);
    }

    /**
     * 验证可空电话号码或手机号码。
     * @param {string} value 字符
     */
    function isMobileOrPhoneOrNull(value) {
        var trimedValue = $.trim(value);

        if (trimedValue.length == 0) {
            return true;
        }

        return isMobileOrPhone(value);
    }

    /**
     * 验证必填Uri。
     * @param {string} value 字符
     */
    function isUri(value) {
        var regx = /^http:\/\/[a-zA-Z0-9]+\.[a-zA-Z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/;

        if (!regx.test(value)) {
            return false;
        } else {
            return true;
        }
    }

    /**
     * 验证可空Uri。
     * @param {string} value 字符
     */
    function isUriOrNull(value) {
        var trimedValue = $.trim(value);

        if (trimedValue.length == 0) {
            return true;
        }

        return isUri(value);
    }

    /**
     * 验证必填邮编。
     * @param {string} value 字符
     */
    function isZip(value) {
        if (value.length != 0) {
            var regx = /^\d{6}$/;

            if (!regx.test(value)) {
                return false;
            } else {
                return true;
            }
        }

        return false;
    }

    /**
     * 验证可空邮编。
     * @param {string} value 字符
     */
    function isZipOrNull(value) {
        var trimedValue = $.trim(value);

        if (trimedValue.length == 0) {
            return true;
        }

        return isZip(value);
    }

    /**
     * 验证必填身份证号。
     * @param {string} value 字符
     */
    function isIDCard(value) {
        if (value.length != 0) {
            var regx = /^\d{15}(\d{2}[A-Za-z0-9;])?$/;

            if (!regx.test(value)) {
                return false;
            }
            else {
                return true;
            }
        }

        return false;
    }

    /**
     * 验证可空身份证号。
     * @param {string} value 字符
     */
    function isIDCardOrNull(value) {
        var trimedValue = $.trim(value);

        if (trimedValue.length == 0) {
            return true;
        }

        return isIDCard(value);
    }

    /**
     * 验证必填IP地址。
     * @param {string} value 字符
     */
    function isIP(value) {
        var regx = /^(22[0-3]|2[0,1]\d{1}|1\d{2}|[1-9]?\d).((25[0-5]|2[0-4]\d{1}|1\d{2}|[1-9]?\d).){2}(25[0-5]|2[0-4]\d{1}|1\d{2}|[1-9]?\d)$/;

        if (!regx.test(value)) {
            return false;
        } else {
            return true;
        }
    }

    /**
     * 验证可空IP地址。
     * @param {string} value 字符
     */
    function isIPOrNull(value) {
        var trimedValue = $.trim(value);

        if (trimedValue.length == 0) {
            return trimedValue;
        }

        return isIP(value);
    }

    /**
     * 脚本验证起始方法。
     * @param {String} formSelector form表单选择器。
     */
    function Validator(formSelector) {
        var first = 0;
        var isValidate = true;

        if ($(formSelector).eq(0).prop('nodeName').toUpperCase() == "FORM") {
            var formFilds = $(formSelector).find("[valid-rule]");

            formFilds.each(function () {
                AttachValidation(this);

                var rule = $(this).attr('valid-rule');
                if (rule.toLowerCase().indexOf('ornull') == -1) {
                    $(this).parent().addClass('form-required');
                }
            });

            $(formSelector).on('submit', function () {
                return IsValid(formSelector);
            });
        }
    }

    /**
     * 检查是否通过验证。
     * @param {String} formSelector form表单选择器。
     */
    function IsValid(formSelector) {
        var formFilds = $(formSelector).find("[valid-rule]");

        formFilds.each(function () {
            var error = ValidElement(this);

            if (error) {
                addErrorMessage(this, error);
            } else {
                removeErrorMessage(this);
            }
        });

        return $(formSelector).find('.has-error').length == 0;
    }

    /**
     * 元素值验证。
     * @param {HTMLElement} element Html元素
     */
    function ValidElement(element) {
        var error = '';
        var validRule = $(element).attr("valid-rule");

        if (validRule) {
            var value = $(element).val();
            var field = $(element).attr(validateField);

            field = field == undefined ? '' : field;

            switch (validRule) {
                case "required":
                    if (isRequired(value)) {
                        error = field + "不能为空！";
                    }

                    break;
                case "int":
                    var min = parseInt($(element).attr('min'));
                    var max = parseInt($(element).attr('max'));

                    if (!isInt(value, min, max)) {
                        error = field + '必须为整数' + getNumberErrorMessage(min, max);
                    }

                    break;
                case "intOrNull":
                    var min = parseInt($(element).attr('min'));
                    var max = parseInt($(element).attr('max'));

                    if (!isIntOrNull(value, min, max)) {
                        error = field + "必须为整数" + getNumberErrorMessage(min, max);
                    }

                    break;

                case "number":
                    var min = parseInt($(element).attr('min'));
                    var max = parseInt($(element).attr('max'));

                    if (!isNumber(value, min, max)) {
                        error = field + "必须为数字" + getNumberErrorMessage(min, max);
                    }

                    break;
                case "numberOrNull":
                    var min = parseInt($(element).attr('min'));
                    var max = parseInt($(element).attr('max'));

                    if (!isNumberOrNull(value, min, max)) {
                        error = field + "必须为数字" + getNumberErrorMessage(min, max);
                    }

                    break;
                case "commaNumber":
                    if (!isCommaNumber(value)) {
                        error = field + "！\n";
                    }

                    break;
                case "date":
                    if (!isDate(value)) {
                        error = field + "必须为日期格式！";
                    }

                    break;
                case "dateOrNull":
                    if (!isDateOrNull(value)) {
                        error = field + "必须为日期格式！";
                    }

                    break;
                case "dateTime":
                    if (!isDateTime(value)) {
                        error = field + "必须为日期时间格式！";
                    }

                    break;
                case "dateTimeOrNull":
                    if (!isDateTimeOrNull(value)) {
                        error = field + "必须为日期时间格式！";
                    }

                    break;
                case "time":
                    if (!isTime(value)) {
                        error = field + "必须为时间格式！";
                    }

                    break;
                case "timeOrNull":
                    if (!isTimeOrNull(value)) {
                        error = field + "必须为时间格式！";
                    }

                    break;
                case "limit":
                    var minLength = $(element).attr('minlength');
                    var maxLength = $(element).attr('maxlength');

                    if (!isLimitChars(value, minLength, maxLength)) {
                        error = field + "必须为非空文字，且" + getCharsErrorMessage(minLength, maxLength);
                    }

                    break;
                case "limitOrNull":
                    var minLength = $(element).attr('minlength');
                    var maxLength = $(element).attr('maxlength');

                    if (!isLimitCharsOrNull(value, minLength, maxLength)) {
                        error = field + getCharsErrorMessage(minLength, maxLength);
                    }

                    break;
                case "english":
                    var minLength = $(element).attr('minlength');
                    var maxLength = $(element).attr('maxlength');

                    if (!isEnglishChars(value, minLength, maxLength)) {
                        error = field + "必须为英文非空文字，且" + getCharsErrorMessage(minLength, maxLength);
                    }

                    break;
                case "englishOrNull":
                    var minLength = $(element).attr('minlength');
                    var maxLength = $(element).attr('maxlength');

                    if (!isEnglishCharsOrNull(value, minLength, maxLength)) {
                        error = field + "必须为英文文字，且" + getCharsErrorMessage(minLength, maxLength);
                    }

                    break;
                case "chinese":
                    var minLength = $(element).attr('minlength');
                    var maxLength = $(element).attr('maxlength');

                    if (!isChineseChars(value, minLength, maxLength)) {
                        error = field + "必须为中文非空文字，且" + getCharsErrorMessage(minLength, maxLength);
                    }

                    break;
                case "chineseOrNull":
                    var minLength = $(element).attr('minlength');
                    var maxLength = $(element).attr('maxlength');

                    if (!isChineseOrNull(value)) {
                        error = field + "必须为中文文字，且" + getCharsErrorMessage(minLength, maxLength);
                    }

                    break;

                case "equal":
                    var eqValue = '';
                    var equalTo = $(element).attr('equal-to');
                    var equalValue = $(element).attr('equal-value');

                    if (equalTo != undefined) {
                        eqValue = $(equalTo).val();
                    }

                    if (!isEqual(value, equalValue)) {
                        error = field + "不相等！";
                    }

                    break;

                case "email":
                    if (!isEmail(value)) {
                        error = field + "必须为E-mail格式！";
                    }

                    break;
                case "emailOrNull":
                    if (!isEmailOrNull(value)) {
                        error = field + "必须为E-mail格式！";
                    }

                    break;

                case "phone":
                    if (!isTelephone(value)) {
                        error = field + "必须电话格式！";
                    }

                    break;
                case "phoneOrNull":
                    if (!isTelephoneOrNull(value)) {
                        error = field + "必须电话格式！";
                    }

                    break;
                case "fax":
                    if (!isTelephoneOrNull(value)) {
                        error = field + "必须为传真格式！";
                    }

                    break;
                case "faxOrNull":
                    if (!isTelephoneOrNull(value)) {
                        error = field + "必须为传真格式！";
                    }

                    break;
                case "mobile":
                    if (!isMobile(value)) {
                        error = field + "必须为手机格式！";
                    }

                    break;
                case "mobileOrNull":
                    if (!isMobileOrnull(value)) {
                        error = field + "必须为手机格式！";
                    }

                    break;
                case "mobileOrPhone":
                    if (!isMobileOrPhone(value)) {
                        error = field + "必须为电话格式或手机格式！";
                    }

                    break;
                case "mobileOrPhoneOrNull":
                    if (!isMobileOrPhoneOrNull(value)) {
                        error = field + "必须为电话格式或手机格式！";
                    }

                    break;
                case "uri":
                    if (!isUri(value)) {
                        error = field + "必须为网址格式！";
                    }

                    break;
                case "uriOrNull":
                    if (!isUriOrNull(value)) {
                        error = field + "必须为网址格式！";
                    }

                    break;

                case "zip":
                    if (!isZip(value)) {
                        error = field + "必须为邮编格式！";
                    }

                    break;
                case "zipOrNull":
                    if (!isZipOrNull(value)) {
                        error = field + "必须为邮编格式！";
                    }

                    break;

                case "IDCard":
                    if (!isIDCard(value)) {
                        error = field + "必须为身份证格式！";
                    }

                    break;
                case "IDCardOrNull":
                    if (!isIDCardOrNull(value)) {
                        error = field + "必须为身份证格式！";
                    }

                    break;

                case "ipAddress":
                    if (!isIP(value)) {
                        error = field + "必须为有效IP V4！";
                    }

                    break;

                case "ipAddressOrNull":
                    if (!isIPOrNull(value)) {
                        error = field + "必须为有效IP V4！";
                    }

                    break;
            }
        }

        return error;
    }

    //修改出错的input的外观
    function AttachValidation(obj) {
        if ($(obj).prop('nodeName').toUpperCase() == "SELECT") {
            $(obj).click(function () {
                var error = ValidElement(obj);

                if (error) {
                    addErrorMessage(obj, error);
                } else {
                    removeErrorMessage(obj);
                }
            });
        } else {
            $(obj).on("input propertychange change", function () {
                var error = ValidElement(obj);

                if (error) {
                    addErrorMessage(obj, error);
                } else {
                    removeErrorMessage(obj);
                }
            });
        }
    }

    /**
     * 获取数字验证错误提示。
     * @param {number} min 最小值
     * @param {number} max 最大值
     */
    function getNumberErrorMessage(min, max) {
        var result = '';

        if (!isNaN(min) || !isNaN(max)) {
            if (!isNaN(min) && !isNaN(max)) {
                result = '，且值在' + min + '~' + max + '范围内';
            } else if (!isNaN(min)) {
                result = '，且值不小于' + min;
            } else {
                result = '，且值不超过' + max;
            }
        }

        return result + '！';
    }

    /**
     * 获取字符验证错误提示。
     * @param {number} minLength 最小长度
     * @param {number} maxLength 最大长度
     */
    function getCharsErrorMessage(minLength, maxLength) {
        var result = '';

        if (!isNaN(minLength) || !isNaN(maxLength)) {
            if (!isNaN(min) && !isNaN(max)) {
                result = '文字长度在' + min + '~' + max + '个范围内';
            } else if (!isNaN(min)) {
                result = '文字长度不小于' + min + '个';
            } else {
                result = '文字长度不超过' + max + '个';
            }
        }

        return result + '！';
    }

    /**
     * 添加错误信息。
     * @param {HTMLElement} formElement 表单元素
     * @param {string} error 错误信息
     */
    function addErrorMessage(formElement, error) {
        $(formElement).parent().addClass('has-error');
        $(formElement).after('<span tag="__byValidator" class="help-block m-b-none">' + error + '</span>');
    }

    /**
     * 移除错误信息。
     * @param {HTMLElement} formElement 表单元素
     */
    function removeErrorMessage(formElement) {
        $(formElement).parent().removeClass('has-error');
        $(formElement).siblings('span.help-block').remove();
    }

    // 添加验证
    window.validator = Validator;
    window.isValid = IsValid;
})();