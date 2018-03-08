<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0041)https://hf.zu.anjuke.com/?from=navigation -->
<html>
     <base href="<%=basePath%>">
    
    <title>欢迎来到安居乐</title>
    <link href="https://hf.zu.anjuke.com/" rel="canonical">

    <link rel="stylesheet" rev="stylesheet" href="${pageContext.request.contextPath}/css/Zufang_Web_List_FilterList.css" type="text/css">
    <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
    <script type="text/javascript">
     	var hlist;
     	var totalpage;
     	var searchChar=new Array();
     	for(var j=0;j<3;j++){
     		searchChar[j]=0;
     	}
    	$(function(){
    		getHouse(1);
    		getCity();
    		
    	});
    	function getCity()
    	{
    		var parent=$("#switch_apf_id_5").text();
    		//alert(parent);
    		$.ajax({
    			url:'<%=path %>/city/getsoncity',
    			type:'GET',
    			data:{'parent':parent},
    			dataType:'json',
    			timeout:60000,
    			success:function(data){
    				var first="<span class='item-title'>区域：</span>\
                <span class='elems-l'>"+"<a id='015' href='javascript:void(0);' class='selected-item' onclick='searchByCondition(0,15)'>全部</a>";
    				for(var i=0;i<data.length;i++)
    				{
    					first=first+"<a id='"+"0"+i+"' href='javascript:void(0);' class='' onclick='searchByCondition(0,"+"0"+i+")' >"+data[i].name+"</a>";
    				}
    				first=first+"</span>";
    				$('.loc').html(first);
    			},
    			error:function(){
    			 alert("获取城市失败");
    			}
    		});
    	}
    	function getHouseByPage(currentpage){
    		var city=$("#switch_apf_id_5").text();
    		//alert(city);
    		$.ajax({
    			url:'<%=path %>/house/showhouse',
    			type:'GET',
    			data:{'city':city,'page':currentpage},
    			dataType:'json',
    			timeout:60000,
    			success:function(data){
    				alert(data[0].id);
    			    var house='';
    			    var i;
    				for(i=0;i<data.length;i++){
    				console.log(data[i].introduce);
    					$('.zu-sort').after("<div class='zu-itemmod  ' link='' _soj='Filter_1&amp;hfilter=filterlist'>  <a data-company='' class='img' _soj='Filter_1&amp;hfilter=filterlist' data-sign='true' href='' title='"+data[i].topic+"' alt='' target='_blank' hidefocus='true'>\
                        <img class='thumbnail' src='<%=path%>"+data[i].indexpic+"' alt='' width='180' height='135'>\
                                                    <span class='many-icons iconfont'></span>\
                                            </a>\
                    <div class='zu-info'>\
                        <h3>\
                            <a target='_blank' title='"+data[i].topic+"'_soj='Filter_1&amp;hfilter=filterlist' href=''>"+data[i].topic+"</a>                        </h3>\
                        <p class='details-item tag'>data<span>|</span>"+data[i].leasemode+"<span>|</span>"+data[i].decorate+"<span>|</span>"+data[i].floor+"层\
                        </p>\
                        <address class='details-item'>\
                                                            <a target='_blank' href=''>"+data[i].village+"</a>\
                                                        "+data[i].deloc+"                        </address>\
                        <p class='details-item bot-tag'>\
                            <span>"+data[i].user.nickname+"</span><em></em>\
                        </p>\
                    </div>\
                    <div class='zu-side'>\
                        <p><strong>"+data[i].rent+"</strong> 元/月</p>\
                    </div>\
                </div>");
                 
    				}
    				
    					
    			},
    			error:function(){
    			}
    		
    	
    	});
    	
    	
    	}
    	function getHouse(currentpage){
    		var city=$("#switch_apf_id_5").text();
    		// var city="hang";
    		alert(city);
    		$.ajax({
    			url:'<%=path %>/house/showhouse',
    			type:'GET',
    			data:{'city':city},
    			dataType:'json',
    			timeout:60000,
    			success:function(data){
    				hlist=data;
    				totalpage=data.length/2+1-0.5;
    				if(data.length%2==0)
    				{
    					totalpage=data.length/2;
    				}
    				if(!(data=="[]")){
    				
    				 var house='';
    			    var i;
    				for(i=0;i<2;i++){
    				console.log(data[i].introduce);
    					
                		house=house+"<div class='zu-itemmod  ' link='' _soj='Filter_1&amp;hfilter=filterlist'>  <a data-company='' class='img' _soj='Filter_1&amp;hfilter=filterlist' data-sign='true' href='' title='"+data[i].topic+"' alt='' target='_blank' hidefocus='true'>\
                        <img class='thumbnail' src='<%=path%>"+data[i].indexpic+"' alt='' width='180' height='135'>\
                                                    <span class='many-icons iconfont'></span>\
                                            </a>\
                    <div class='zu-info'>\
                        <h3>\
                            <a target='_blank' title='"+data[i].topic+"'_soj='Filter_1&amp;hfilter=filterlist' href=''>"+data[i].topic+"</a>                        </h3>\
                        <p class='details-item tag'>"+data[i].area+"<span>|</span>"+data[i].leasemode+"<span>|</span>"+data[i].decorate+"<span>|</span>"+data[i].floor+"层\
                        </p>\
                        <address class='details-item'>\
                                                            <a target='_blank' href=''>"+data[i].village+"</a>\
                                                        "+data[i].deloc+"                        </address>\
                        <p class='details-item bot-tag'>\
                            <span>"+data[i].user.nickname+"</span><em></em>\
                        </p>\
                    </div>\
                    <div class='zu-side'>\
                        <p><strong>"+data[i].rent+"</strong> 元/月</p>\
                    </div>\
                </div>";
                 
    				}
    				$('.myhouse').html(house);
    				//alert(currentpage);
    				$('#currentpage').html(currentpage);
    				$('#totalpage').html(totalpage);
    				}else{
    					alert("空的");
    					$('.zu-comhead').css("display","block");
    				
    				}
    			   
    				
    					
    			},
    			error:function(){
    			}
    		
    	
    	});
    	}
    	
    	function prevPage(){
    		//alert("shan");
    		var currentpage=parseInt($('#currentpage').text());
    		if(currentpage==1){
    		
    		}else{
    		  currentpage=currentpage-1;
    		  shouPageHouse(currentpage);
    		}
    		
    	}
    	
    	function nextPage(){
    		var currentpage=parseInt($('#currentpage').text());
    		if(currentpage==totalpage){
    		}else{
    			currentpage=currentpage+1;
    			 shouPageHouse(currentpage);
    		}
    	}
    	
    	
    	function shouPageHouse(currentpage){
    		var house='';
    		var len=currentpage*2>hlist.length?hlist.length:currentpage*2;
    		for(var i=(currentpage-1)*2;i<len;i++){
    				console.log(hlist[i].introduce);
    					
                		house=house+"<div class='zu-itemmod  ' link='' _soj='Filter_1&amp;hfilter=filterlist'>  <a data-company='' class='img' _soj='Filter_1&amp;hfilter=filterlist' hlist-sign='true' href='' title='"+hlist[i].topic+"' alt='' target='_blank' hidefocus='true'>\
                        <img class='thumbnail' src='<%=path%>"+hlist[i].indexpic+"' alt='' width='180' height='135'>\
                                                    <span class='many-icons iconfont'></span>\
                                            </a>\
                    <div class='zu-info'>\
                        <h3>\
                            <a target='_blank' title=''_soj='Filter_1&amp;hfilter=filterlist' href=''>"+hlist[i].topic+"</a>                        </h3>\
                        <p class='details-item tag'>"+hlist[i].area+"<span>|</span>"+hlist[i].leasemode+"<span>|</span>"+hlist[i].decorate+"<span>|</span>"+hlist[i].floor+"层\
                        </p>\
                        <address class='details-item'>\
                                                            <a target='_blank' href=''>"+hlist[i].village+"</a>\
                                                        "+hlist[i].deloc+"                        </address>\
                        <p class='details-item bot-tag'>\
                            <span>"+hlist[i].user.nickname+"</span><em></em>\
                        </p>\
                    </div>\
                    <div class='zu-side'>\
                        <p><strong>"+hlist[i].rent+"</strong> 元/月</p>\
                    </div>\
                </div>";
                 
    				}
    				$('.myhouse').html(house);
    				//alert(currentpage);
    				$('#currentpage').html(currentpage);
    				$('#totalpage').html(totalpage);
    	
    	}
    	
    	function searchHouse(currentpage){
    		var key=$('#search-rent').val();
    		console.log(key);
    		$.ajax({
    			url:'<%=path %>/house/searchhouse',
    			type:'GET',
    			data:{'key':key},
    			dataType:'json',
    			timeout:60000,
    			success:function(data){
    				hlist=data;
    				totalpage=data.length/2+1-0.5;
    				if(data.length%2==0)
    				{
    					totalpage=data.length/2;
    				}
    				if(!(data=="[]")){
					var house='';
    			    var i;
    				for(i=0;i<(data.length>2?2:data.length);i++){
    				console.log(data[i].introduce);
    					
                		house=house+"<div class='zu-itemmod  ' link='' _soj='Filter_1&amp;hfilter=filterlist'>  <a data-company='' class='img' _soj='Filter_1&amp;hfilter=filterlist' data-sign='true' href='' title='"+data[i].topic+"' alt='' target='_blank' hidefocus='true'>\
                        <img class='thumbnail' src='<%=path%>"+data[i].indexpic+"' alt='' width='180' height='135'>\
                                                    <span class='many-icons iconfont'></span>\
                                            </a>\
                    <div class='zu-info'>\
                        <h3>\
                            <a target='_blank' title='"+data[i].topic+"'_soj='Filter_1&amp;hfilter=filterlist' href=''>"+data[i].topic+"</a>                        </h3>\
                        <p class='details-item tag'>"+data[i].area+"<span>|</span>"+data[i].leasemode+"<span>|</span>"+data[i].decorate+"<span>|</span>"+data[i].floor+"层\
                        </p>\
                        <address class='details-item'>\
                                                            <a target='_blank' href=''>"+data[i].village+"</a>\
                                                        "+data[i].deloc+"                        </address>\
                        <p class='details-item bot-tag'>\
                            <span>"+data[i].user.nickname+"</span><em></em>\
                        </p>\
                    </div>\
                    <div class='zu-side'>\
                        <p><strong>"+data[i].rent+"</strong> 元/月</p>\
                    </div>\
                </div>";
                 
    				}
    				$('.myhouse').html(house);
    				//alert(currentpage);
    				$('#currentpage').html(currentpage);
    				$('#totalpage').html(totalpage);
    				}else{
    					alert("空的");
    					$('.zu-comhead').css("display","block");
    				
    				}
    			   
    				
    					
    			},
    			error:function(){
    			}
    		
    	
    	});
    	
    	}
    	
    	function searchByCondition(cd,cdd){
    		var city=$("#switch_apf_id_5").text();
    		var cy;
    		switch(cd){
    			case 0:
    				searchChar[0]=0;
    				cdd="0"+cdd;
    				cy=$('#'+cdd).text();
    				searchChar[0]=searchChar[0]+cy;
    				alert(searchChar[0]);
    				break;
    			case 1:
    				searchChar[1]=cdd;
    				break;
    			case 2:
    				searchChar[2]=cdd;
    				break;
    		}
    		$.ajax({
    			url:'<%=path %>/house/searchhousebycon',
    			type:'GET',
    			data:{'city':city,'searchChar':searchChar},
    			dataType:'json',
    			traditional:true,
    			success:function(data){
    				hlist=data;
    				totalpage=data.length/2+1-0.5;
    				if(data.length%2==0)
    				{
    					totalpage=data.length/2;
    				}
    				if(!(data=="[]")){
					var house='';
    			    var i;
    				for(i=0;i<(data.length>2?2:data.length);i++){
    				console.log(data[i].introduce);
    					
                		house=house+"<div class='zu-itemmod  ' link='' _soj='Filter_1&amp;hfilter=filterlist'>  <a data-company='' class='img' _soj='Filter_1&amp;hfilter=filterlist' data-sign='true' href='' title='"+data[i].topic+"' alt='' target='_blank' hidefocus='true'>\
                        <img class='thumbnail' src='<%=path%>"+data[i].indexpic+"' alt='' width='180' height='135'>\
                                                    <span class='many-icons iconfont'></span>\
                                            </a>\
                    <div class='zu-info'>\
                        <h3>\
                            <a target='_blank' title='"+data[i].topic+"'_soj='Filter_1&amp;hfilter=filterlist' href=''>"+data[i].topic+"</a>                        </h3>\
                        <p class='details-item tag'>"+data[i].area+"<span>|</span>"+data[i].leasemode+"<span>|</span>"+data[i].decorate+"<span>|</span>"+data[i].floor+"层\
                        </p>\
                        <address class='details-item'>\
                                                            <a target='_blank' href=''>"+data[i].village+"</a>\
                                                        "+data[i].deloc+"                        </address>\
                        <p class='details-item bot-tag'>\
                            <span>"+data[i].user.nickname+"</span><em></em>\
                        </p>\
                    </div>\
                    <div class='zu-side'>\
                        <p><strong>"+data[i].rent+"</strong> 元/月</p>\
                    </div>\
                </div>";
                 
    				}
    				$('.myhouse').html(house);
    				//alert(currentpage);
    				$('#currentpage').html('1');
    				$('#totalpage').html(totalpage);
    				}else{
    					alert("空的");
    					$('.zu-comhead').css("display","block");
    				
    				}
    			
    			},
    			error:function(){
    			}
    		
    		});
    		
    		document.getElementById(cdd).style.color="red";
    		
    	
    	}
    </script>
    
