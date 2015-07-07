<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/context/context.jsp"%>  
<div class="kc_list" id="MyClass">
    <dl class="Record_five">
    		<c:forEach items="${list}" var="c">
            <dd>
                <span class="dd_con">
                    <a target="_blank" href="/agency/${fn:substring(c.agency.id,21,32)}/course_${c.id}.html">
                        <img width="150" height="84" src="${c.imageurl}" /></a>
                    <p><em class="icon_t"></em><fmt:formatDate value='${c.addtime}' pattern="MM月dd日  HH:mm" /></p>
                </span>
                <span class="dd_tit">
                    <h3 class="h3tit">
                        <a target="_blank" href="/agency/${fn:substring(c.agency.id,21,32)}/course_${c.id}.html" title="">${c.coursename}</a><br class="cl" />
                        主讲：<a target="_blank" href="/agency/${fn:substring(c.agency.id,21,32)}/teacher_${c.teacher.id}.html" title="名师：${c.teacher.realname}" class="cBlue">${c.teacher.realname}</a>
                    </h3>
                        <p class="go_on"><a target="_blank" href="/agency/${fn:substring(c.agency.id,21,32)}/course_${c.id}.html">开始学习</a></p>

                </span>
            </dd>  
            </c:forEach>                       
            <dd class="ddone">
                <span class="nRecord">更多选择,为您提供以下两种服务</span>
                <span class="gobuy"><a target="_blank" href="/course/"><em class="d_icon">&nbsp;</em><i>购买兴趣课程<br />
                    提升含金量</i></a></span>
                <span class="listen"><a target="_blank" href="/course/"><em class="d_icon">&nbsp;</em><i>试听其他<br>
                    免费课程</i></a></span>
            </dd>
    </dl>
</div>

<br class="cl" />
    