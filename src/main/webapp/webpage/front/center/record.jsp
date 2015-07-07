<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/context/context.jsp"%>  
<div class="kc_list" id="MyClass">
    <dl class="Record_five">
    		<c:forEach items="${records}" var="r" varStatus="index">
            <dd>
                <span class="dd_con">
                    <a target="_blank" href="#">
                        <img width="150" height="84" src="${r.course.imageurl}"></a>
                    <p><em class="icon_t"></em><fmt:formatDate value='${r.starttime}' pattern="MM月dd日  HH:mm" /> </p>
                </span>
                <span class="dd_tit">
                    <h3 class="h3tit">
                        <a target="_blank" href="/agency/${fn:substring(r.course.agency.id,21,32)}/course_${r.course.id}.html" title="">${r.course.coursename}</a><br class="cl">
                        主讲：<a target="_blank" href="/agency/${fn:substring(r.course.agency.id,21,32)}/teacher_${r.course.teacher.id}.html" title="名师：${r.course.teacher.realname}" class="cBlue">${r.course.teacher.realname}</a>
                    </h3>
                        <p class="go_on go_on1"><a target="_blank" href="/classController.do?class&courseId=${r.course.id}">继续学习</a></p>

                </span>
            </dd> 
            </c:forEach>                          
            <dd class="ddone">
                <span class="nRecord">更多选择,为您提供以下两种服务</span>
                <span class="gobuy"><a target="_blank" href="/course/"><em class="d_icon">&nbsp;</em><i>购买兴趣课程<br>
                    提升含金量</i></a></span>
                <span class="listen"><a target="_blank" href="#"><em class="d_icon">&nbsp;</em><i>试听其他<br>
                    免费课程</i></a></span>
            </dd>
    </dl>
</div>