</head>
<body>
        <!-- START: 顶通广告 -->
<div class="header-center none">
        </div>
<!-- END: 顶通广告 -->

<!-- Pc_Common_HeaderComponent -->
<div class="topbar ">
    <div class="header-center clearfix">
        <ul class="nav-site clearfix">
          <li></li>
                                    <li></li>
        </ul>
        <c:if test="${empty sessionScope.user }">
        <div id="userbox" class="user"><!-- 用户登录 -->
            <div class="userlogin userblock">
                <i class="icon icon-people"></i>
                <a class="link" href="login.jsp" rel="nofollow">登录</a>
                <a class="link" href="register.jsp" rel="nofollow">注册</a>
            </div>
</c:if>
	 
	 <c:if test="${not empty sessionScope.user }">
	 	<div id="userbox" class="user"><!-- 用户登录 -->
            <div class="userlogin userblock">
                <i class="icon icon-people"></i>
                <a class="link" href="/userinfo/showinfo" rel="nofollow">${user.username }</a>
                <a class="link" href="<%=path %>/user/logout" rel="nofollow">注销</a>
            </div>
	 
	 
	 </c:if>
      </div>
  </div>
</div> <!-- topbar -->

<div class="header header-center clearfix">
    <a class="logo" href="https://hf.anjuke.com/" title="安居客合肥房产网">安居乐</a>
    <a class="logo-site">租房</a>
        <div class="cityselect">
        <div id="switch_apf_id_5" class="city-view">上海</div>
        <div id="city_list" class="city-list" style="display:none;">
                        <dl>
                <dt>华北东北</dt>
                <dd>
                                        <a href="https://bj.zu.anjuke.com/" title="北京租房网">北京</a>
                                        <a href="https://tj.zu.anjuke.com/" title="天津租房网">天津</a>
                                        <a href="https://dl.zu.anjuke.com/" title="大连租房网">大连</a>
                                        <a href="https://sjz.zu.anjuke.com/" title="石家庄租房网">石家庄</a>
                                        <a href="https://heb.zu.anjuke.com/" title="哈尔滨租房网">哈尔滨</a>
                                        <a href="https://sy.zu.anjuke.com/" title="沈阳租房网">沈阳</a>
                                        <a href="https://ty.zu.anjuke.com/" title="太原租房网">太原</a>
                                        <a href="https://cc.zu.anjuke.com/" title="长春租房网">长春</a>
                                        <a href="https://wei.zu.anjuke.com/" title="威海租房网">威海</a>
                                        <a href="https://wf.zu.anjuke.com/" title="潍坊租房网">潍坊</a>
                                        <a href="https://hhht.zu.anjuke.com/" title="呼和浩特租房网">呼和浩特</a>
                                        <a href="https://bt.zu.anjuke.com/" title="包头租房网">包头</a>
                                    </dd>
            </dl>
                        <dl>
                <dt>华东地区</dt>
                <dd>
                                        <a href="https://sh.zu.anjuke.com/" title="上海租房网">上海</a>
                                        <a href="https://hz.zu.anjuke.com/" title="杭州租房网">杭州</a>
                                        <a href="https://su.zu.anjuke.com/" title="苏州租房网">苏州</a>
                                        <a href="https://nj.zu.anjuke.com/" title="南京租房网">南京</a>
                                        <a href="https://wx.zu.anjuke.com/" title="无锡租房网">无锡</a>
                                        <a href="https://jn.zu.anjuke.com/" title="济南租房网">济南</a>
                                        <a href="https://qd.zu.anjuke.com/" title="青岛租房网">青岛</a>
                                        <a href="https://ks.zu.anjuke.com/" title="昆山租房网">昆山</a>
                                        <a href="https://nb.zu.anjuke.com/" title="宁波租房网">宁波</a>
                                        <a href="https://nc.zu.anjuke.com/" title="南昌租房网">南昌</a>
                                        <a href="https://fz.zu.anjuke.com/" title="福州租房网">福州</a>
                                        <a href="https://hf.zu.anjuke.com/" title="合肥租房网">合肥</a>
                                        <a href="https://xz.zu.anjuke.com/" title="徐州租房网">徐州</a>
                                        <a href="https://zb.zu.anjuke.com/" title="淄博租房网">淄博</a>
                                    </dd>
            </dl>
                        <dl>
                <dt>华南地区</dt>
                <dd>
                                        <a href="https://sz.zu.anjuke.com/" title="深圳租房网">深圳</a>
                                        <a href="https://gz.zu.anjuke.com/" title="广州租房网">广州</a>
                                        <a href="https://fs.zu.anjuke.com/" title="佛山租房网">佛山</a>
                                        <a href="https://cs.zu.anjuke.com/" title="长沙租房网">长沙</a>
                                        <a href="https://san.zu.anjuke.com/" title="三亚租房网">三亚</a>
                                        <a href="https://hui.zu.anjuke.com/" title="惠州租房网">惠州</a>
                                        <a href="https://dg.zu.anjuke.com/" title="东莞租房网">东莞</a>
                                        <a href="https://hk.zu.anjuke.com/" title="海口租房网">海口</a>
                                        <a href="https://zh.zu.anjuke.com/" title="珠海租房网">珠海</a>
                                        <a href="https://zs.zu.anjuke.com/" title="中山租房网">中山</a>
                                        <a href="https://xm.zu.anjuke.com/" title="厦门租房网">厦门</a>
                                        <a href="https://nn.zu.anjuke.com/" title="南宁租房网">南宁</a>
                                        <a href="https://qz.zu.anjuke.com/" title="泉州租房网">泉州</a>
                                        <a href="https://lzh.zu.anjuke.com/" title="柳州租房网">柳州</a>
                                    </dd>
            </dl>
                        <dl>
                <dt>中 西 部</dt>
                <dd>
                                        <a href="https://cd.zu.anjuke.com/" title="成都租房网">成都</a>
                                        <a href="https://cq.zu.anjuke.com/" title="重庆租房网">重庆</a>
                                        <a href="https://wh.zu.anjuke.com/" title="武汉租房网">武汉</a>
                                        <a href="https://zz.zu.anjuke.com/" title="郑州租房网">郑州</a>
                                        <a href="https://xa.zu.anjuke.com/" title="西安租房网">西安</a>
                                        <a href="https://km.zu.anjuke.com/" title="昆明租房网">昆明</a>
                                        <a href="https://gy.zu.anjuke.com/" title="贵阳租房网">贵阳</a>
                                        <a href="https://lz.zu.anjuke.com/" title="兰州租房网">兰州</a>
                                        <a href="https://ly.zu.anjuke.com/" title="洛阳租房网">洛阳</a>
                                    </dd>
            </dl>
                        <div class="morecity"><a href="https://www.anjuke.com/sy-city.html">更多城市&gt;</a></div>
        </div>
    </div>
 	<form class="search-form" id="search-form" action="" target="_self" > 
	
   	<input type="hidden" name="t" value="1">
    <input type="hidden" name="from" value="0">
	<input type="hidden" name="comm_exist" value="on"> 
	<input type="text" name="kw" class="searchbar-rent" id="search-rent" placeholder="请输入房源特征、小区、楼盘名或…" autocomplete="off" maxlength="100" value=""> 
	<input type="button" id="search-button" class="searchbar-button" hidefocus="true" value="搜索" onclick="searchHouse(1)">
	<i id="search-close" class="icon icon-close" data-tracker="delete-kw" style="display:none"></i>
    <a href="https://hf.zu.anjuk e.com/ditu/?from=searchbar" rel="nofollow" class="search-map" target="_blank" _soj="searchbar"><i class="icon icon-mark"></i></a>
  <div class="auto-wrap"></div></form>
