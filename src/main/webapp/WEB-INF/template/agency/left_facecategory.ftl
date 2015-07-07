<div class="jgtitl"><div class="Hleft"><a href="javascript:;">课程分类</a></div><div class="amore"><a href="javascript:;">更多>></a></div></div>
<div class="species">
<#list categoryList as category>
<h3><a href="faceList_${category.id}.html">${category.categoryname?default("")}</a></h3>
<ul>
<#list category.childcategory as child>
<li><a href="faceList_${child.id}.html">${child.categoryname?default("")}</a></li>
</#list>
</ul>
</#list>
</div>