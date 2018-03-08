<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/amazeui.css" />
	<link href="${pageContext.request.contextPath}/css/dlstyle.css" rel="stylesheet" type="text/css">
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/amazeui.min.js"></script>
	<script type="text/javascript">
        function submit() {
            $.ajax({
                url: '<%=path %>/user/login',
                type: 'POST',
                data: $("#loginform").serialize(),
                dataType: 'json',
                timeout: 60000,
                success: function (data) {
                    if(data.success == 'true'){
                        window.location.href="http://localhost:8080/new_maweb/home.jsp";
                    }else {
                        alert(data.content);
                    }
                },
                error: function () {
                    alert('网络异常');
                }
            });
        }


	</script>
  </head>
  
  <body>
    
<div class="login-boxtitle">
	<a href="home.html"><img alt="logo" src="${pageContext.request.contextPath}/images/logobig.png" /></a>
</div>

<div class="login-banner">
	<div class="login-main">
		<div class="login-banner-bg"><span></span><img src="${pageContext.request.contextPath}/images/big.jpg" /></div>
		<div class="login-box">

			<h3 class="title">登录安居乐</h3>

			<div class="clear"></div>

			<div class="login-form">
				<form id="loginform">
					<div class="user-name">
						<label for="user"><i class="am-icon-user"></i></label>
						<input type="text" name="name" id="user" placeholder="手机/用户名">
					</div>
					<div class="user-pass">
						<label for="password"><i class="am-icon-lock"></i></label>
						<input type="password" name="pwd" id="password" placeholder="请输入密码">
					</div>
				</form>
			</div>

			<div class="login-links">
				<label for="remember-me"><input id="remember-me" type="checkbox">记住密码</label>
				<a href="#" class="am-fr">忘记密码</a>
				<a href="<%=path %>/register.jsp" class="zcnext am-fr am-btn-default">注册</a>
				<br />
			</div>
			<div class="am-cf">
				<input type="text" name="" value="登 录" class="am-btn am-btn-primary am-btn-sm" onclick="submit()">
			</div>
			<%--<div class="partner">
				<h3>合作账号</h3>
				<div class="am-btn-group">
					<li><a href="#"><i class="am-icon-qq am-icon-sm"></i><span>QQ登录</span></a></li>
					<li><a href="#"><i class="am-icon-weibo am-icon-sm"></i><span>微博登录</span> </a></li>
					<li><a href="#"><i class="am-icon-weixin am-icon-sm"></i><span>微信登录</span> </a></li>
				</div>
			</div>--%>

		</div>
	</div>
</div>


<!-- <div class="footer ">
	<div class="footer-hd ">
		<p>
			<a href="# ">恒望科技</a>
			<b>|</b>
			<a href="# ">商城首页</a>
			<b>|</b>
			<a href="# ">支付宝</a>
			<b>|</b>
			<a href="# ">物流</a>
		</p>
	</div>
	<div class="footer-bd ">
		<p>
			<a href="# ">关于恒望</a>
			<a href="# ">合作伙伴</a>
			<a href="# ">联系我们</a>
			<a href="# ">网站地图</a>
			<em>© 2015-2025 Hengwang.com 版权所有. 更多模板 <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></em>
		</p>
	</div>
</div> -->
  </body>
</html>
