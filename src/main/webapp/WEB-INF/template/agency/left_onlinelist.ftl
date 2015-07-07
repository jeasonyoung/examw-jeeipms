<#if onlineList?exists>
<div class="jgboxl">
<div class="jgtitl"><div class="Hleft"><a href="onlineList.html">视频课程</a></div><div class="amore"><a href="onlineList.html">更多>></a></div></div>
<ul class="jjbox">
<#list onlineList as online>
<li>
<div class="jglist1">
<div class="jglist"><a href="course_${online.id}.html">${online.coursename}</a></div>
</div>
</li>
</#list>
</ul>
</div>
<div class="blk10"></div>
</#if>