<%-- <script src="./【合肥租房网,合肥租房信息,合肥房屋出租价格】-58安居客_files/push.js.下载"></script><script type="text/javascript" async="" src="./【合肥租房网,合肥租房信息,合肥房屋出租价格】-58安居客_files/s.js.下载"></script><script type="text/template" id="search-tpl">
	<ul class="search-ul">
		<%_.each(obj,function(item){%>
			<li>
				<span><%= item.keyword %></span>
                <%if(item.is_facet_comm){%>
                    <span class="gray area"><%= item.comm_names %></span>
                    <span class="gray area">共<%= item.num %>个小区</span>
                <%}else{%>
                    <span class="gray area"><%= item.area_name %></span>
                    <% if(item.address){%>
                        <span class="gray address">-&nbsp;<%= item.address %></span>
                    <%}%>
                <%}%>
			</li>
		<%});%>
	</ul>
</script> --%>
    </div>

<div class="nav header-center clearfix">
    <ul>
                                <li><a href="https://hf.zu.anjuke.com/" _soj="navigation" class=" current ">区域找房</a></li>
                                            <li><a href="https://hf.zu.anjuke.com/ditu/" _soj="navigation" class="  " target="_blank">地图找房</a></li>
                                            <li><a href="https://hf.anjuke.com/community/" _soj="navigation" class="  ">小区</a></li>
                        </ul>
