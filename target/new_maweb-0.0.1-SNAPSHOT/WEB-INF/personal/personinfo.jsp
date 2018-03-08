<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- saved from url=(0036)https://user.anjuke.com/user/profile -->
<html xmlns="http://www.w3.org/1999/xhtml" lang="gb2312"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="robots" content="noindex,nofollow">
<link rel="stylesheet" rev="stylesheet" href="${pageContext.request.contextPath}/css/Member_Web_User_Profile.css" type="text/css">
<title>用户中心－个人资料</title>
<script type="text/javascript">
	$(function(){
		
		
		
		})
	function myPublic(){
		$.ajax({
			url:'<%=path %>/house/showmyhouse',
			type:'GET',
			dataType:'json',
			timeout:60000,
			success: function(data){
				var tab="<table align='center' border='0'><th align='center'><td>概况</td><td>操作</td></th>";
			 	for(var i=0;i<data.length;i++){
				tab=tab+"<tr><td><span>"+data[i].topic+"</span> </td><td><a>撤销</a></td></tr>"
				
				
				}
				tab=tab+"</table>";
			}
			
			})
		$('.profile').html(tab);	
	}
</script>
</head>
<body>
<div class="header-mod">
    <div class="header clearfix">
        <div class="logo">

          <i class="split-icon"></i>
          <a class="sub-logo" href="home.jsp">安居客  用户中心</a>
        </div>
        <a href="https://user.anjuke.com/user/profile" class="quit">
          <i class="iconfont quitIcon"></i>
          <span>退出</span>
        </a>
    </div>
</div>
<div class="headerSub-mod">
  <div class="headerSub clearfix">
    <img src="./用户中心－个人资料_files/70x70.jpg" class="user-photo" alt="用户头像">
    <div class="user-info">
      <div class="info-sup clearfix">
        <span class="hello">
                    <span class="now-time">晚上</span>好，<span class="name">张君宝</span>
        </span>
        <ul class="log-way">
                                         <li>
            <i class="iconfont qqIcon"></i>
             <div class="dialog">
              <div class="text">您已通过<span>QQ</span>认证</div>
              <div class="corner"></div>
              <div class="border"></div>
              <div class="masker"></div>
            </div>
          </li>
                                      </ul>
      </div>
      <div class="info-sub clearfix">
        <ul>
          <li class="user-account">
            账户名：<span>1509107915</span>
          </li>
          <i class="split-icon"></i>
          <li class="user-type">
              <span>用户</span>
          </li>
          <i class="split-icon"></i>
          <li class="last-time">
            上次登录：<span class="day">2017-12-14 19:02:06</span>
          </li>
        </ul>
      </div>
    </div>
    <a class="info-modify" href="https://user.anjuke.com/user/profile"><button>修改资料&gt;</button></a>
  </div>
</div><div class="container">
	<div class="content clearfix">
		<!-- 侧边栏 -->
		<div class="side-menu">
	<ul class="menu-list">
		<li>
			<a href="http://user.anjuke.com/user/message" class=""><i class="iconfont"></i>消息</a>
		</li>
		<li>
			<a href="javascript:void(0);" onclick="myPublic()"target="_blank"><i class="iconfont"></i>我的发布</a>
		</li>
		<li>
			<a href="http://user.anjuke.com/user/qa" class=""><i class="iconfont"></i>问答</a>
		</li>
		<li>
			<a href="WEB-INF/personal/publichouse.jsp" target="_blank"><i class="iconfont"></i>出租</a>
		</li>
		<!-- <li>
			<a href="http://user.anjuke.com/member/loan/54948845/"><i class="iconfont">&#xE141;</i>贷款</a>
		</li>
		<li> -->
			<a href="http://hf.fang.anjuke.com/ugc/zone/54948845/?from=ucenter" target="_blank"><i class="iconfont"></i>评论</a>
		
		<li>
			<a href="http://user.anjuke.com/user/profile" class="cur"><i class="iconfont"></i>个人资料</a>
		</li>
		<li>
			<a href="http://user.anjuke.com/user/newHouseView" id="sojcode" class=""><i class="iconfont"></i>看房记录</a>
		</li>
	</ul>

	<div class="tool-list">
		<h4 class="t-title">&nbsp;</h4>
	</div>
</div>
        <div class="right-content">
            <div class="right-cont">
                <ul class="tab-list clearfix">
  <li><a href="https://user.anjuke.com/user/profile#" class="cur">个人资料</a></li>
</ul>

