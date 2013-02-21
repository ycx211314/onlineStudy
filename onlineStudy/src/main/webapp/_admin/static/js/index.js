function reload(tab,openurl){
    $.messager.progress({interval:100});
    $(tab).children(".content").load(openurl, function (response, status, xhr) {
        if (status == "error") {
            $(this).html("加载出错");
            $.messager.progress("close");
        }else{
            $.messager.progress("close");
    }
    });
}
$(function () {
    $('#content').tabs({
        border: true,
        fit: true,
        tools: [
            {
                iconCls: 'icon-reload',
                handler: function () {
                    var tab = $("#content").tabs("getSelected");
                    reload(tab)
                }
            }
        ]
    });
    $("#resTree").tree({
        url: "_control/listMenu.do",
        idField: "mid",
        parentField: "pid",
        onClick: function (node) {
            if (!$(this).tree("isLeaf", node.target)) {
                $(this).tree("collapseAll");
                $(this).tree("toggle", node.target);
                return;
            } else {
                openNewDialog(node.text, node.attributes, false);
            }
        },
        onSelect: function (node) {
            if (node.checed) {
                $(this).tree("toggle", node.target)
            } else {

            }
        },
        onContextMenu: function (e, node) {
            if (!$(this).tree("isLeaf", node.target)) {
                return;
            } else {
                e.preventDefault();
                $(this).tree('select', node.target);
                var tab = $('#content').tabs('getSelected');
                var index = $('#content').tabs('getTabIndex', tab);
                if (index == 0) {
                    $("#mm").menu("disableItem", $("#btn_cur"));
                } else {
                    $("#mm").menu("enableItem", $("#btn_cur"));
                }
                $('#mm').menu('show', {
                    left: e.pageX,
                    top: e.pageY
                });
            }

        },
        loadFilter: function (data, parent) {
            var opt = $(this).data().tree.options;
            var parentField, idField;
            if (opt.parentField) {
                idField = opt.idField || "id";
                parentField = opt.parentField;
                var i, l, treeData = [], tmpMap = [];
                if (data) {
                    for (i = 0, l = data.length; i < l; i++) {
                        tmpMap[data[i][idField]] = data[i];
                        data[i].id = data[i].mid;
                        data[i].text = data[i].showText;
                        data[i].urltype = data[i].attrs;
                        data[i].attributes = data[i].url;
                    }
                    for (i = 0, l = data.length; i < l; i++) {
                        if (tmpMap[data[i][parentField]] && data[i][idField] != data[i][parentField]) {
                            if (!tmpMap[data[i][parentField]]['children'])
                                tmpMap[data[i][parentField]]['children'] = [];
                            data[i] = data[i];
                            tmpMap[data[i][parentField]]['state'] = "closed";
                            tmpMap[data[i][parentField]]['children'].push(data[i]);
                        } else {
                            data[i] = data[i];
                            treeData.push(data[i]);
                        }
                    }
                    return treeData;
                } else {
                    return data;
                }
            }
            return data;
        }
    });
});
var currentPage = 1;
function openTab() {
    var node = $("#resTree").tree("getSelected");
    openNewDialog(node.text, node.attributes, true);
}
function updateTab() {
    var node = $("#resTree").tree("getSelected");
    openNewDialog(node.text, node.attributes, false);
}
function openNewDialog(name, openurl, urltype) {
    var tab = $("#content").tabs("tabs");
    if (tab.length > 5 && !$("#content").tabs("exists", name)) {
        $.messager.alert("信息", "你打开了过多的标签", "warnning");
        return;
    } else if ($("#content").tabs("exists", name)) {
        $("#content").tabs("select", name);
        return;
    }
    if (tab.length == 1) {
        urltype = true;
    }
    if (openurl == null || (openurl && openurl.length < 2)) {
        openurl = "jsp/develop.jsp";
    }
    if (urltype) {
        //新打开窗口
        var currentContent = $("<div class='content'></div>");
        $('#content').tabs('add', {
            title: name,
            closable: true,
            cache: false,
            content: currentContent
        });
        $(currentContent).load(openurl, function (response, status, xhr) {
            if (status == "error") {
                $(this).html("加载出错")
            }else{
                $.messager.progress("close");
            }
        });
        currentPage++;
    } else {
        var tab = $("#content").tabs("getSelected");
        reload(tab,openurl);
        $('#content').tabs('update', {
            tab: tab,
            options: {
                title: name
            }
        });
}
}
function progressbar() {
    function progreeSet() {
        var value = $('#pbar').progressbar('getValue');
        if (value < 100) {
            value += 20;
            $('#pbar').progressbar('setValue', value);
            setTimeout(progreeSet, 100);
        } else {
            $('#progressbar').dialog("close");
        }
    };
    $('#progressbar').show().dialog({
        width: 415,
        height: 30,
        modal: true,
        noheader: true,
        onOpen: function () {
            setTimeout(progreeSet, 100);
        }
    });
}
/**
 * 修改密码
 */
function upPwd() {
    if ($('#upPwdForm').form("validate")) {
        $('#upPwdForm').form("submit", {
            url: "system/system_updatePassword",
            onSubmit: function () {

            },
            dataType: 'json',
            success: function (data) {
                if (!isForbidden(data)) {
                    return;
                }
                var djson = $.evalJSON(data);
                if (djson.flag == "OK") {
                    $("#changePwd").dialog("close");
                } else {
                    $.messager.alert("信息", "出现未知错误，请联系管理员", 'warnning');
                }
            }
        });
    }
}
function openChangeDialog(flag) {
    if (flag) {
        $("#upPwdForm h4").hide();
        $("#changePwd").dialog({
            width: 300,
            height: 220,
            modal: true,
            closable: false,
            buttons: [
                {text: '修改', plain: true, handler: upPwd, iconCls: 'icon-ok'},
                {id: 'btnPWDCacle', text: '取消', plain: true, handler: closeChangeDialog, iconCls: 'icon-cancel'}
            ],
            onOpen: function () {
                $('#upPwdForm').form("clear");
            },
            title: "修改密码"
        });
    } else {
        $("#changePwd").dialog({
            width: 300,
            height: 220,
            modal: true,
            closable: false,
            buttons: [
                {text: '修改', plain: true, handler: upPwd, iconCls: 'icon-ok'}
            ],
            onOpen: function () {
                $('#upPwdForm').form("clear");
            },
            title: "修改密码"
        });
    }
}
function closeChangeDialog() {
    $("#changePwd").dialog("close");
}