</div>


<div class="w1180">
  <div class="breadcrumbs">
                    <div class="p_1180 p_crumbs">
        <a href="https://hf.anjuke.com/">安居乐合肥</a> &gt; <a href="https://hf.zu.anjuke.com/">合肥租房</a>    </div>
  <!-- 面包屑组件 -->
    </div>
  <div class="div-border items-list">
        <!-- 区域 begin-->
                    <div class="items">
                    <div class="loc"></div>
               <!--  <span class="item-title">区域：</span>
                <span class="elems-l">
                                            <a href="https://hf.zu.anjuke.com/" class="selected-item">全部</a>
                                            <a href="https://hf.zu.anjuke.com/fangyuan/shushanqu/" class="">蜀山</a>
                                            <a href="https://hf.zu.anjuke.com/fangyuan/baohequ/" class="">包河</a>
                                            <a href="https://hf.zu.anjuke.com/fangyuan/luyangqu/" class="">庐阳</a>
                                            <a href="https://hf.zu.anjuke.com/fangyuan/yaohaiqu/" class="">瑶海</a>
                                            <a href="https://hf.zu.anjuke.com/fangyuan/binhuxinquhefei/" class="">滨湖新区</a>
                                            <a href="https://hf.zu.anjuke.com/fangyuan/zhengwuquhefei/" class="">政务区</a>
                                            <a href="https://hf.zu.anjuke.com/fangyuan/jingkaiquhefei/" class="">经开区</a>
                                            <a href="https://hf.zu.anjuke.com/fangyuan/gaoxinquhefei/" class="">高新区</a>
                                            <a href="https://hf.zu.anjuke.com/fangyuan/beichengxinquhefei/" class="">北城新区</a>
                                            <a href="https://hf.zu.anjuke.com/fangyuan/xinzhangaoxinqu/" class="">新站高新区</a>
                                            <a href="https://hf.zu.anjuke.com/fangyuan/beicheng/" class="">长丰</a>
                                            <a href="https://hf.zu.anjuke.com/fangyuan/feixi/" class="">肥西</a>
                                            <a href="https://hf.zu.anjuke.com/fangyuan/feidong/" class="">肥东</a>
                                            <a href="https://hf.zu.anjuke.com/fangyuan/chaohushi/" class="">巢湖</a>
                                            <a href="https://hf.zu.anjuke.com/fangyuan/lujiangs/" class="">庐江</a>
                                                        </span> -->
            </div>
                <!-- 区域 end-->

        <!-- 租金 begin-->
                    <div class="items ">
                <span class="item-title">租金：</span>
                <span class="elems-l">
                                            <a href="javascript:void(0);" id="10" class="selected-item" onclick="searchByCondition(1,10)" rel="nofollow">全部</a>
                                            <a href="javascript:void(0);" id="11" class="" onclick="searchByCondition(1,11)" rel="nofollow">500元以下</a>
                                            <a href="javascript:void(0);" id="12" class="" onclick="searchByCondition(1,12)" rel="nofollow">500-800元</a>
                                            <a href="javascript:void(0);" id="13" class="" onclick="searchByCondition(1,13)" rel="nofollow">800-1000元</a>
                                            <a href="javascript:void(0);" id="14" class="" onclick="searchByCondition(1,14)" rel="nofollow">1000-1500元</a>
                                            <a href="javascript:void(0);" id="15" class="" onclick="searchByCondition(1,15)" rel="nofollow">1500-2000元</a>
                                            <a href="javascript:void(0);" id="16" class="" onclick="searchByCondition(1,16)" rel="nofollow">2000-3000元</a>
                                            <a href="javascript:void(0);" id="17" class="" onclick="searchByCondition(1,17)" rel="nofollow">3000-5000元</a>
                                            <a href="javascript:void(0);" id="18" class="" onclick="searchByCondition(1,18)" rel="nofollow">5000元以上</a>
                                        <div class="pricecond">
                        <!--两个输入框的长度width需要在加载时传入参数计算：数字长度小于等于3位时，width:24px\
                            数字长度n大于3位时，width: 8*n px-->
                        <form action="https://hf.zu.anjuke.com/?from=navigation" id="price_range_form" onsubmit="">
                            <input id="from-price" class="from-price" type="text" name="from_price" maxlength="5" value="" style="width:32px;" autocomplete="off"> -
                            <input id="to-price" class="to-price" type="text" name="to_price" maxlength="5" value="" style="width:32px;" autocomplete="off">&nbsp;<span class="">元</span>
                                                                                    <input class="smit" id="pricerange_search" style="display: none;" type="button" value="确定">
                        </form>
                    </div>
                </span>
            </div>
        
        <!--  房型 begin-->
                    <div class="items">
                <span class="item-title">房型：</span>
                    <span class="elems-l">
                                                    <a href="javascript:void(0);" id="20" class="selected-item" onclick="searchByCondition(2,20)" rel="nofollow">全部</a>
                                                    <a href="javascript:void(0);" id="21" class="" onclick="searchByCondition(2,21)" rel="nofollow">一室</a>
                                                    <a href="javascript:void(0);" id="22" class="" onclick="searchByCondition(2,22)" rel="nofollow">二室</a>
                                                    <a href="javascript:void(0);" id="23" class="" onclick="searchByCondition(2,23)" rel="nofollow">三室</a>
                                                    <a href="javascript:void(0);" id="24" class="" onclick="searchByCondition(2,24)" rel="nofollow">四室</a>
                                                    <a href="javascript:void(0);" id="25" class="" onclick="searchByCondition(2,25)" rel="nofollow">五室及以上</a>
                                            </span>
            </div>
        
        <!-- 房屋类型 begin -->
        <div class="search_bottom clearfix">
            <div id="condmenu">
                <ul class="condul clearfix">
                    <li class="condlist_tip"><span>更多筛选：</span></li>
                    <li class="condibox">
                        <a href="javascript:void(0);">
                            <span class="select_item">
                                <span class="txt" id="condhouseage_txt_id">房屋类型</span>
                                <span class="icon">&nbsp;</span>
                            </span>
                        </a>
                        <ul>
                                                            <li class="selected">
                                    <a href="https://hf.zu.anjuke.com/" rel="nofollow">全部</a>
                                </li>
                                                            <li class="">
                                    <a href="https://hf.zu.anjuke.com/fangyuan/lx8/" rel="nofollow">普通住宅</a>
                                </li>
                                                            <li class="">
                                    <a href="https://hf.zu.anjuke.com/fangyuan/lx1/" rel="nofollow">公寓</a>
                                </li>
                                                            <li class="">
                                    <a href="https://hf.zu.anjuke.com/fangyuan/lx4/" rel="nofollow">别墅</a>
                                </li>
                                                            <li class="">
                                    <a href="https://hf.zu.anjuke.com/fangyuan/lx9/" rel="nofollow">平房</a>
                                </li>
                                                            <li class="">
                                    <a href="https://hf.zu.anjuke.com/fangyuan/lx6/" rel="nofollow">酒店公寓</a>
                                </li>
                                                            <li class="">
                                    <a href="https://hf.zu.anjuke.com/fangyuan/lx10/" rel="nofollow">商住两用</a>
                                </li>
                                                            <li class="">
                                    <a href="https://hf.zu.anjuke.com/fangyuan/lx5/" rel="nofollow">其他</a>
                                </li>
                                                    </ul>
                    </li>
                    <!--装修Begin-->
                    <li class="condibox">
                        <a href="javascript:void(0);">
                            <span class="select_item">
                                <span class="txt" id="condusetype_txt_id">装修</span>
                                <span class="icon">&nbsp;</span>
                            </span>
                        </a>
                        <ul>
                                                            <li class="selected">
                                    <a href="https://hf.zu.anjuke.com/" rel="nofollow">全部</a>
                                </li>
                                                            <li class="">
                                    <a href="https://hf.zu.anjuke.com/fangyuan/zx1/" rel="nofollow">毛坯</a>
                                </li>
                                                            <li class="">
                                    <a href="https://hf.zu.anjuke.com/fangyuan/zx2/" rel="nofollow">简单装修</a>
                                </li>
                                                            <li class="">
                                    <a href="https://hf.zu.anjuke.com/fangyuan/zx123/" rel="nofollow">中等装修</a>
                                </li>
                                                            <li class="">
                                    <a href="https://hf.zu.anjuke.com/fangyuan/zx3/" rel="nofollow">精装修</a>
                                </li>
                                                            <li class="">
                                    <a href="https://hf.zu.anjuke.com/fangyuan/zx4/" rel="nofollow">豪华装修</a>
                                </li>
                                                    </ul>
                    </li>
                    <!--装修End-->
                     <!--                                        <li id="" class="filter_check">
                        <input type="checkbox" href="javascript:" id="filter_is_metro_input" onclick="location.href=&#39;https://hf.zu.anjuke.com/fangyuan/x2/&#39;"><label for="filter_is_metro_input">合租</label>
                    </li>
                    合租勾选时将disabled属性去掉
                    <li id="" class="filter_check check_grey">
                        <input type="checkbox" href="javascript:" id="filter_is_toilet_input" disabled="" onclick="location.href=&#39;https://hf.zu.anjuke.com/fangyuan/de1/&#39;"><label for="filter_is_toilet_input">独立卫生间</label>
                    </li>
                    <li id="" class="filter_check check_grey">
                        <input type="checkbox" href="javascript:" id="filter_is_balcony_input" disabled="" onclick="location.href=&#39;https://hf.zu.anjuke.com/fangyuan/de3/&#39;"><label for="filter_is_balcony_input">阳台</label>
                    </li>
                    <li id="" class="filter_check check_grey">
                        <input type="checkbox" href="javascript:" id="filter_is_south_input" disabled="" onclick="location.href=&#39;https://hf.zu.anjuke.com/fangyuan/tw1/&#39;"><label for="filter_is_south_input">朝南</label>
                    </li> -->
                    <!---->
                </ul>
            </div>
        </div>
    </div>

    <!--主模块-->
    <div class="maincontent">
      <div class="list-content" id="list-content">
            <!--标签-->
            <div class="zu-tab">
                <a href="https://hf.zu.anjuke.com/" class="curTab">全部
                </a></div>
            <!--排序-->
            <div class="zu-sort">
                <span class="tit">为您找到以下<em>上海</em>租房</span>
                <div class="sort-cond">
                                        <span>排序 ：</span>
                    <a href="https://hf.zu.anjuke.com/" class="light">默认
                    </a>
                    <a href="https://hf.zu.anjuke.com/fangyuan/px7/" class="">租金<i class="icon icon-arrup"></i></a>
                    <a href="https://hf.zu.anjuke.com/fangyuan/px3/" class="">最新<i class="icon icon-arrdown"></i></a>
                    <!--icon-arrup-org icon-arrdown-org为高亮箭头-->
                </div>
            </div>

            <!--房源列表豆腐块-->
            <!--区域板块租房房源列表页-->
            <div class="myhouse"></div>
                 <!--                                        <div class="zu-itemmod  " link="https://hf.zu.anjuke.com/fangyuan/1110889099" _soj="Filter_1&amp;hfilter=filterlist">
                    <a data-company="" class="img" _soj="Filter_1&amp;hfilter=filterlist" data-sign="true" href="https://hf.zu.anjuke.com/fangyuan/1110889099" title="好消息！拉菲新出业主急租三房，家电家具齐全，拎包入住，请速电" alt="好消息！拉菲新出业主急租三房，家电家具齐全，拎包入住，请速电" target="_blank" hidefocus="true">
                        <img class="thumbnail" src="./【合肥租房网,合肥租房信息,合肥房屋出租价格】-58安居客_files/240x180m.jpg" alt="好消息！拉菲新出业主急租三房，家电家具齐全，拎包入住，请速电" width="180" height="135">
                                                    <span class="many-icons iconfont"></span>
                                            </a>
                    <div class="zu-info">
                        <h3>
                            <a target="_blank" title="好消息！拉菲新出业主急租三房，家电家具齐全，拎包入住，请速电" _soj="Filter_1&amp;hfilter=filterlist" href="https://hf.zu.anjuke.com/fangyuan/1110889099">好消息！拉菲新出业主急租三房，家电家具齐全，拎包入住，请速电</a>                        </h3>
                        <p class="details-item tag">3室2厅<span>|</span>整租<span>|</span>精装修<span>|</span>17/31层
                        </p>
                        <address class="details-item">
                                                            <a target="_blank" href="https://hf.anjuke.com/community/view/464228">保利拉菲公馆</a>
                                                        ［包河-高速时代广场 四川路］                        </address>
                        <p class="details-item bot-tag">
                            <span>沈小兴</span><em></em>
                        </p>
                    </div>
                    <div class="zu-side">
                        <p><strong>1500</strong> 元/月</p>
                    </div>
                </div> -->
             <div id="zu-comhead" class="zu-comhead" style="display:none;">
              <p>哎呀，没有找到符合要求的房子。</p>
                <p class="mid">安居客建议：看看上面的筛选条件是否合理</p>
                <em>根据您的租房要求，特别推荐以下房源</em>
        </div> 
            <%-- <script type="text/template" id="zuRecom-tpl">
                <% _.each(obj,function(item){ %>
                <div class="zu-itemmod" link="<%= item.url %>"
                <% if(item.is_hp==1){ %>
                _soj="<%= item.from %>&hfilter=filterlist"
                <% }else{ %>
                _soj="<%= item.from %>"
                <% } %>
                >
                <a class="img"
                <% if(item.is_hp==1){ %>
                _soj="<%= item.from %>&hfilter=filterlist"
                <% }else{ %>
                _soj="<%= item.from %>"
                <% } %>
                data-sign="true" href="<%= item.url %>" title="<%= item.title %>" alt="<%= item.title %>" target="_blank" hidefocus="true">
                <img class="thumbnail" src="<%= item.img %>" alt="<%= item.title %>" width="180" height="135"/>
                <% if(item.icon_name=='多图'&&item.has_video!=1){ %>
                    <span class="many-icons iconfont">&#xE062;</span>
                <% }else if(item.has_video==1){ %>
                    <i class="v-small"></i>
                <% } %>
                </a>
                <div class="zu-info">
                    <h3><a target="_blank" title=""
                        <% if(item.is_hp==1){ %>
                        _soj="<%= item.from %>&hfilter=filterlist"
                        <% }else{ %>
                        _soj="<%= item.from %>"
                        <% } %>
                        href="<%= item.url %>"><%= item.title %></a>
                        <% if(item.icon_name==''){ %>
                        <% }else{ %>
                        <span class="red"><%= item.icon_name %></span>
                        <% } %>
                    </h3>
                    <p class="details-item tag"><%= item.room_num %>室<%= item.hall_num %>厅<span>|</span><%= item.rent_type_name %><span>|</span><%= item.fitment_name %><span>|</span><%= item.floor %>/<%= item.floor_num %>层</p>
                    <address class="details-item"><%= item.comm_name %>&nbsp;&nbsp; <% if(item.area_block_name != ""){ %>[<%= item.area_block_name %>&nbsp;&nbsp;<%= item.comm_address_str %>]<% } %></address>
                    <p class="details-item bot-tag">
                        <span><%= item.broker_name %></span><em><%= item.desc %></em>
                    </p>
                </div>
                <div class="zu-side">
                    <p><strong><%= item.price %></strong> 元/月</p>
                    <% if(item.logo_class==''){ %>
                    <% }else{ %>
                    <i class="icon icon-realfree"></i>
                    <% } %>
                </div>
                </div>
                <%});%>
            </script> --%>
        <!--品牌公寓广告模块--></div>

        <!--右侧广告栏-->
        <!--翻页-->
        <div class="page-content">    <div class="multi-page">
        
                    <!-- <a class="aNxt">上一页&gt;</a> -->
      <a href="javascript:void(0);" onclick="prevPage()" class="aNxt" id="pre">&lt; 上一页 </a> 
                 <!-- <span id="pre" style="width:160px;height:35px;background-color:green;color:white">&lt; 上一页</span> -->
        
                    <!-- <i class="curr">1</i>
                    <a href="https://hf.zu.anjuke.com/fangyuan/p2/">2</a>
                    <a href="https://hf.zu.anjuke.com/fangyuan/p3/">3</a>
                    <a href="https://hf.zu.anjuke.com/fangyuan/p4/">4</a>
                    <a href="https://hf.zu.anjuke.com/fangyuan/p5/">5</a>
                    <a href="https://hf.zu.anjuke.com/fangyuan/p6/">6</a>
                    <a href="https://hf.zu.anjuke.com/fangyuan/p7/">7</a>
        
                    <i class="aDotted">...</i> -->
                    <span id="currentpage" style="font-size:23px">1</span><span style="font-size:23px">/</span><span id="totalpage" style="font-size:23px"></span>
        
                    <a href="javascript:void(0);" onclick="nextPage()"class="aNxt" id="nxt">下一页 &gt;</a>
        
            </div>
