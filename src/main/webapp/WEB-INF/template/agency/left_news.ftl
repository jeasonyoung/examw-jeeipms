<div class="jgtitl"><div class="Hleft"><a href="recourseList.html">机构新闻</a></div><div class="amore"><a href="recourseList.html">更多>></a></div></div>
<ul class="jjbox">
<#list recourseList as recourse>
<li>
<div class="jglist1">
<div class="jglist"><a href="recourse_${recourse.id}.html">${recourse.title}</a></div>
</div>
<div class="date">${recourse.addtime?string('MM-dd')}</div>
</li>
</#list>
</ul>
</div>