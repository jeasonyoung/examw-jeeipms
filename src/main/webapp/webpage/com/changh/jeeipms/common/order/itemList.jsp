<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<script type="text/javascript">
	$('#addItemBtn').linkbutton({   
	    iconCls: 'icon-add'  
	});  
	$('#delItemBtn').linkbutton({   
	    iconCls: 'icon-remove'  
	}); 
	$('#addItemBtn').bind('click', function(){   
 		 var tr =  $("#add_item_table_template tr").clone();
	 	 $("#add_item_table").append(tr);
	 	 resetTrNum('add_item_table');
    });  
	$('#delItemBtn').bind('click', function(){   
      	$("#add_item_table").find("input:checked").parent().parent().remove();   
        resetTrNum('add_item_table'); 
    }); 
    $(document).ready(function(){
    	$(".datagrid-toolbar").parent().css("width","auto");
    });
</script>
<div style="padding: 3px; height: 25px;width:auto;" class="datagrid-toolbar">
	<a id="addItemBtn" href="#">添加</a> <a id="delItemBtn" href="#">删除</a> 
</div>
<div style="width: auto;height: 135px;overflow-y:auto;overflow-x:scroll;">
<table border="0" cellpadding="2" cellspacing="0" id="item_table">
	<tr bgcolor="#E6E6E6">
		<td align="center" bgcolor="#EEEEEE">序号</td>
				  <td align="left" bgcolor="#EEEEEE">课程</td>
				  <td align="left" bgcolor="#EEEEEE">课程名称</td>
				  <td align="left" bgcolor="#EEEEEE">原价</td>
				  <td align="left" bgcolor="#EEEEEE">优惠价格</td>
				  <td align="left" bgcolor="#EEEEEE">备注</td>
	</tr>
	<tbody id="add_item_table">	
	<c:if test="${fn:length(itemList)  <= 0 }">
			<tr>
				<td align="center"><input style="width:20px;"  type="checkbox" name="ck"/></td>
				  <td align="left"><input name="itemList[0].courseId" maxlength="32" type="text" style="width:120px;" ></td>
				  <td align="left"><input name="itemList[0].courseName" maxlength="100" type="text" style="width:120px;" ></td>
				  <td align="left"><input name="itemList[0].itemOprice" maxlength="" type="text" style="width:120px;" ></td>
				  <td align="left"><input name="itemList[0].itemRprice" maxlength="" type="text" style="width:120px;" ></td>
				  <td align="left"><input name="itemList[0].itemContent" maxlength="200" type="text" style="width:120px;" ></td>
   			</tr>
	</c:if>
	<c:if test="${fn:length(itemList)  > 0 }">
		<c:forEach items="${itemList}" var="poVal" varStatus="stuts">
			<tr>
				<td align="center"><input style="width:20px;"  type="checkbox" name="ck" /></td>
				   <td align="left"><input name="itemList[${stuts.index }].courseId" maxlength="32" value="${poVal.courseId }" type="text" style="width:120px;"></td>
				   <td align="left"><input name="itemList[${stuts.index }].courseName" maxlength="100" value="${poVal.courseName }" type="text" style="width:120px;"></td>
				   <td align="left"><input name="itemList[${stuts.index }].itemOprice" maxlength="" value="${poVal.itemOprice }" type="text" style="width:120px;"></td>
				   <td align="left"><input name="itemList[${stuts.index }].itemRprice" maxlength="" value="${poVal.itemRprice }" type="text" style="width:120px;"></td>
				   <td align="left"><input name="itemList[${stuts.index }].itemContent" maxlength="200" value="${poVal.itemContent }" type="text" style="width:120px;"></td>
   			</tr>
		</c:forEach>
	</c:if>	
	</tbody>
</table>
</div>