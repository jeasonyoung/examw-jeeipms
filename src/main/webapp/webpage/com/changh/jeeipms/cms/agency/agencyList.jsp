<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<script src="plug-in/jquery/jquery-autocomplete/jquery.autocomplete.js" type="text/javascript"></script>
<SCRIPT type="text/javascript">
        function parse(data){
            	var parsed = [];
		        	$.each(data.rows,function(index,row){
		        		parsed.push({data:row,result:row,value:row.id});
		        	});
        				return parsed;
        }
        /**
         * 选择后回调 
         * 
         * @param {Object} data
         */
        function callBack(data) {
        	$("#agency").val(data.name);
        	$("input[name='name']").val(data.name);
        	
        }
         /**
          * 每一个选择项显示的信息
          * 
          * @param {Object} data
          */
        function formatItem(data) {
        	return data.name;
        }

  </SCRIPT>
<link href="plug-in/jquery/jquery-autocomplete/jquery.autocomplete.css" rel="stylesheet" type="text/css" /> 
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="agencyList" title="机构管理" actionUrl="sysagencyController.do?datagrid" idField="id" fit="true" queryMode="group">
   <t:dgCol title="编号" field="id" hidden="false"></t:dgCol>
   <t:dgCol title="公司名称" field="name" frozenColumn="true" query="true" width="180"></t:dgCol>
   <t:dgCol title="公司简称" field="abbreviation" hidden="false"></t:dgCol>
   <t:dgCol title="所在省份" field="province_province" width="80" queryMode="single"  query="true" replace="${province}"></t:dgCol>
   <t:dgCol title="所在城市" field="city_city" queryMode="single" ></t:dgCol>
   <t:dgCol title="所在地区" field="area_area" queryMode="single"  hidden="false"></t:dgCol>
   <t:dgCol title="关键字" field="keywords" hidden="false"></t:dgCol>
   <t:dgCol title="公司地址" field="address" hidden="false"></t:dgCol>
   <t:dgCol title="办公电话" field="officephone" ></t:dgCol>
   <t:dgCol title="传真" field="fax" hidden="false"></t:dgCol>
   <t:dgCol title="二级域名" field="secondDomain"></t:dgCol>
   <t:dgCol title="公司简介" field="introduction" hidden="false" ></t:dgCol>
   <t:dgCol title="注册时间" field="createTime" formatter="yyyy-MM-dd hh:mm:ss" query="true" queryMode="group"></t:dgCol>
   <t:dgCol title="备注" field="content"></t:dgCol>
   <t:dgCol title="状态"  field="status"  query="true"  replace="未审核_0,已审核_1"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="80"></t:dgCol>
   <t:dgDelOpt title="删除" url="sysagencyController.do?del&id={id}" />
   <t:dgFunOpt exp="status#eq#0" operationCode="szqm" funname="szqm(id)" title="审核" />
   <t:dgFunOpt operationCode="releaseAgency" funname="releaseAgency(id)" title="发布" />
   <t:dgFunOpt  operationCode="test" funname="test(id)" title="查看管理员" />
   <t:dgToolBar title="录入" icon="icon-add" url="sysagencyController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="sysagencyController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="sysagencyController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>
<script type="text/javascript">
	function szqm(id) {
		createwindow('审核', 'sysagencyController.do?doCheck&id=' + id);
	}
	function test(id){
		addOneTab('用户管理','sysagencyUserController.do?agencyId&ape_id='+id,'pie');
		
	}
	$(document).ready(function(){
		$("input[name='createTime_begin']").attr("class","easyui-datebox");
		$("input[name='createTime_end']").attr("class","easyui-datebox");
	});
	function releaseAgency(id){
		createwindow('发布', 'agencyReleaseWith.do?menu&id=' + id);
	}
</script>
 