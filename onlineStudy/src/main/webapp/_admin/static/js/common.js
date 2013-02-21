/**
 * 将json对象回填
 * @param Obj
 */
function autoEdit(Obj){
	for(var i in Obj){
		if(Obj[i]==null){
			continue;
		}
		if($("#edit"+i).hasClass("easyui-datebox")){
			$("#edit"+i).datebox("setValue",Obj[i]);
		}else if($("#edit"+i).hasClass("easyui-numberbox")){
			$("#edit"+i).numberbox("setValue",Obj[i]);
		}
		$("#edit"+i).val(Obj[i]+"");
	}
}
function autoVal(Obj){
	for(var i in Obj){
		if(Obj[i]==null){
			continue;
		}
		if($("#"+i).hasClass("easyui-datebox")){
			$("#"+i).datebox("setValue",Obj[i]);
		}else if($("#"+i).hasClass("easyui-numberbox")){
			$("#"+i).numberbox("setValue",Obj[i]);
		}else{
			$("#"+i).val(Obj[i]+"");
		}
		
	}
}
/**
 * 对页面的json对象进行处理
 * @param Obj
 */
function editJSON(Obj){
	for(var i in Obj){
		if($("#edit"+i).length>0){
			Obj[i]=$("#edit"+i).val();
		}
	}
}
function createObj(cls){
	var obj=new Object();
	var jsonarray=$('#'+cls).serializeArray();
	for(var i=0;i<jsonarray.length;i++){
		var json=jsonarray[i];
		obj[json.name.substring(5)]=json.value;
	}
	return obj;
}
/**
 * 创建一个新增对话框
 * @param dialogid
 * @param json
 * @param gridId
 * @param column
 */
Map = function() {
	this._entrys = null;
	this.initialize.apply(this.arguments);
};
Map.prototype = {
	initialize : function() {
		this._entrys = new Array();
	},
	put : function(key, value) {
		if (key == null || key == undefined) {
			return;
		}
		var index;
		if (this._entrys == null) {
			this._entrys = new Array();
			index = 0;
		} else {
			index = this._entrys.length;
		}
		if(this.contains(key)){
			for ( var i = 0; i < this._entrys.length; i++) {
				if (this._entrys[i].key == key) {
					this._entrys[i].value=value;
				} else {
					continue;
				}
			}
		}else{
			var entry = new Object();
			entry.key = key;
			entry.value = value;
			this._entrys[index] = entry;
		}
		
	},
	contains:function(value){
		   if(this._entrys != null) {
		       for ( var i = 0; i < this._entrys.length; i++) {
					if (this._entrys[i].key == value) {
						return true;
					} else {
						continue;
					}
				}
				return false;
		   }else{
		       return false;
		   }
		},
	get : function(key) {
		if (this._entrys != null) {
			for ( var i = 0; i < this._entrys.length; i++) {
				if (this._entrys[i].key == key) {
					return this._entrys[i].value;
				} else {
					continue;
				}
			}
			return "";
		} else {
			return "none";
		}

	},
	size:function(){
		if(this._entrys!=null){
			return this._entrys.length;
		}else{
			return 0;
		}
		
	}
};
function createCookie(name,value,days)
{
	if (days)
	{
		var date = new Date();
		date.setTime(date.getTime()+(days*24*60*60*1000));
		var expires = "; expires="+date.toGMTString();
	}
	else var expires = "";
	document.cookie = name+"="+value+expires+"; path=/";
}
function readCookie(name)
{
	var nameEQ = name + "=";
	var ca = document.cookie.split(';');
	for(var i=0;i < ca.length;i++)
	{
		var c = ca[i];
		while (c.charAt(0)==' ') c = c.substring(1,c.length);
		if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
	}
	return null;
}
function eraseCookie(name)
{
	createCookie(name,"",-1);
}
/**
 * 数据列显示
 * @param id
 */
