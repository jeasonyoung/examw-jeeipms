<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools"></t:base>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="coursePackageList" title="课程套餐" actionUrl="syscoursePackageController.do?datagrid&agencyId=${agencyId}" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="套餐名称" field="pkgName" ></t:dgCol>
   <t:dgCol title="原价" field="pkgPrice" ></t:dgCol>
   <t:dgCol title="优惠价" field="goodPrice" ></t:dgCol>
   <t:dgCol title="课时" field="pkgTime" ></t:dgCol>
   <t:dgCol title="状态" field="status" query="true" replace="未审核_0,审核通过_1,审核未过_2"></t:dgCol>
   <t:dgCol title="到期时间" field="dueTime" formatter="yyyy-MM-dd hh:mm:ss"></t:dgCol>
   <t:dgCol title="修改时间" field="updatetime" formatter="yyyy-MM-dd hh:mm:ss"></t:dgCol>
   <t:dgCol title="添加时间" field="addtime" formatter="yyyy-MM-dd hh:mm:ss"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="syscoursePackageController.do?del&id={id}" />
   <t:dgFunOpt exp="status#ne#1" operationCode="szqm" funname="szqm(id)" title="审核" />
   <t:dgToolBar title="查看" icon="icon-search" url="syscoursePackageController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>
 <script type="text/javascript">
	function szqm(id) {
		createwindow('审核', 'syscoursePackageController.do?doCheck&id=' + id);
	}	
</script>