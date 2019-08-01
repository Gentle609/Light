<%@page import="java.util.Date"%>
<%@page import="entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	User user1 = (User) session.getAttribute("user");
	List<Cart> cartList = (List<Cart>) session.getAttribute("cartList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>提交订单</title>
<style type="text/css">
#checkOrder {
	width: 80%;
	margin: 0px auto;
	font-size: 18px;
}

#checkOrder table {
	text-align: center;
}

#checkOrder table th {
	background: #4EEE94;
}
</style>
</head>
<body>
	<div id="header"><%@ include file="header.jsp"%></div>
	<div id="content">
		<div id="checkOrder">
			<%
				if (user1 == null) {
					out.println("<h1 style='padding:20px'>请先登录！</h1>");
				} else {
					Date date = new Date();
					java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					double sum = 0.0;
			%>
			<div style="width: 50%; margin: 0px auto;">
				<div align="center"
					style="font-size: 20px; font-family: 黑体; text-shadow: blue; margin-left: 50px;">
					<h3>订单信息</h3>
				</div>
				<ul style="margin: 0 auto;">
					<li style="list-style: none;" class="text">用户名：<%=user1.getRealName()%></li>
					<li style="list-style: none;" class="text">配送地址：<%=user1.getAddress()%></li>
					<li style="list-style: none;" class="text">联系电话：<%=user1.getTelephone()%></li>
					<li style="list-style: none;" class="text">订单时间：<%=sdf.format(date)%></li>
				</ul>
			</div>
			<div
				style="width: 50%; margin: 0px auto; margin-top: 10px; text-align: center;">
				<table align="center">
					<tr style="margin-bottom: 10px;">
						<th width="25%" scope="col">商品图片</th>
						<th width="40%" scope="col">商品名称</th>
						<th width="20%" scope="col">商品价格</th>
						<th width="15%" scope="col">数量</th>
					</tr>
					<%
						if (cartList != null) {
								for (Cart c : cartList) {
									sum += c.getPrice() * c.getNum();
					%>
					<tr style="margin-top: 10px;">
						<td class="row"><a
							href="product_detail.jsp?id=<%=c.getpId()%>"><img
								src="<%=c.getPicture()%> " width="90" height="60"></img></a></td>
						<td class="row"><a
							href="product_detail.jsp?id=<%=c.getpId()%>"><%=c.getpName()%></a></td>
						<td class="row"><%=c.getPrice()%></td>
						<td class="row"><%=c.getNum()%></td>
					</tr>
					<%
						}
							}
					%>
				</table>
			</div>
			<div align="center"
				style="width: 450px; margin: 30px auto 30px auto;">
				<p style="font-size: 18px; color: blue; display: inline-block;">
					合计：<%=sum%>&nbsp; RMB
				</p>
				<input type="submit" name="totalprice" value="提交订单" class="picbut"
					onclick="javascript:window.location.href='./AddOrderServlet'"
					style="display: inline-block; margin-left: 90px; font-size: 15px; width: 100px; background: red; color: #FFEC8B; font-weight: bold;border:1px solid #CD5C5C;" />
			</div>
			<%
				}
			%>
		</div>
	</div>
	<div id="footer"><%@ include file="footer.jsp"%></div>
</body>
</html>