</div>

    </div>
    

  <%-- <p class="guesslike-title">猜你喜欢</p>
  <script type="text/template" id="guesslike-tpl">
	<% _.each(obj,function(item){ %>
		<li>
			<img src="<%= item.img %>" alt="租房<%= item.price %>元/月" width="180px" height="135px">
			<% if(item.is_hp == 1){ %>
				<a href="<%= item.url %>" class="guesslike-itemtitle" title="<%= item.title %>" target="_blank" _soj="home_rent_list_rec&hfilter=filterlist"><%= item.title %></a>
			<%}%>
			<% if(item.is_hp != 1){%>
				<a href="<%= item.url %>" class="guesslike-itemtitle" title="<%= item.title %>" target="_blank" _soj="home_rent_list_rec"><%= item.title %></a>
			<%}%>
			<p class="guesslike-itemprice"><%= item.price %>元/月</p>
			<p class="guesslike-itemdetail"><%= item.room_num %>室<%= item.hall_num %>厅，<%= item.fitment_name %></p>
			<p class="guesslike-itemcommunity"><%= item.comm_name %></p>
		</li>
	<%});%>
</script> --%>

    <!--简介tips-->
    <p class="seo-tips">&nbsp;</p>
    <!--内链-->
    
<div id="seo-box">
  <ul class="parent-1 "><li class="tab-1 has-subitem"></li></ul></div>
