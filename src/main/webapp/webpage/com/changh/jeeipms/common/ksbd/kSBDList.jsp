<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="kSBDList" title="考试宝典" actionUrl="syskSBDController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="考试类别" field="classId" ></t:dgCol>
   <t:dgCol title="宝典英文名" field="ksbdEname" ></t:dgCol>
   <t:dgCol title="宝典中文名" field="ksbdCname" ></t:dgCol>
   <t:dgCol title="价格" field="price" ></t:dgCol>
   <t:dgCol title="版本" field="ksbdVersion" ></t:dgCol>
   <t:dgCol title="优惠价" field="goodPrice" ></t:dgCol>
   <t:dgCol title="保存路径" field="savepath" ></t:dgCol>
   <t:dgCol title="试题数" field="questionNum" ></t:dgCol>
   <t:dgCol title="下载次数" field="downNum" ></t:dgCol>
   <t:dgCol title="更新时间" field="updateTime" formatter="yyyy-MM-dd hh:mm:ss"></t:dgCol>
   <t:dgCol title="电信下载" field="dxUrl" ></t:dgCol>
   <t:dgCol title="网通下载" field="wtUrl" ></t:dgCol>
   <t:dgCol title="宝典简介" field="ksbdDescr" ></t:dgCol>
   <t:dgCol title="宝典介绍" field="ksbdIntro" ></t:dgCol>
   <t:dgCol title="关键字" field="keywords" ></t:dgCol>
   <t:dgCol title="模板" field="ksbdTemp" ></t:dgCol>
   <t:dgCol title="添加时间" field="addTime" formatter="yyyy-MM-dd hh:mm:ss"></t:dgCol>
   <t:dgCol title="标题" field="ksbdTitle" ></t:dgCol>
   <t:dgCol title="历年真题" field="realQuestion" ></t:dgCol>
   <t:dgCol title="是否解析" field="ifAnalysis" ></t:dgCol>
   <t:dgCol title="图片地址" field="imgUrl" ></t:dgCol>
   <t:dgCol title="域名" field="ksbdDomain" ></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="syskSBDController.do?del&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="syskSBDController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="syskSBDController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="syskSBDController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>