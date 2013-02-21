$(function(){
	//初始化
	initTreegrid();
});
function initTreegrid(){
	$('#resourcegrid').treegrid({
		title:'资源信息',
		animate:true,
		height:400,
		url:'_control/menulist.do',
		idField:'mid',
		treeField:'showText',
		parentField:"pid",
        toolbar:"#menuTools",
		frozenColumns:[[{field:'showText',width:150,title:'名称',input:'text'}]],
		columns:[[
			{field:'attrs',width:80,title:'类型',input:'select',select:[{"key":1,"text":"功能"},{"key":0,"text":"菜单"}],formatter:function(value){
				if(value=="1"){
					return "功能";
				}else if(value=="0"){
					return "菜单";
				}
			}},
			{field:'url',title:'路径',width:300,input:"text"},
            {field:'pid',hidden:true},
			{field:'cangrant',title:'可否授权',width:80,input:'select',select:[{"key":true,"text":"是"},{"key":false,"text":"否"}],formatter:function(value){return value?"是":"否"}}
		]],
		onDblClickRow:function(row){
			$(this).treegrid('toggle',row.mid);
		},
		onClickRow:function(row){
            $(this).treegrid("unselectAll");
			if(row.select){
                $("#btn_remove").addClass("disabled").attr("disabled","disabled");
                $("#btn_edit").addClass("disabled").attr("disabled","disabled");
				row.select=false;
			}else{
				$(this).treegrid("select",row.mid);
                $("#btn_remove").removeClass("disabled").removeAttr("disabled");
                $("#btn_edit").removeClass("disabled").removeAttr("disabled");
				row.select=true;
			}
		},
		onBeforeExpand:function(node){
			if(node.children){
				
			}else{
				$.messager.show({title:'提示',msg:'没有资源',timeout:600});
				return false;
			}
		},
		loadFilter:function (data, parent) {
			var opt = $(this).data().treegrid.options;
			var parentField,idField;
			if (opt.parentField) {
				idField=opt.idField||"id";
				parentField =opt.parentField;
				var i,l,treeData = [],tmpMap = [];
				if(data){
					for (i = 0, l = data.length; i < l; i++) {
						tmpMap[data[i][idField]] = data[i];
						data[i].iconCls=data[i].icon;
                        data[i].name = data[i].showText;
					}
					for (i = 0, l = data.length; i < l; i++) {
						if (tmpMap[data[i][parentField]] && data[i][idField] != data[i][parentField]) {
							if (!tmpMap[data[i][parentField]]['children'])
								tmpMap[data[i][parentField]]['children'] = [];
							data[i]=data[i];
							tmpMap[data[i][parentField]]['state']="closed";
							tmpMap[data[i][parentField]]['children'].push(data[i]);
						} else {
							data[i]=data[i];
							treeData.push(data[i]);
						}
					}
					return treeData;
				}else{
					return data;
				}
			}
			return data;
		}
	});
}
/**
 * 新增窗口
 */
function openAddMenu(){
	var currentNode=$("#resourcegrid").treegrid("getSelected");
    var funcs =new SendClick();
    funcs.prefSubmit=function(){
        if($("#attrs").val() == 0){
            var currentNode=$("#resourcegrid").treegrid("getSelected");
            if(currentNode){
                $("#pid").val(currentNode.mid);
            }
        }
        return true;
    };
    funcs.url = "_control/addMenu.do";
    createFromTree("resourcegrid","增加菜单",funcs);
    if(currentNode !=null){
        $("#pid").val(currentNode.mid);
    }
}
function openEditMenu(){
    var funcs =new SendClick();
    funcs.url = "_control/editMenu.do";
    editFromTree("resourcegrid","修改菜单",funcs);
}
function editMenu(){
    $('#editMenuForm .easyui-validatebox').validatebox();
    if($('#editMenuForm .easyui-validatebox').validatebox("isValid")){
        $('#editMenuForm').form("submit",{
            url:"_control/editMenu.do",
            onSubmit: function(){
            },
            success:function(data){
                if(data == "true"){
                    $("#editMenuDialog").modal("hide") ;
                    $('#resourcegrid').treegrid("reload");
                }else{
                    $("#editMenuDialog").modal("hide");
                }
            }
        });
    }else{
        $.messager.alert("提示","验证不通过");
    }
}
/**
 * 删除权限
 */
function delMenu(){
	var selectNode=null;
    $("#btn_remove").addClass("disabled").attr("disabled","disabled");
	selectNode=$('#resourcegrid').treegrid('getSelected');
	if(selectNode!=null){
        delTreeDate("resourcegrid",'_control/delMenu.do',"mid="+selectNode.mid);
	}else{
		$.messager.alert('提示','请选择要删除的模块或者功能','warnning');
	}
}