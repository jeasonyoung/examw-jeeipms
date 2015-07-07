<div class="jgtitl"><div class="Hleft"><a href="agencyInfo.html">机构介绍</a></div><div class="amore"><a href="agencyInfo.html">更多>></a></div></div>
<#if agency.abbreviation?length lt 100 > 
<div class="jgtxt"><img border="0" src="${domain}${agency.imageurl}" width="120" /><span class="bold">机构介绍</span>：${agency.abbreviation}</div>
<#else>
<div class="jgtxt"><img border="0" src="${domain}${agency.imageurl}" width="120" /><span class="bold">机构介绍</span>：${agency.abbreviation[0..100]}....<a href="agencyInfo.html"><span style="color:red;">详细>></span></a></div>
</#if>
<div class="jgtxt nob"><span class="bold">机构地址</span>:${agency.address}</br><span class="bold">服务电话</span>:${agency.officephone}</div>