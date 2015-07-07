<#if faceList?exists || onlineList?exists>
<#if (faceList?size>0) || (onlineList?size>0)>
<div class="jgboxl">
<div class="jgtitl"><div class="Hleft"><a href="onlineList.html">机构课程</a></div><div class="amore"><a href="onlineList.html">更多>></a></div></div>
<div class="species">
<#if (faceList?size>0)>
<h3><a href="faceList.html">面授课程</a></h3>
<ul>
<#list faceList as face>
<li><a href="course_${face.id}.html">${face.coursename}</a></li>
</#list>
</ul>
</#if>
<#if (onlineList?size>0)>
<h3><a href="onlineList.html">网络课程</a></h3>
<ul>
<#list onlineList as online>
<li><a href="course_${online.id}.html">${online.coursename}</a></li>
</#list>
</ul>
</#if>
</div>
</div>
</#if>
</#if>