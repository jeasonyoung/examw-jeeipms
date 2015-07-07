<div class="jgtitl"><div class="Hleft"><a href="#">课程分类</a></div><div class="amore"><a href="#">更多>></a></div></div>
<div class="species">
<#if province?exists> 
<#list categoryList as category>
<h3><a href="onlineList_${category.id}_${province.id?default("0")}.html">${category.categoryname?default("")}</a></h3>
<ul>
<#list category.childcategory as child>
<li><a href="onlineList_${child.id}_${province.id?default("0")}.html">${child.categoryname?default("")}</a></li>
</#list>
</ul>
</#list>
<#else>
<#list categoryList as category>
<h3><a href="onlineList_${category.id}_0.html">${category.categoryname?default("")}</a></h3>
<ul>
<#list category.childcategory as child>
<li><a href="onlineList_${child.id}_0.html">${child.categoryname?default("")}</a></li>
</#list>
</ul>
</#list>
</#if>
</div>