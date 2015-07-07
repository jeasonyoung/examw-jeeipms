<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<script type="text/javascript">
$(function() {
		$('#agencytree').tree({
			animate : true,
			url : 'syscourseController.do?pDemoList',
			onClick : function(node) {
				if ($('#agencytree').tree('isLeaf', node.target)) {
					$("#coursePackage").attr('src','syscoursePackageController.do?list&agencyId='+node.id)
				} else {
					$('#agencytree').tree('expand', node.target);
				}
			}
		});
 });
</script>
<div class="easyui-layout" fit="true">
<link rel="stylesheet" href="plug-in/Validform/css/divfrom.css" type="text/css">
<link rel="stylesheet" href="plug-in/Validform/css/style.css" type="text/css">
<div region="center" title="套餐管理" style="padding: 3px;" class="easyui-panel" >
  <iframe name="coursePackage" id="coursePackage" scrolling="yes" frameborder="0" style="width: 100%; height: 99%;"></iframe>
</div>
<div region="west" style="width: 150px;" title="培训机构" split="true">
<div class="easyui-panel" style="padding: 1px;" fit="true" border="false">
<ul id="agencytree">
</ul>
</div>
</div>
</div>