function showDatagridColumn(id){
	var fields=$("#"+id).datagrid("getColumnFields");
	var fieldDialog=$("#showColumnDialog").length;
	var nowShowCol="";
	if(fieldDialog){
	}else{
		$("<div id='showColumnDialog' style='display:none;'></div>").appendTo("body");
	}
	var content="<dl class='columnDl'>";
	var columnLen=fields.length;
	for(var i = 0; i < fields.length; i++){
		var fieldOpt=$("#"+id).datagrid("getColumnOption",fields[i]);
		if(fieldOpt.hidden){
			content += "<dd><input type='checkbox' value='"+fieldOpt.field+"' name='column'/><lable>"+fieldOpt.title+"</lable></dd>"
		}else{
			nowShowCol +=fieldOpt.field+",";
			content += "<dd><input type='checkbox' checked='checked'  value='"+fieldOpt.field+"' name='column'/><lable>"+fieldOpt.title+"</lable></dd>"
		}
		
	}
	content+="</dl>";
	var dialogWidth=150+20;
	if(columnLen<10){
		
	}else{
		dialogWidth = ((columnLen/10)+1)*150+20;
	}
	$("#showColumnDialog").show().dialog({
		width:dialogWidth,
		height:300,
		title:"选择列",
		content:content,
		toolbar : [ {
			text : '选择',
			iconCls : 'icon-save',
			handler : function(){
				var checked=$(".columnDl dd>input[type='checkbox']");
				for ( var i = 0; i < checked.length; i++) {
					if(checked[i].checked){
						$("#"+id).datagrid("showColumn",$(checked[i]).val())
					}else{
						$("#"+id).datagrid("hideColumn",$(checked[i]).val())
					}
				}
				$("#"+id).datagrid("fixColumnSize");
				$("#showColumnDialog").dialog("close");
			}
		} ]
	});
}
function showDatagridColumnAll(id){
	var fields=$("#"+id).datagrid("getColumnFields");
	for(var i = 0; i < fields.length; i++){
		$("#"+id).datagrid("showColumn",fields[i])
	}
	$("#"+id).datagrid("fixColumnSize");
}

