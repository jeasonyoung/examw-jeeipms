<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/context/context.jsp"%>  
<!DOCTYPE html>
<html style="overflow-x:hidden;overflow-y:auto;">
<base href="<%=basePath%>"/>
<link href="plug-in/ztree/css/zTreeStyle/zTreeStyle.min.css" rel="stylesheet" type="text/css"/>
<script src="plug-in/agencycms/cms/js/jquery.min.js"></script> 
<script src="plug-in/ztree/js/jquery.ztree.core-3.5.min.js" type="text/javascript"></script>
<script src="plug-in/ztree/js/jquery.ztree.excheck-3.5.min.js" type="text/javascript"></script>
<head>
	<title>数据选择</title>
	<script type="text/javascript">
		var key, lastValue = "", nodeList = [];
		var tree, setting = {view:{selectedMulti:false},check:{enable:"${checked}",nocheckInherit:true},
				data:{simpleData:{enable:true}},
				view:{
					fontCss:function(treeId, treeNode) {
						return (!!treeNode.highlight) ? {"font-weight":"bold"} : {"font-weight":"normal"};
					}
				},
				callback:{beforeClick:function(id, node){
					if("${checked}" == "true"){
						tree.checkNode(node, !node.checked, true, true);
						return false;
					}
				}, 
				onDblClick:function(){
					top.$.jBox.getBox().find("button[value='ok']").trigger("click");
					//alert($("input[type='text']", top.mainFrame.document).val());
					//$("input[type='text']", top.mainFrame.document).focus();
				}}};
		$(document).ready(function(){
			$.get("${url}${fn:indexOf(url,'?')==-1?'?':'&'}t="+new Date().getTime(), function(zNodes){
				// 初始化树结构
				tree = $.fn.zTree.init($("#tree"), setting, zNodes);
				
				// 默认展开一级节点
				var nodes = tree.getNodesByParam("level", 0);
				for(var i=0; i<nodes.length; i++) {
					tree.expandNode(nodes[i], true, false, false);
				}
				// 默认选择节点
				var ids = "${selectIds}".split(",");
				for(var i=0; i<ids.length; i++) {
					var node = tree.getNodeByParam("id", ids[i]);
					if("${checked}" == "true"){
						try{tree.checkNode(node, true, true);}catch(e){}
						tree.selectNode(node, false);
					}else{
						tree.selectNode(node, true);
					}
				}
			});
			//key = $("#key");
			//key.bind("focus", focusKey).bind("blur", blurKey).bind("change keydown cut input propertychange", searchNode);
		});
	</script>
</head>
<body>
	<div id="tree" class="ztree" style="padding:15px 20px;"></div>
</body>