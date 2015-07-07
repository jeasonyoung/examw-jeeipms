<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools"></t:base>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="courseList" title="机构课程" actionUrl="syscourseController.do?datagrid&agencyId=${agencyId}" idField="id" fit="true" queryMode="group">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="课程名称" field="coursename" ></t:dgCol>
   <t:dgCol title="课程类别" field="category_categoryname" ></t:dgCol>
   <t:dgCol title="类型" field="coursetype" query="true" replace="面授_0,视频_1,试卷_2"></t:dgCol>
   <t:dgCol title="优惠价" field="favorableprice" ></t:dgCol>
   <t:dgCol title="添加时间" field="addtime" formatter="yyyy-MM-dd"></t:dgCol>
   <t:dgCol title="修改时间" field="updatetime" formatter="yyyy-MM-dd"></t:dgCol>
   <t:dgCol title="免费" field="isfree"  query="true" replace="否_0,是_1"></t:dgCol>
   <t:dgCol title="状态" field="status" query="true" replace="未审核_0,审核通过_1,审核未过_2"></t:dgCol>
   <t:dgCol title="排序" field="courseorder" ></t:dgCol>
   <t:dgCol title="操作" field="opt" width="50"></t:dgCol>
   <t:dgDelOpt title="删除" url="syscourseController.do?del&id={id}" />
   <t:dgFunOpt exp="status#ne#1" operationCode="szqm" funname="szqm(id)" title="审核" />
   <t:dgToolBar title="编辑" icon="icon-edit" url="syscourseController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="syscourseController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>
<script type="text/javascript">
	function szqm(id) {
		createwindow('审核', 'syscourseController.do?doCheck&id=' + id);
	}	
</script>