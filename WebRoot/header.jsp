<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String path_right = request.getContextPath();
String basePath_right = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path_right+"/";
%>
<!-- System.out.println(path_right);
System.out.println(basePath_right); -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>头部导航栏</title>
<link type="text/css" rel="stylesheet" href="style/main.css">
</head>
<body>
	<div class="LoginRe">
		<div class="clear">
			<div class="LoginRe_L">
				您好，欢迎光临灯具专卖网！
				<%
				String name = (String) session.getAttribute("user1");
				if (name == null) {
			%>
				<a class="LR_a1" href="<%=path_right%>/login.jsp">[请登录]</a>|<a href="<%=path_right%>/regist.jsp"
					class="LR_a2">[免费注册]</a>
				<%
					} else {
				%>
				<%
					}
				%>
			</div>
			<div class="LoginRe_R">
				<marquee class="gd">科技让世界更亮丽，体现生活之彩。您的需求和满意是我们的追求</marquee>
			</div>
		</div>
	</div>
	<table>
		<tr align="center">
			<td width="20px"><a href="<%=path_right%>/search.jsp" class="all">全部商品分类</a></td>
			<td width="10px"><a href="<%=path_right%>/index.jsp">首页</a></td>
			<td width="10px"><a href="<%=path_right%>/search.jsp">搜索</a></td>
			<td width="10px"><a href="<%=path_right%>/list_order.jsp">订单</a></td>
			<td width="10px"><a href="<%=path_right%>/list_cart.jsp">购物车</a></td>
			<td width="10px"><a href="<%=path_right%>/about.jsp">关于我们</a></td>
		</tr>
	</table>
	<hr color="#8B0A50">
	<script src="js/jquery-1.6.js" type="text/javascript"></script>
</body>
</html>