<ul>
<#list menuList as menu>
	<#if menu.enname='index'>
	<li><a href="./">${menu.cnname}</a></li>
	<#else>
	<li><a href="${menu.enname}.html">${menu.cnname}</a></li>
	</#if>
</#list>
</ul>