<!-- 个人资料 -->
<div class="profile">
  <div class="profile-title">
    <i class="iconfont"></i>
    <span>基本账号资料</span>
  </div>
  <ul class="profile-list">
    <li class="photo">
      <span class="key">头像</span>
            <img src="./用户中心－个人资料_files/70x70.jpg" alt="你的头像">
      <a href="https://user.anjuke.com/user/modifyPhoto" class="operate-btn">修改</a>
    </li>
    <li class="account">
      <span class="key">帐号</span>
      <input name="user.username" class="value" type="text" value="${user.username}" />
    </li>
    <li class="name">
      <span class="key">昵称</span>
     
      <input name="user.nickname" class="value" type="text" value="${user.nickname}" />
      
    </li>
    <li class="email">
      <span class="key">邮箱</span>
      <input name="user.email" class="value" type="text" value="${user.eamil}" />
      
    </li>
    <li class="phone">
      <span class="key">手机</span>
     <input name="user.phone" class="value" type="text" value="${user.phone}" />
    </li>
    <li class="password">
      <span class="key">密码</span>
      <input class="value" type="text" value="${user.password}" />
    </li>
  </ul>
  <hr>
  <ul class="profile-list">
    <li class="bound">提交          </li>
</ul>
	<input type="submit" align="center" style="background-color:green;family-color:white" value="提交"/>
</div>

<!-- 绑定提示框 -->
<div class="wrap-tip ">
  <div class="content-tip">
    <div class="center-tip">
        </div>
  </div>
</div>

            </div>
        </div>
	</div>
</div>
<div id="footer" class="footer">
    <ul class="links">
        <li><a rel="nofollow" href="https://hf.anjuke.com/help/question/1">关于安居客</a></li>
<!--        <li><a rel="nofollow" href="http://biz.anjuke.com/">渠道招商</a></li>-->
        <li><a rel="nofollow" href="https://hf.anjuke.com/help/question/4">联系我们</a></li>
        <li><a rel="nofollow" href="https://hf.anjuke.com/help/question/7">用户协议</a></li>
        <!-- <li><a rel="nofollow" href="https://hf.anjuke.com/help">使用帮助</a></li> -->
        <li><a rel="nofollow" href="https://hf.anjuke.com/friendlink">友情链接</a></li>
        <li><a href="javascript:void(0);" data-target="map_link">网站地图</a></li>
        <li><a rel="nofollow" href="javascript:;" data-target="other_city">其它城市</a></li>
        <li><a href="javascript:void(0);" data-target="house_link">最新房源</a></li>
        <li><a href="javascript:void(0);" data-target="community_link">小区大全</a></li>
        <li><a href="https://hf.anjuke.com/wenti/">最新问答</a></li>
        <li><a target="_blank" href="http://www.anjuke.com/calculator/loan">房贷计算器</a></li>
        <li><a rel="nofollow" target="_blank" href="http://www.zx110.org/cxs/index.html">放心搜</a></li>
        <li><a rel="nofollow" target="_blank" href="https://about.anjuke.com/chanpin/?from=home_foot_tgy">推广服务</a></li>    </ul>
    <p>
        <a href="https://kfzx.anjuke.com/" target="_blank">客户服务中心</a>&nbsp;&nbsp;&nbsp;&nbsp;
        邮箱：<a href="mailto:service@58ganji.com" target="_blank" rel="nofollow">service@58ganji.com</a>&nbsp;&nbsp;&nbsp;
        Copyright © 2007-2017 www.anjuke.com  All Rights Reserved <a href="http://www.miibeian.gov.cn/" rel="nofollow">ICP号：沪&nbsp;B2-20090008</a>
    </p>
</div>

<div class="dialog">
  <!-- 退出登录对话框 -->
  <div class="quit-content">
    是否要退出安居客帐号？
  </div>
  <div class="dialog-btn quit-btn">
    <a href="http://member.anjuke.com/user/logout"><button class="sure">确定</button></a><button class="cancel">取消</button>
  </div>

  <!-- 修改昵称 -->
<div class="modify-name">
  <p class="error-tip name-error">只能包含中文、英文字母、数字，不包含符号</p>
  <div class="input-box name-box cur">
      <i class="iconfont left-Icon"></i>
      <input class="input-content name" type="text" placeholder="只能包含中文、英文字母、数字，不包含符号" maxlength="12">
      <i class="iconfont ok-tip name-ok"></i>
  </div>
</div>
<div class="dialog-btn modify-name-btn">
  <button class="sure">确定</button><button class="cancel">取消</button>
</div>
</div>
<script type="text/javascript" src="./用户中心－个人资料_files/jquery-underscore.min.js"></script>
<script type="text/javascript" src="./用户中心－个人资料_files/bbv10.js.下载"></script>
<script type="text/javascript" src="./用户中心－个人资料_files/Member_Web_User_Profile.js"></script>
<script type="text/javascript">

var tip = +"0";
var flag = tip == 1 ? true : false;
new ajk.UserCenter.Prorile(flag);
</script>

</body></html>
