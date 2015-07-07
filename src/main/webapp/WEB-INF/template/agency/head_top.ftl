<div class="topx">
<div class="top">
<div>
<div class="t1"><a href="${domain}/">首页</a> |  <a href="${domain}/course/" class="ks1">快速选课</a> |  <a href="${domain}/agency/" class="ks2">网校列表</a></div>
<div class="t3"><a href="#">报名流程</a> | <a href="#">常见问题</a> | <a href="#">交易安全</a></div>
</div>
<div class="t2" id="stu"></div>
</div>
</div>
<div class="header">
<div class="logo"><h1 class='w1'>${agency.name}</h1></div>
<div class="search-box">
<div class="search">
<div id="J_SearchTab" class="search-triggers">
   <ul class="ks-switchable-nav" id="test1">
     <li class="J_SearchTab selected" data-searchtype="item"  data-defaultpage="${domain}/agencyfront.do?searchCourse" >
       <a href="#">课程</a>
     </li>
     <li class="J_SearchTab"  data-searchtype="item"  data-defaultpage="${domain}/agencyfront.do?searchAgency" >
       <a href="#">机构</a>
     </li>
   </ul>
   <i>
   <em></em>
   <span></span>
   </i>
</div>
<form action="${domain}/agencyfront.do?searchCourse" id="search_form" method="post">
<input name="keywords" type="text" class="search1" value="" />
<div class="ss" ><a href="#" id="search_button"></a></div></div>
</form>
</div>
<div class="server">
<p style="height:25px;"> </p>
<p class="list-tel">4000-086-044</p>
<p class="list-time">
服务时间:
<span class="stimehour-org">09:00</span>
-
<span class="etimehour-org">17:00</span>
</p>
</div>
</div>
<script type="text/javascript" src ="${domain}/plug-in/agencycms/js/common.js"></script>