function exportExcel(gridId,posturl){
	var res=new Object();
	res.fieldNames="";
	res.fieldTitle="";
	var fields=$("#"+gridId).datagrid("getColumnFields");
	for ( var i = 0; i < fields.length; i++) {
		var fieldOpt=$("#"+gridId).datagrid("getColumnOption",fields[i]);
		res.fieldNames+=fieldOpt.field+",";
		res.fieldTitle+=fieldOpt.title+",";
	}
	return res;
}
function printXls(id,sheetName){
	var res=exportExcel(id);
	var rows= $("#"+id).datagrid("getData").rows;
	if(!(rows !=null && rows.length >0)){
		$.messager.alert("警告","没有可导出的数据","warning");
		return;
	}
	var data=$.toJSON(rows);
	var sendForm=$("#sendFormDownload").length;
	if(sendForm){
	}else{
		$("<div id='sendFormDownload' style='display:none;'><form method='post' id='download'></form></div>").appendTo("body");
	}
	$("#download").html("");
	$("<input type='hidden' name='docParam.columns' value='"+res.fieldTitle+"' />").appendTo("#download");
	$("<input type='hidden' name='docParam.fields' value='"+res.fieldNames+"' />").appendTo("#download");
	$("<input type='hidden' name='docParam.sheetNames' value='"+sheetName+"' />").appendTo("#download");
	$("<input type='hidden' name='revcMsg' value='"+data+"' />").appendTo("#download");
	$("#download").form("submit",{
		url:"finance/record_exportXLS",
        onSubmit: function(){
        }
	});
}
function showInfo(msg){
	$.messager.show({
		title:'提示',
		msg:"<span style='color:red;'>"+msg+"</span>",
		timeout:3000,
		showType:'show'
	});
}
function createFormGrid(gridId,renderTo){
}
function createFromTree(treeId,title,funcs){
    var columns = [];
    columns.push($("#"+treeId).treegrid("options").idField);
    columns.push($("#"+treeId).treegrid("options").treeField);
    columns = columns.concat($("#"+treeId).treegrid("getColumnFields"));
    var inputhtml = "<div class='control-group'>" +
        "<label class='control-label'>#showName#:</label>"+
        "<div class='controls'>" +
        "<input type='text' id='#id#' name='#name#' class='input-medium easyui-validatebox' placeholder='#placeMsg#' data-options='' /> " +
        "</div>"+
        "</div>";
    var selecthtml = "<div class='control-group'>" +
        "<label class='control-label'>#showName#:</label>"+
        "<div class='controls'>" +
        "<select type='text' id='#id#' name='#name#' class='input-medium easyui-validatebox'>#options#</select> " +
        "</div>"+
        "</div>";
    var hiddenhtml="<input type='hidden' id='#id#' name='#name#'/>";
    var outHtml="";
    for(var i=0;i<columns.length;i++){
        var opts = $("#"+treeId).treegrid("getColumnOption",columns[i]);
        if(opts){
            if(opts.input =="text"){
                outHtml += inputhtml.replace("#id#",opts.field).replace("#name#",opts.field).replace("#showName#",opts.title).replace("#placeMsg#","请输入信息");
            }else if(opts.input == "select"){
                var options = opts.select;
                console.debug(opts)
                var optHtml="";
                for(var j = 0;j<options.length;j++){
                    optHtml +="<option value="+options[j].key+">"+options[j].text+"</option>"
                }
                outHtml += selecthtml.replace("#id#",opts.field).replace("#name#",opts.field).replace("#showName#",opts.title).replace("#options#",optHtml);
            }else{
                outHtml += hiddenhtml.replace("#id#",columns[i]).replace("#name#",columns[i]);
            }
        }else{
            outHtml += hiddenhtml.replace("#id#",columns[i]).replace("#name#",columns[i]);
        }
    }
    $("#commontitle").html(title)
    $("#commonForm").html(outHtml);
    $("#commonModal").modal("show");
    $("#btn_OK").unbind("click");
    var click_function=function(){
        if(funcs.validation.apply()){
            $('#commonForm').form("submit",{
                url:funcs.url,
                onSubmit: function(){
                    return funcs.prefSubmit.apply();
                },
                success:function(data){
                    if(funcs.success(data)){
                        $("#"+treeId).treegrid("reload")
                    }
                }
            });
        }else{
            $.messager.alert("提示","请输入正确的数据","warning");
        }
    }
    $("#btn_OK").one("click",click_function);
}
function editFromTree(treeId,title,funcs){
    var columns = [];
    columns.push($("#"+treeId).treegrid("options").idField);
    columns.push($("#"+treeId).treegrid("options").treeField);
    columns = columns.concat($("#"+treeId).treegrid("getColumnFields"));
    var inputhtml = "<div class='control-group'>" +
        "<label class='control-label'>#showName#:</label>"+
        "<div class='controls'>" +
        "<input type='text' id='#id#' name='#name#' class='input-medium easyui-validatebox' placeholder='#placeMsg#' data-options='' /> " +
        "</div>"+
        "</div>";
    var selecthtml = "<div class='control-group'>" +
        "<label class='control-label'>#showName#:</label>"+
        "<div class='controls'>" +
        "<select type='text' id='#id#' name='#name#' class='input-medium easyui-validatebox'>#options#</select> " +
        "</div>"+
        "</div>";
    var hiddenhtml="<input type='hidden' id='#id#' name='#name#'/>";
    var outHtml="";
    for(var i=0;i<columns.length;i++){
        var opts = $("#"+treeId).treegrid("getColumnOption",columns[i]);
        if(opts){
            if(opts.input =="text"){
                outHtml += inputhtml.replace("#id#","edit"+opts.field).replace("#name#",opts.field).replace("#showName#",opts.title).replace("#placeMsg#","请输入信息");
            }else if(opts.input == "select"){
                var options = opts.select;
                var optHtml="";
                for(var j = 0;j<options.length;j++){
                    optHtml +="<option value="+options[j].key+">"+options[j].text+"</option>"
                }
                outHtml += selecthtml.replace("#id#","edit"+opts.field).replace("#name#",opts.field).replace("#showName#",opts.title).replace("#options#",optHtml);
            }else{
                outHtml += hiddenhtml.replace("#id#","edit"+columns[i]).replace("#name#",columns[i]);
            }
        }else{
            outHtml += hiddenhtml.replace("#id#","edit"+columns[i]).replace("#name#",columns[i]);
        }
    }
    $("#commontitle").html(title)
    $("#commonForm").html(outHtml);
    var currentNode=$("#"+treeId).treegrid("getSelected");
    autoEdit(currentNode);
    $("#commonModal").modal("show");
    $("#btn_OK").unbind("click");
    var click_function=function(){
        if(funcs.validation.apply()){
            $('#commonForm').form("submit",{
                url:funcs.url,
                onSubmit: function(){
                    return funcs.prefSubmit.apply();
                },
                success:function(data){
                    if(funcs.success(data)){
                        $("#"+treeId).treegrid("reload")
                    }
                }
            });
        }else{
            $.messager.alert("提示","请输入正确的数据","warning");
        }
    }
    $("#btn_OK").one("click",click_function);
}
function delTreeDate(treeId,url,sendData){
    $.messager.confirm('警告','你确定要删除此功能模块吗？',function(flag){
        if(flag){
            $.ajax({
                url:url,
                data:sendData,
                dataType:'json',
                type:'post',
                success:function(data){
                    if(data == "true"){
                        $.messager.alert('提示','删除成功','warnning');
                        $('#'+treeId).treegrid("reload");
                    }
                }
            });
        }
    });
    var selectNode=$('#'+treeId).treegrid('getSelected');
    if(selectNode!=null){

    }else{
        $.messager.alert('提示','请选择要删除的数据','warnning');
    }
}
SendClick =function(){
}
SendClick.prototype = {
    url:"",
    validation:function(){
        $('#commonForm .easyui-validatebox').validatebox();
        return $('#commonForm .easyui-validatebox').validatebox("isValid")
    },
    prefSubmit:function(){

    },
    success:function(data){
        if(data == "true"){
            $("#commonModal").modal("hide") ;
            return true;
        }else{
            $("#commonModal").modal("hide");
            return false;
        }
    }
}