</div>



    <div id="footer" class="footer">
    <ul class="links">
        <li>
            <a rel="nofollow" href="https://kfzx.anjuke.com/faqList/defaultQue?faqKinds=2">关于安居客</a>
            <em class="spe-lines">|</em>
        </li>
        <li>
            <a rel="nofollow" href="https://kfzx.anjuke.com/faqDetail/queryDetail?faqId=95&amp;faqTypeId=11">联系我们</a>
            <em class="spe-lines">|</em>
        </li>
        <li>
            <a rel="nofollow" href="https://kfzx.anjuke.com/faqDetail/queryDetail?faqId=104&amp;faqTypeId=10">用户协议</a>
            <em class="spe-lines">|</em>
        </li>
        <li>
            <a href="javascript:void(0);" data-target="loan_link">房贷计算器</a>
            <em class="spe-lines">|</em>
        </li>
        <li>
            <a href="javascript:void(0);" data-target="seo_qa">最新问答</a>
            <em class="spe-lines">|</em>
        </li>
        <li>
            <a href="javascript:void(0);" data-target="map_link">网站地图</a>
            <em class="spe-lines">|</em>
        </li>
        <li>
            <a href="javascript:void(0);" data-target="house_link">最新房源</a>
            <em class="spe-lines">|</em>
        </li>
        <li>
            <a href="javascript:void(0);" data-target="other_city">其它城市</a>
            <em class="spe-lines">|</em>
        </li>
        <li>
            <a rel="nofollow" href="https://hf.anjuke.com/friendlink">友情链接</a>
            <em class="spe-lines">|</em>
        </li>
        <li>
            <a rel="nofollow" target="_blank" href="http://www.zx110.org/cxs/index.html">放心搜</a>
            <em class="spe-lines">|</em>
        </li>
        <li>
                        <a rel="nofollow" target="_blank" href="https://about.anjuke.com/chanpin/?from=home_foot_tgy">推广服务</a>
            <em class="spe-lines">|</em>
                    </li>
        <li>
            <a rel="nofollow" target="_blank" href="https://biz.anjuke.com/biz/index">渠道招商</a>
        </li>
    </ul>

    <div id="loan_link" class="show-mod loan-link">
        <ul>
                            <li><a href="http://www.anjuke.com/calculator/loan" target="_blank">房贷计算器</a></li>
                            <li><a href="http://www.anjuke.com/calculator/return" target="_blank">提前还款计算器</a></li>
                            <li><a href="http://www.anjuke.com/calculator/qualify" target="_blank">购房能力评估计算器</a></li>
                            <li><a href="http://www.anjuke.com/calculator/personal" target="_blank">公积金贷款计算器</a></li>
                    </ul>
    </div>

    <div id="seo_qa" class="show-mod map-link">
        <ul>
                            <li><a href="https://www.anjuke.com/qa/" target="_blank">按时间查找房产问答</a></li>
                            <li><a href="https://hf.anjuke.com/wenti/" target="_blank">按城市查找合肥房产问答</a></li>
                            <li><a href="https://m.anjuke.com/qa/suoyin/" target="_blank">手机版按时间查找房产问题</a></li>
                            <li><a href="https://m.anjuke.com/hf/wenti/" target="_blank">手机版按城市查找合肥房产问答</a></li>
                    </ul>
    </div>

    <div id="map_link" class="show-mod map-link">
        <ul>
                            <li><a href="https://hf.anjuke.com/sitemap/" target="_blank">二手房地图</a></li>
                            <li><a href="https://m.anjuke.com/hf/sitemap/" target="_blank">手机版二手房地图</a></li>
                            <li><a href="https://hf.fang.anjuke.com/fangsitemap/A/" target="_blank">新房楼盘大全</a></li>
                            <li><a href="https://m.anjuke.com/hf/xinfang/sitemap/" target="_blank">手机版新房地图</a></li>
                            <li><a href="https://hf.fang.anjuke.com/fangsitemap/" target="_blank">新房地图</a></li>
                            <li><a href="http://www.anjuke.com/hf/cm/" target="_blank">二手房小区大全</a></li>
                            <li><a href="https://www.anjuke.com/hf/cm-zu/" target="_blank">租房小区大全</a></li>
                            <li><a href="https://m.anjuke.com/hf/xiaoqu/" target="_blank">手机版小区大全</a></li>
                            <li><a href="https://mobile.anjuke.com/esf/hf-cm/" target="_blank">合肥小区</a></li>
                            <li><a href="https://hf.gongjijin.anjuke.com/" target="_blank">合肥公积金</a></li>
                            <li><a href="https://hf.anjuke.com/" target="_blank">合肥房产网</a></li>
                            <li><a href="https://hf.fang.anjuke.com/" target="_blank">合肥新房</a></li>
                            <li><a href="https://hf.anjuke.com/sale/" target="_blank">合肥二手房</a></li>
                            <li><a href="https://hf.zu.anjuke.com/" target="_blank">合肥租房</a></li>
                            <li><a href="https://hf.anjuke.com/market/" target="_blank">合肥房价</a></li>
                            <li><a href="https://hf.anjuke.com/bieshu-sale/" target="_blank">合肥别墅出售</a></li>
                            <li><a href="https://hf.anjuke.com/gongyu-sale/" target="_blank">合肥公寓出售</a></li>
                            <li><a href="https://hf.zu.anjuke.com/gongyu-zufang/" target="_blank">合肥公寓出租</a></li>
                            <li><a href="https://hf.zu.anjuke.com/hezu-zufang/" target="_blank">合肥合租房</a></li>
                            <li><a href="https://hf.zu.anjuke.com/geren-zufang/" target="_blank">合肥个人租房</a></li>
                            <li><a href="https://hf.zu.anjuke.com/bieshu-zufang/" target="_blank">合肥别墅出租</a></li>
                            <li><a href="https://m.anjuke.com/hf" target="_blank">合肥房产网</a></li>
                            <li><a href="https://m.anjuke.com/hf/sale/" target="_blank">合肥二手房</a></li>
                            <li><a href="https://m.anjuke.com/hf/rent/" target="_blank">合肥租房</a></li>
                            <li><a href="https://m.anjuke.com/hf/trendency/" target="_blank">合肥房价</a></li>
                            <li><a href="https://m.anjuke.com/hf/qa/" target="_blank">合肥问答</a></li>
                    </ul>
    </div>

    <div id="house_link" class="show-mod house-link">
        <ul>
                            <li><a href="https://hf.anjuke.com/fang/" target="_blank">二手房</a></li>
                            <li><a href="https://hf.zu.anjuke.com/fang/" target="_blank">租房</a></li>
                            <li><a href="https://m.anjuke.com/hf/propsitemap/esf/" target="_blank">手机版二手房</a></li>
                            <li><a href="https://m.anjuke.com/hf/propsitemap/zf/" target="_blank">手机版租房</a></li>
                            <li><a href="https://hf.fang.anjuke.com/fang/" target="_blank">新房</a></li>
                    </ul>
    </div>

    <div id="other_city" class="show-mod other-city">
        <ul>
                        <li><a href="https://shanghai.anjuke.com/">上海房产网</a></li>
                        <li><a href="https://shanghai.anjuke.com/sale/">上海二手房</a></li>
                        <li><a href="https://guangzhou.anjuke.com/">广州房产网</a></li>
                        <li><a href="https://guangzhou.anjuke.com/sale/">广州二手房</a></li>
                        <li><a href="https://shenzhen.anjuke.com/">深圳房产网</a></li>
                        <li><a href="https://shenzhen.anjuke.com/sale/">深圳二手房</a></li>
                        <li><a href="https://beijing.anjuke.com/">北京房产网</a></li>
                        <li><a href="https://beijing.anjuke.com/sale/">北京二手房</a></li>
                        <li><a href="https://chengdu.anjuke.com/">成都房产网</a></li>
                        <li><a href="https://chengdu.anjuke.com/sale/">成都二手房</a></li>
                        <li><a href="https://nanjing.anjuke.com/">南京房产网</a></li>
                        <li><a href="https://nanjing.anjuke.com/sale/">南京二手房</a></li>
                        <li><a href="https://tianjin.anjuke.com/">天津房产网</a></li>
                        <li><a href="https://tianjin.anjuke.com/sale/">天津二手房</a></li>
                        <li><a href="https://hangzhou.anjuke.com/">杭州房产网</a></li>
                        <li><a href="https://hangzhou.anjuke.com/sale/">杭州二手房</a></li>
                        <li><a href="https://suzhou.anjuke.com/">苏州房产网</a></li>
                        <li><a href="https://suzhou.anjuke.com/sale/">苏州二手房</a></li>
                        <li><a href="https://chongqing.anjuke.com/">重庆房产网</a></li>
                        <li><a href="https://chongqing.anjuke.com/sale/">重庆二手房</a></li>
                        <li><a href="https://m.anjuke.com/sy/sale/">三亚二手房</a></li>
                        <li><a href="https://m.anjuke.com/xm/sale/">厦门二手房</a></li>
                        <li><a href="https://m.anjuke.com/zh/sale/">珠海二手房</a></li>
                        <li><a href="https://m.anjuke.com/hui/sale/">惠州二手房</a></li>
                        <li><a href="https://m.anjuke.com/sh/sale/">上海二手房</a></li>
                        <li><a href="https://m.anjuke.com/sz/sale/">深圳二手房</a></li>
                        <li><a href="https://m.anjuke.com/hai/sale/">海口二手房</a></li>
                        <li><a href="https://m.anjuke.com/bj/sale/">北京二手房</a></li>
                        <li><a href="https://m.anjuke.com/sjz/sale/">石家庄二手房</a></li>
                        <li><a href="https://m.anjuke.com/hz/sale/">杭州二手房</a></li>
                        <li><a href="https://m.anjuke.com/gz/sale/">广州二手房</a></li>
                        <li><a href="https://m.anjuke.com/su/sale/">苏州二手房</a></li>
                        <li><a href="https://m.anjuke.com/nj/sale/">南京二手房</a></li>
                        <li><a href="https://m.anjuke.com/tj/sale/">天津二手房</a></li>
                        <li><a href="https://m.anjuke.com/ks/sale/">昆山二手房</a></li>
                        <li><a href="https://m.anjuke.com/dg/sale/">东莞二手房</a></li>
                        <li><a href="https://m.anjuke.com/cc/sale/">长春二手房</a></li>
                        <li><a href="https://m.anjuke.com/zz/sale/">郑州二手房</a></li>
                        <li><a href="https://m.anjuke.com/heb/sale/">哈尔滨二手房</a></li>
                        <li><a href="https://m.anjuke.com/ty/sale/">太原二手房</a></li>
                        <li><a href="https://m.anjuke.com/dl/sale/">大连二手房</a></li>
                        <li><a href="https://m.anjuke.com/nn/sale/">南宁二手房</a></li>
                        <li><a href="https://m.anjuke.com/hf/sale/">合肥二手房</a></li>
                        <li><a href="https://m.anjuke.com/fz/sale/">福州二手房</a></li>
                        <li><a href="https://m.anjuke.com/qd/sale/">青岛二手房</a></li>
                        <li><a href="https://m.anjuke.com/jn/sale/">济南二手房</a></li>
                        <li><a href="https://m.anjuke.com/km/sale/">昆明二手房</a></li>
                        <li><a href="https://m.anjuke.com/wh/sale/">武汉二手房</a></li>
                        <li><a href="https://m.anjuke.com/cs/sale/">长沙二手房</a></li>
                        <li><a href="https://m.anjuke.com/cq/sale/">重庆二手房</a></li>
                        <li><a href="https://m.anjuke.com/shen/sale/">沈阳二手房</a></li>
                        <li><a href="https://m.anjuke.com/xa/sale/">西安二手房</a></li>
                        <li><a href="https://m.anjuke.com/fs/sale/">佛山二手房</a></li>
                        <li><a href="https://m.anjuke.com/nc/sale/">南昌二手房</a></li>
                        <li><a href="https://m.anjuke.com/wx/sale/">无锡二手房</a></li>
                        <li><a href="https://m.anjuke.com/cd/sale/">成都二手房</a></li>
                        <li><a href="https://beijing.gongjijin.anjuke.com/">北京公积金</a></li>
                        <li><a href="https://chengdu.gongjijin.anjuke.com/">成都公积金</a></li>
                        <li><a href="https://guangzhou.gongjijin.anjuke.com/">广州公积金</a></li>
                        <li><a href="https://hangzhou.gongjijin.anjuke.com/">杭州公积金</a></li>
                        <li><a href="https://nanjing.gongjijin.anjuke.com/">南京公积金</a></li>
                        <li><a href="https://shanghai.gongjijin.anjuke.com/">上海公积金</a></li>
                        <li><a href="https://shenzhen.gongjijin.anjuke.com/">深圳公积金</a></li>
                        <li><a href="https://suzhou.gongjijin.anjuke.com/">苏州公积金</a></li>
                        <li><a href="https://tianjin.gongjijin.anjuke.com/">天津公积金</a></li>
                        <li><a href="https://chongqing.gongjijin.anjuke.com/">重庆公积金</a></li>
                    </ul>
    </div>

    <div class="cp-mod">
        <a href="https://kfzx.anjuke.com/" target="_blank">客户服务中心</a>   
        邮箱：<a href="mailto:service@58ganji.com" target="_blank" rel="nofollow">service@58ganji.com</a>   
        Copyright&nbsp;©&nbsp;2007-2017 www.anjuke.com All Rights Reserved   <a href="http://www.miibeian.gov.cn/" rel="nofollow">ICP号：沪 B2-20090008</a>
    </div>

    
    </div>
    <!-- 侧边栏 -->
    <div class="sidebar" style="display: block; right: 0px;">
    <div class="sidebar-mod sidebar-nav">
        <a href="https://www.anjuke.com/propsale/" rel="nofollow" class="sid-nav" data-soj="right_sidebar" target="_blank">
            <span class="iconfont iconfont22"></span>
            <p>卖房</p>
            <em class="nav-arrow"></em>
            <div class="sidebar-nav-hover">房东卖房</div>
        </a>
        <a href="https://kfzx.anjuke.com/" rel="nofollow" class="sid-nav" data-soj="right_sidebar" target="_blank">
            <span class="iconfont"></span>
            <p>帮助</p>
            <em class="nav-arrow"></em>
            <div class="sidebar-nav-hover">使用帮助</div>
        </a>
        <a href="https://www.wenjuan.com/s/NbqIZr" id="sid_survey" class="sid-nav" rel="nofollow" target="_blank">
            <span class="iconfont"></span>
            <p>调研</p>
            <em class="nav-arrow"></em>
            <div class="sidebar-nav-hover" style="width: 0px;">用户调研</div>
        </a>
        <a href="javascript:void(0);" class="sid-nav">
            <span class="iconfont"></span>
            <p>下载</p>
            <em class="nav-arrow nav-sao"></em>
            <div class="sidebar-nav-hover sidebar-sao">下载安居客APP</div>
        </a>
        <a href="https://about.anjuke.com/chanpin/" class="sid-nav" data-soj="right_sidebar" target="_blank">
            <span class="iconfont"></span>
            <p>推广</p>
            <em class="nav-arrow"></em>
            <div class="sidebar-nav-hover">推广咨询</div>
        </a>
    </div>
</div>
<div class="sidebar-mod sidebar-top" style="display: none;">
    <a href="javascript:void(0);" class="sid-nav">
        <span class="iconfont"></span>
        <em class="nav-arrow"></em>
        <div class="sidebar-nav-hover">返回顶部</div>
    </a>
</div>

    


 


</body></html>