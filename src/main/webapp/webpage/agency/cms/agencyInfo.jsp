 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/context/context.jsp"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>"/>
<title>机构信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script type="text/javascript">window.UEDITOR_HOME_URL= "/plug-in/ueditor/"</script>
<script type="text/javascript" src="plug-in/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="plug-in/ueditor/ueditor.all.min.js"></script>
</head>
<body>
<!--Header-part-->
<%@include file="common/head.jsp"%>
<!--close-Header-part--> 
<!--top-Header-menu-->
<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="agencycms.do?login" title="返回会员首页" class="tip-bottom"><i class="icon-home"></i>会员首页</a> <a href="javascript:;">机构管理</a> <a href="javascript:;" class="current">机构信息</a></div>
  </div>
  <div class="container-fluid">
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>基本信息</h5>
          </div>
          <div class="widget-content nopadding">
          <tags:message content="${message}"/>
            <form class="form-horizontal" method="post" action="agencycms.do?save" id="agencyform" >
              
              <div class="control-group">
                <label class="control-label">公司名称</label>
                <div class="controls">
                  <input name="name" type="text" value="${agency.name}" disabled>
                  <input type="hidden" name="id"  value="${agency.id}">
                </div>
              </div>
              <div class="control-group">
                <label class="control-label">关键字</label>
                <div class="controls">
                  <input type="text" name="keywords" id="keywords" value="${agency.keywords}">
                </div>
              </div>
              <div class="control-group">
                <label class="control-label">培训类别</label>
                <div class="controls">
                   <tags:treeselect id="category" name="category" value="${agency.category}" validate="{required:true}"  labelValue="${agency.categoryname}" labelName="categoryname" checked="true"
					title="类别" url="agencycmscourseCategory.do?treeMain"  notAllowSelectRoot="false" cssClass="input-small" cssStyle="width:161px;"/>
                </div>
              </div>
              <div class="control-group">
                <label class="control-label">办公电话</label>
                <div class="controls">
                  <input type="text" name="officephone" id="officephone" value="${agency.officephone}">
                </div>
              </div>
              <div class="control-group">
                <label class="control-label">公司传真</label>
                <div class="controls">
                  <input type="text" name="fax" id="fax" value="${agency.fax}">
                </div>
              </div>
             <div class="control-group">
                <label class="control-label">公司地址</label>
                <div class="controls" id="selectArea" >           
                  <span id="demo1"  style="display:inline-block; width:px;"></span>
						
						<input class="inputxt" id="provinceid" type="hidden" name="province.id"  value="${agency.province.id}" >
						
						<input class="inputxt" id="cityid" type="hidden" name="city.id" value="${agency.city.id}" >
						
						<input class="inputxt" id="areaid" name="area.id" type="hidden" value="${agency.area.id}" >
                </div>
              </div>
              <div class="control-group">
                <label class="control-label">详细地址</label>
                <div class="controls">
                  <input type="text" name="address" id="address" value="${agency.address}" />
                </div>
              </div>
              <div class="control-group">
                  <label class="control-label">机构LOGO</label>
                  <div class="controls">
                  	<input id="imageurl" name="imageurl" maxlength="255" class="input-xlarge" type="hidden" value="${agency.imageurl}"/> 
				    <tags:ckfinder input="imageurl" type="images" uploadPath="test" selectMultiple="false"/>
                  </div>
               </div> 
              <div class="control-group">
                <label class="control-label">公司摘要</label>
                <div class="controls">
                  <textarea rows="6"  name="abbreviation" style="width:700px;"  validate="{required:true,minlength:20,maxlength:240}" >${agency.abbreviation}</textarea>
                </div>
              </div>
              <div class="control-group">
                <label class="control-label">公司介绍</label>
                <div class="controls">
                  <script type="text/plain" id="editor" name="myeditor">${agency.introduction}</script>
                </div>
              </div>
             <div class="modal-footer">
                <button type="submit" class="btn btn-primary" id="but_login">保存</button>
              </div>    
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!--Footer-part-->
<%@include file="common/foot.jsp"%>
<!--end-Footer-part-->
</body>
<style>
#demo1 span {width:auto!important;}
}
</style>
<script src="plug-in/agencycms/cms/js/jquery.validate.js"></script> 
<script src="plug-in/agencycms/cms/js/jquery.metadata.js"></script> 
<script src="plug-in/agencycms/cms/js/messages_cn.js"></script> 
<script src="plug-in/agencycms/cms/js/validator.js"></script>
<script type="text/javascript" src="plug-in/area/chinaprovinces_0.2.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
			//导航栏样式
			var style = $("#li_agency").attr("class");
			$("#li_agency").attr("class","active  open "+style);
			//修改表单验证
			$.metadata.setType("attr", "validate");
			$("#agencyform").validate({
					errorClass: "help-inline",
					errorElement: "span",
					highlight:function(element, errorClass, validClass) {
						$(element).parents('.control-group').removeClass('success');
						$(element).parents('.control-group').addClass('error');
					},
					unhighlight: function(element, errorClass, validClass) {
						$(element).parents('.control-group').removeClass('error');
						$(element).parents('.control-group').addClass('success');
					}
					
					
			});
			//城市下拉框
			$("#demo1").chinaprovinces({
				province: "${agency.province.id}",  //默认的省份<br />      
				city:'${agency.city.id}',       //默认的城市<br />      
				area: '${agency.area.id}',      //默认的区
				valueType:'id',
				change:function(province,city,area){
					$("#provinceid").val(province);
					$("#cityid").val(city);
					$("#areaid").val(area);
				}});
			//初始化ueditor
			UE.getEditor('editor');
		});
	</script>
</html>

</html>
