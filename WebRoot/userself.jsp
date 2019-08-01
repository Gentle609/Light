<%@page import="entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改个人信息</title>
<style type="text/css">
#userinfo {
	font-size: 18px;
}

#userinfo h2 {
	color: #50d8a2;
	padding: 20px;
}

#userinfo input {
	width: 260px;
	height: 30px;
	font-size: 18px;
}

#userinfo .sex {
	width: 80px;
	height: 20px;
}

#userinfo table tr td {
	padding: 10px;
	border: 1px solid black;
	text-align: center;
}

#userinfo .infor {
	text-align: right;
}

#userinfo .button {
	width: 70px;
	height: 40px;
	background: #00cd66;
	border-radius: 15px;
	margin-left: 40px;
}
</style>
</head>
<body>
	<div id="userinfo">
		<%
			User user = (User) session.getAttribute("user");
			//System.out.println("性别："+user.getSex());
			if (user == null) {
				out.print("<h1>请重新登陆！</h1>");
			} else {
		%>
		<h2>修改个人信息</h2>
		<form action="UpdateUserServlet" method="post">
			<table>
				<tr>
					<td class="infor">用户名(不可修改)</td>
					<td>
					<!--加disabled之后表单提交会过滤掉数据，所以加个文本框，设置hidden属性隐藏，用于提交数据  -->
					<input type="text" class="username"
						value="${user.username }" disabled="disabled">
						<input type="hidden" name="username" class="username"
						value="${user.username }"></td>
				</tr>
				<tr>
					<td class="infor">姓名</td>
					<td><input type="text" name="rename" class="rename"
						value="${user.realName }"></td>
				</tr>
				<tr>
					<td class="infor">性别</td>
					<td align="left">
						<%
							if ("男".equals(user.getSex())) {
						%> <input name="sex" type="radio" value="男" checked class="sex" />男&nbsp;
						<input type="radio" name="sex" value="女" class="sex" />女
					</td>
					<%
						} else {
					%>
					<input name="sex" type="radio" value="男" class="sex" />男&nbsp;
					<input type="radio" name="sex" value="女" checked class="sex" />女
					</td>
					<%
						}
					%></td>
				</tr>
				<tr>
					<td class="infor">手机号</td>
					<td><input type="text" maxlength="11" name="tel"
						value="${user.telephone }" class="tel"></td>
				</tr>
				<tr>
					<td class="infor">收货地址</td>
					<td><input type="text" maxlength="250" name="address"
						value="${user.address }" class="address"></td>
				</tr>
				<tr>
					<td class="infor">邮箱</td>
					<td><input type="text" name="email" class="email"
						value="${user.email }"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="提交" class="button">
						<input type="reset" value="重置" class="button"></td>
				</tr>
			</table>
		</form>
		<%
			}
		%>
	</div>
</body>
</html>