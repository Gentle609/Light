<%@page import="java.net.URLDecoder"%>
<%@page import="entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>右侧滚动字幕</title>
<link rel="stylesheet" type="text/css" href="style/main.css">
</head>
<body>
	<%
		User user = (User) session.getAttribute("user");
		Cookie[] ck = request.getCookies();
		String userName = "";
		if (ck != null && ck.length > 0) {
			for (Cookie c : ck) {
				if (c.getName().equals("userName")) {
					userName = URLDecoder.decode(c.getValue(), "utf-8");
				}
			}
		}
		if (user == null) {
	%>
	<div id="gg">
		网站公告<img src="images/lb.png" id="lb">
		<marquee
			style="border: 1px solid #F4A460; text-indent: 28px; color: black; font-size: 15px;"
			width="280px" height="224px" scrollamount="3" direction="up"
			bgcolor="#FFFAF0" onmouseout="this.start()" onmouseover="this.stop()">
			灯具在线销售系统是一家专门卖灯具的网站，在这里，你可以畅游灯的海洋，享受不一样的视觉的感受。你将发现灯具不仅仅能用来照明，
			还具有丰富的色彩，能够随心切换蓝牙音乐，给你一个，彰显个性、紧跟时尚潮流的家。心动不如行动，现在就把它带回家吧。 </marquee>
	</div>
	<%
		} else {
	%>
	<div class="liebiao">
		<ul>
			<li>欢迎回来，${sessionScope.user.username }</li>
			<li><a href="list_cart.jsp">我的购物车</a></li>
			<li><a href="list_order.jsp">我的订单</a></li>
			<li><a href="userInfo.jsp">个人信息</a></li>
			<li><a href="resetPwd.jsp">修改密码</a></li>
			<li><a href="LogoutServlet">退出</a></li>
		</ul>
	</div>
	<%
		}
	%>
	<div id="tese">
		<h2>特色服务</h2>
		<ol>
			<li>24小时送达迟一天退10元</li>
			<li>支付宝金账户购物全场98折</li>
			<li>用建行卡购物全场98折</li>
			<li>工行分期付款0.3%/月手续费</li>
			<li>7天内无条件退货</li>
			<li>运输造成的损害我们承担损失</li>
		</ol>
	</div>
</body>
</html>