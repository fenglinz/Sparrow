(function () {
    function BeginLoading() {
        top.$("#loading").show();
    }

    function EndLoading() {
        top.$("#loading").hide();
    }

    // 短暂提示
    // msg: 显示消息
    // time：停留时间ms
    // type：类型 4：成功，5：失败，3：警告
    function ShowTipsMessage(msg, time, type) {
        top.ZENG.msgbox.show(msg, type, time);
    }

    function ShowWarningMessage(msg) {
        top.dialog({
            id: 'warningId',
            title: '温馨提醒',
            content: msg,
            padding: '20px 30px 20px 30px',
            okValue: '<i class="glyphicon glyphicon-off"></i> 确定',
            ok: function () {
            }
        }).showModal();
    }

    // 警告提示
    // msg: 显示消息
    // callBack：函数
    function ShowConfirmMessage(msg, callBack) {
        top.dialog({
            id: 'warningId',
            title: '消息',
            content: msg,
            padding: '20px 30px 20px 30px',
            okValue: '<i class="glyphicon glyphicon-ok"></i> 确定',
            ok: function () {
                if (callBack != undefined) { callBack(true); }
            },
            cancelValue: '<i class="glyphicon glyphicon-off"></i> 取消',
            cancel: function () { }
        }).showModal();
    }

    /* 请求Ajax 带返回值，并弹出提示框提醒
    --------------------------------------------------*/
    function Ajax(url, datas, callBack) {
        BeginLoading();
        $.ajax({
            type: 'POST',
            url: url,
            data: datas,
            dataType: "JSON",
            cache: false,
            async: true,
            success: function (msg) {
                EndLoading();
                callBack(msg);
            },
            error: function (xhr, e) {
                EndLoading();
                ShowWarningMessage(xhr.responseText);
            }
        });
    }

    /*弹出网页
    /*url:          表示请求路径
    /*id:           ID
    /*title:        标题名称
    /*width:        宽度
    /*height:       高度
    ---------------------------------------------------*/
    function OpenDialog(url, id, title, width, height, settings) {
        settings = settings || {};

        settings.statusbar = settings.statusbar == undefined ? true : settings.statusbar;
        settings.okValue = settings.okValue || '<i class="glyphicon glyphicon-floppy-save"></i> 确定';
        settings.cancelValue = settings.cancelValue || '<i class="glyphicon glyphicon-off"></i> 关闭';
        settings.x = settings.x || 'center';
        settings.y = settings.y || 'middle';

        top.dialog({
            id: id,
            url: url,
            title: title,
            width: width,
            height: height,
            okValue: settings.statusbar ? settings.okValue : null,
            ok: settings.statusbar ? function () {
                if (top[id].OnSave != undefined) {
                    top[id].OnSave();

                    return false;
                }

                return false;
            } : null,
            cancelValue: settings.statusbar ? settings.cancelValue : '取消',
            cancelDisplay: settings.statusbar,
            cancel: function () {
                if (top[id] != undefined && top[id].OnClose != undefined) {
                    top[id].OnClose();
                }
            },
            onshow: function () {
                var offsetX = '0px';
                var offsetY = '0px';

                if (settings.x != 'center') {
                    if (settings.x == 'right') {
                        var twidth = $(top).width();
                        var dwidth = $(this._popup).width();

                        offsetX = (twidth - dwidth) + 'px';
                    }

                    this._popup[0].style.left = offsetX;
                }

                if (settings.y != 'middle') {
                    if (settings.y == 'bottom') {
                        var theight = $(top).height();
                        var dheight = $(this._popup).height();

                        offsetY = (theight - dheight) + 'px';
                    }

                    this._popup[0].style.top = offsetY;
                }
            }
        }).showModal();
    }

    //窗口关闭
    function CloseDialog() {
        top.dialog.get(window).close().remove();
    }

    /*验证
    /*id:        表示请求
    --------------------------------------------------*/
    function HasSingleRowSelected(id) {
        var isOk = true;

        if (id == undefined || id == "") {
            isOk = false;
            ShowWarningMessage("未选中任何一行！");
        } else if (id.split(",").length > 1) {
            isOk = false;
            ShowWarningMessage("一次只能选择一条记录！");
        }

        return isOk;
    }

    function HasAnyRowSelected(id, msg) {
        var isOk = true;

        if (id == undefined || id == "") {
            isOk = false;
            msg = msg || '未选中任何一行！';
            ShowWarningMessage(msg);
        }

        return isOk;
    }

    function IsNullOrEmpty(str) {
        var isOk = true;
        if (str == undefined || str == "") {
            isOk = false;
        }
        return isOk;
    }

    /**
    文本框，下拉框输入事件
    作用是，如果没有对表单值更新，就不提交到数据库
    **/
    var isDataChanged = "";
    function IsDataChanged() {
        $("textarea,input[type='text']").keydown(function () {
            isDataChanged = 1;
        });

        $("select").change(function () {
            isDataChanged = 1;
        });
    }
    /********
    接收地址栏参数
    key:参数名称
    **********/
    function GetQueryString(key) {
        var search = location.search.slice(1); //得到get方式提交的查询字符串
        var arr = search.split("&");

        for (var i = 0; i < arr.length; i++) {
            var ar = arr[i].split("=");
            if (ar[0] == key) {
                return ar[1];
            }
        }

        return '';
    }
    /**
    文本框只允许输入数字
    **/
    function SetNumberInputOnly(obj) {
        $("#" + obj).bind("contextmenu", function () {
            return false;
        });
        $("#" + obj).css('ime-mode', 'disabled');
        $("#" + obj).keypress(function (e) {
            if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                return false;
            }

            return true;
        });
    }

    function GetCheckboxValue(table) {
        var reVal = '';

        table = table == undefined ? '.treetable' : table;

        $(table + ' :checkbox:checked').each(function () {
            reVal += $(this).val() + ',';
        });

        reVal = reVal.substr(0, reVal.length - 1);

        return reVal;
    }

    function KeepHeight(selector, otherHeight) {
        function keepHeight() {
            var height = $(window).height() - otherHeight;

            $(selector).css('height', height);
        }

        keepHeight();

        $(window).resize(function () {
            keepHeight();
        });
    }

    /*
     * 功能：固定表格标题处理。
     * 参数列表：
     *   gv：table元素选择器
     *   height：表格高度
     */
    function OnFixedTableHeader(gv, width, height) {
        var gvn;
        var fixedTableId = "FixedTable" + gv.replace('#', '_');

        $(gv).css('width', width);

        if ($(gv).parent().prop('id') != fixedTableId) {
            gvn = $(gv).clone(true).prop('id', gv.replace('#', '') + '_header');

            $(gvn).find("tbody").remove();
            $(gv).before(gvn);
            $(gv).find("thead").remove();

            $(gv).wrap("<div id='" + fixedTableId + "' class='FixedTable' style='width:" + width + ";height:" + height + "px;'></div>");
        } else {
            gvn = $(gv).parent().prev();
        }

        $(gv).css('width', width);
        $(gvn).find('thead > tr > td:visible').each(function (index, item) {
            if ($(item).context.style.width != "") {
                $(gv).find('tbody > tr > td:visible:eq(' + index + ')').css('width', $(item).css('width'));
            }
        });
    }

    /*
     * 功能：表格行选择处理。
     * 参数列表：
     *   gv：table元素选择器
     *   params:
     *     multiple：是否多选
     *     rowCheckedHighlight：是否行CheckBox勾选时高亮显示该行
     */
    function ApplyTableStyle(gv, params) {
        params = params || { rowCheckedHighlight: true };

        if (params.rowCheckedHighlight) {
            $(gv + ' > tbody > tr').has(':checked').addClass('selected');
        }

        if (!params.multiple) {
            $(gv + ' > tbody > tr').click(function () {
                var element = $(this);
                var checkboxs = element.find(':checkbox:not(:disabled)');

                if (checkboxs.length > 0) {
                    if (element.hasClass('selected')) {
                        $(gv + ' > tbody > tr').removeClass('selected');

                        checkboxs.prop('checked', false);
                    } else {
                        $(gv + ' > tbody > tr').removeClass('selected');
                        $(gv + '  > tbody > tr :checkbox').prop('checked', false);

                        element.addClass('selected');
                        checkboxs.prop('checked', true);
                    }
                } else {
                    $(gv + ' > tbody > tr').removeClass('selected');

                    element.addClass('selected');
                }
            });
        } else {
            $(gv + ' > tbody > tr').click(function () {
                var element = $(this);
                var checkboxs = element.find(':checkbox:not(:disabled)');

                if (checkboxs.length > 0) {
                    if (element.hasClass('selected')) {
                        element.removeClass('selected');
                        checkboxs.prop('checked', false);
                    } else {
                        element.addClass('selected');
                        checkboxs.prop('checked', true);
                    }
                }
            });
        }
    }

    /*
     * 功能：固定表头。
     * 参数列表：
     *   gv：table元素选择器
     *   otherHeight：除选择的表格之外的元素所占高度
     *   params:
     *     multiple：是否多选
     *     triggerRowChecked：是否触发行点击时勾选CheckBox的功能
     *     rowCheckedHighlight：是否行CheckBox勾选时高亮显示该行
     *     fixedWidth：如果指定，则表格宽度为该值
     *     minusWidth：如果指定，则表格为当前显示器分辨率-minusWidth值
     */
    function FixedTableHeader(gv, otherHeight, params) {
        params = params || {};

        var width = '100%';
        var height = $(window).height() - otherHeight;

        if (document.clientHeight < document.offsetHeight) {
            width = width - 17;
        }

        if (params.fixedWidth != undefined) {
            width = params.fixedWidth;
        } else if (params.minusWidth != undefined) {
            width -= params.minusWidth;
        }

        $(gv + ' > tbody > tr a').click(function (e) {
            window.location.href = $(this).attr('href');

            return false;
        });

        if (params.triggerRowChecked == undefined || params.triggerRowChecked == true) {
            ApplyTableStyle(gv, params);
        } else {
            $(gv + ' > tbody > tr').click(function () {
                $(gv + ' > tbody > tr').removeClass('selected');

                $(this).addClass('selected');
            });
        }

        OnFixedTableHeader(gv, width, height);

        var gvId = gv.replace('#', '');
        var fixedTableId = "#FixedTable_" + gvId;
        var checkAllElement = $(gv + '_header > thead > tr .check-all');

        if (params.multiple && checkAllElement.length > 0) {
            checkAllElement.click(function () {
                if (!checkAllElement.is('.active')) {
                    checkAllElement.attr('title', '反选');
                    checkAllElement.addClass('active');
                    $(gv + ' > tbody :checkbox:not(:disabled)').prop('checked', true);

                    if (params.triggerRowChecked == undefined || params.triggerRowChecked == true) {
                        $(gv + '> tbody > tr').has(':checkbox:not(:disabled)').addClass('selected');
                    }
                } else {
                    checkAllElement.attr('title', '全选');
                    checkAllElement.removeClass('active');
                    $(gv + ' > tbody :checkbox:not(:disabled)').prop("checked", false);

                    if (params.triggerRowChecked == undefined || params.triggerRowChecked == true) {
                        $(gv + '> tbody > tr').has(':checkbox:not(:disabled)').removeClass('selected');
                    }
                }

                return false;
            });
        }

        $(window).resize(function () {
            width = '100%';
            height = $(window).height() - otherHeight;

            if (params.fixedWidth != undefined) {
                width = params.fixedWidth;
            } else if (params.minusWidth != undefined) {
                width -= params.minusWidth;
            }

            $(fixedTableId).css('width', width);
            $(fixedTableId).css('height', height);
            $(fixedTableId).prev().css('width', width);
            $(fixedTableId).find('table').css('width', width);

            $(fixedTableId).prev().find('thead > tr > td:visible').each(function (index, item) {
                if ($(item).context.style.width != "") {
                    $(fixedTableId + ' table > tbody > tr > td:visible:eq(' + index + ')').css('width', $(item).css('width'));
                }
            });
        });
    }

    function ApplyTreeViewCss(treeContainer) {
        $('#' + treeContainer + " li span").css("cursor", "pointer");
        $('#' + treeContainer + " li span").find(':checked').parent('span').addClass('collapsableselected');

        $('#' + treeContainer + " li :checkbox").click(function (event) {
            if ($(this).prop('checked')) {
                $(this).parent('span').addClass('collapsableselected');
            } else {
                $(this).parent('span').removeClass('collapsableselected');
            }

            return false;
        });

        $('#' + treeContainer + " li span").click(function () {
            var checked = $(this).find(':checkbox');

            if (checked.length > 0) {
                checked.prop('checked', !checked.prop('checked'));

                if (checked.prop('checked')) {
                    $(this).addClass('collapsableselected');
                } else {
                    $(this).removeClass('collapsableselected');
                }
            } else {
                $('#' + treeContainer + " li span").removeClass("collapsableselected");
                $(this).addClass("collapsableselected"); //添加选中样式
            }
        });
    }

    /*****************树形样式********************************/
    function ShowTreeView(treeContainer, collapse) {
        $('#' + treeContainer).lightTreeview({  //指定需要转化成treeview的ul或ol
            collapse: collapse == undefined ? true : collapse, //是否允许收缩或展开树型菜单。默认为true
            line: true, //是否始用连接线。默认为true。你也可以直接对根节点加入类“treeview-noline”来实现同样的效果
            nodeEvent: true,  //是否将节点标题的点击也绑定菜单收缩展开的事件。默认为true
            unique: false,  //同级节点是否互斥。默认为false
            animate: 200,  //动画效果。0为无效果。默认为200
            style: 'red',  //菜单风格。目前有默认,灰色,红色,黑色,fam 共5种风格，风格可以通过添加CSS来增加。你也可以直接对根节点加入类“treeview-风格名称”来实现同样的效果
            fileico: true,  //是否显示文件的图标。默认为false。你也可以对节点的DOM加入类“treeview-file”来实现同样的效果
            folderico: true  //是否显示节点文件夹的图标。默认为false。你也可以对节点的DOM加入类“treeview-folder”来实现同样的效果
        });

        ApplyTreeViewCss(treeContainer);
    }

    function Countdown(element, startTime, keepingTime, completedCallback) {
        var beginTime = new Date(startTime);
        var endTime = beginTime.setMinutes(beginTime.getMinutes() + parseInt(keepingTime));

        var handler = setInterval(function () {
            var now = new Date();
            var dif = (endTime - now) / 1000;

            if (dif < 0) {
                clearInterval(handler);

                if (completedCallback != undefined) {
                    completedCallback();
                }

                return;
            }

            var h = Math.floor(dif / 60 / 60);
            var m = Math.floor((dif - h * 60 * 60) / 60);
            var s = Math.floor(dif - h * 60 * 60 - m * 60);
            var display = (h < 10 ? ('0' + h) : h) + ':' + (m < 10 ? ('0' + m) : m) + ':' + (s < 10 ? ('0' + s) : s);

            $(element).html(display);
        }, 1000);
    }

    function BeautifulGreetings() {
        var now = new Date();
        var hour = now.getHours();
        if (hour < 3) {
            return ("夜深了,早点休息吧！");
        } else if (hour < 9) {
            return ("早上好！");
        } else if (hour < 12) {
            return ("上午好！");
        } else if (hour < 14) {
            return ("中午好！");
        } else if (hour < 18) {
            return ("下午好！");
        } else if (hour < 23) {
            return ("晚上好！");
        } else {
            return ("夜深了,早点休息吧！");
        }
    }

    var mercurius = {
        BaseUrl: '',
        FixedTableIndex: 0,
        CloseWindow: function () {
            window.opener = null;
            window.open('', '_self');
            window.close();
        },
        ShowDatePicker: function (selector) {
            selector = selector || '.datepicker';

            $(selector).datetimepicker({
                useCurrent: false,
                showClear: true,
                format: 'L',
                showTodayButton: true,
                locale: moment.locale('zh-cn')
            });
        },
        BeginLoading: BeginLoading,
        EndLoading: EndLoading,
        OnWaitProcess: function (callback) {
            mercurius.BeginLoading();

            var result = callback();

            return result;
        },
        Reloading: function () {
            return mercurius.OnWaitProcess(function () {
                mercurius.BeginLoading();
                window.location.reload();

                return false;
            });
        },
        RefreshPage: function () {
            window.location.reload();

            return false;
        },
        Back: function () {
            mercurius.OnWaitProcess(function () {
                window.history.back(-1);
            });
        },
        NavigateUrl: function (url) {
            return mercurius.OnWaitProcess(function () {
                window.location.href = url;

                return false;
            });
        },
        BeautifulGreetings: BeautifulGreetings,
        ShowTipsMessage: ShowTipsMessage,
        ShowWarningMessage: ShowWarningMessage,
        ShowConfirmMessage: ShowConfirmMessage,
        OpenDialog: OpenDialog,
        CloseDialog: CloseDialog,
        HasSingleRowSelected: HasSingleRowSelected,
        HasAnyRowSelected: HasAnyRowSelected,
        IsNullOrEmpty: IsNullOrEmpty,
        RemoveData: function (url, parm) {
            ShowConfirmMessage("此操作不可恢复，您确定要删除吗？", function (r) {
                Ajax(url, parm, function (rs) {
                    if (rs.IsSuccess) {
                        ShowTipsMessage("删除成功！", 2000, 4);
                        mercurius.Reloading();
                    }
                    else {
                        ShowTipsMessage("<span style='color:red'>删除失败，请稍后重试！  失败原因：" + rs.ErrorMessage + "</span>", 4000, 5);
                    }
                });
            });
        },
        OnRefresh: function (url, parm) {
            ShowConfirmMessage("确定要刷新数据吗，此前的数据将被清空？", function (r) {
                if (r) {
                    Ajax(url, parm, function (rs) {
                        if (rs.IsSuccess) {
                            ShowTipsMessage("刷新成功！", 2000, 4);
                            mercurius.Reloading();
                        }
                        else {
                            ShowTipsMessage("<span style='color:red'>刷新失败，请稍后重试！  失败原因：" + rs.Data + "</span>", 4000, 5);
                        }
                    });
                }
            });
        },
        Ajax: Ajax,
        IsDataChanged: IsDataChanged,
        GetQueryString: GetQueryString,
        SetNumberInputOnly: SetNumberInputOnly,
        GetCheckboxValue: GetCheckboxValue,
        KeepHeight: KeepHeight,
        FixedTableHeader: FixedTableHeader,
        ApplyTableStyle: ApplyTableStyle,
        ShowTreeView: ShowTreeView,
        Countdown: Countdown,
        tips: function () {
            $('[data-tip]').each(function () {
                var $this = this;
                var text = $(this).text().trim();
                var maxLength = $(this).attr('data-tip');

                $(this).attr('title', text);
                $(this).attr('data-toggle', 'tooltip');
                $(this).attr('data-placement', 'bottom');
                $(this).text(text.length > maxLength ? text.substr(0, maxLength) + '...' : text);
            }).tooltip();
        },
        DatePicker: function () {
            $('.date,[validate-rule=date],[validate-rule=dateOrNull]').datetimepicker({
                format: 'L',
                showClear: true,
                showTodayButton: true,
                locale: moment.locale('zh-cn')
            });
            $('.datetime,[validate-rule=dateTime],[validate-rule=dateTimeOrNull]').datetimepicker({
                format: 'YYYY-MM-DD HH:mm',
                showClear: true,
                showTodayButton: true,
                locale: moment.locale('zh-cn')
            });
            $('.time,[validate-rule=time],[validate-rule=timeOrNull]').datetimepicker({
                format: 'HH:mm',
                showClear: true,
                showTodayButton: true,
                locale: moment.locale('zh-cn')
            });
        }
    };

    window.mercurius = mercurius;
    window.alert = mercurius.ShowWarningMessage;
    window.confirm = mercurius.ShowConfirmMessage;
})();