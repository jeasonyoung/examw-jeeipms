<#if askList?exists>
<div class="jgtitl"><div class="Hleft nob"><a href="askAndAnswer.html">在线答疑</a></div><div class="amore"><a href="askAndAnswer.html">更多>></a></div></div>
    <ul class="list">
    <#list askList as ask>
    <li><a href="ask_${ask.id}.html">${ask.title}</a></li>
    </#list>
    </ul>
    <ul class="time">
    <#list askList as ask>
    <#if ask_index==0||ask_index==1>
    <li class="red">${ask.createDate?string('yyyy-MM-dd')}</li>
    <#else>
    <li>${ask.createDate?string('yyyy-MM-dd')}</li>
    </#if>
    </#list>
    </ul>
</#if>