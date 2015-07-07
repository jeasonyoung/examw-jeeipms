<#if faceList?exists>
<div class="jgboxl">
<div class="jgtitl"><div class="Hleft"><a href="faceList.html">面授课程</a></div><div class="amore"><a href="faceList.html">更多>></a></div></div>
<ul class="jjbox">
<#list faceList as face>
<li>
<div class="jglist1">
<div class="jglist"><a href="course_${face.id}.html">${face.coursename}</a></div>
</div>
</li>
</#list>
</ul>
</div>
<div class="blk10"></div>
</#if>