<#if paperList?exists>
<div class="jgtitl"><div class="Hleft nob"><a href="">试卷下载</a></div><div class="amore"><a href="paperList.html">更多>></a></div></div>
    <ul class="list">
    <#list paperList as paper>
    <li><a href="paper_${paper.id}.html">${paper.paperName}</a></li>
    </#list>
    </ul>
    <ul class="time">
    <#list paperList as paper>
    <#if paper_index==0||paper_index==1>
    <li class="red">${paper.createDate?string('yyyy-MM-dd')}</li>
    <#else>
    <li>${paper.createDate?string('yyyy-MM-dd')}</li>
    </#if>
    </#list>
    </ul>
</#if>