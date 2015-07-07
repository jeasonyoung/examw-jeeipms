<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="photoList" title="机构相册" actionUrl="sysphotoController.do?datagrid" height="100" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="名称" field="title" width="80"></t:dgCol>
   <t:dgCol title="机构" field="agency_name" width="80"></t:dgCol>
   <t:dgCol title="预览" field="thumbUrl"  image="true"  width="100"></t:dgCol>
   <t:dgCol title="介绍" field="content" ></t:dgCol>
   <t:dgCol title="添加时间" field="addtime" formatter="yyyy-MM-dd hh:mm:ss"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="60"></t:dgCol>
   <t:dgDelOpt title="删除" url="sysphotoController.do?del&id={id}" />
  </t:datagrid>
  </div>
 </div>
 <style>
img{
    max-width:117px; 
    max-height:90px;
    scale:expression((this.offsetWidth / this.offsetHeight > 117/90)?(this.style.width = this.offsetWidth >= 117 ? "117px" : "auto"):(this.style.height = this.offsetHeight >= 90 ? "90px" : "auto")); //ie
    display:inline !important;
	}
 </style>