<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>忘记密码</title>
<style type="text/css">
#forgetIn h2 {
	color: #8000ff;
	margin-bottom: 30px;
}

#forgetIn{
	font-weight: bold;
	text-align: center;
	font-size: 20px;
	padding: 15px;
} 

#forgetIn input {
	width: 220px;
	height: 30px;
	font-size: 18px;
}

#forgetIn table tr td {
	width: 500px;
	margin: 0px auto;
	padding: 10px;
}

#forgetIn #td1 {
	width: 10px;
}
</style>
</head>
<body>
	<div id="forgetIn">
		<form action="ForgetPwdServlet" method="post">
			<div id="forget1">
				<h2>忘记密码</h2>
				<table align="center">
					<tr>
						<td align="right">用户名:</td>
						<td align="left" colspan="2"><input type="text"
							placeholder="请输入注册的用户名" name="username"></td>
					</tr>
					<tr>
						<td align="right">验证码:</td>
						<td align="left" id="td1"><input type="text"
							class="form-control" id="checkcode" name="checkcode"
							placeholder="请输入验证码"></td>
						<td align="left"><img id="loginform:vCode"
							src="validatecode.jsp"
							onclick="javascript:document.getElementById('loginform:vCode').src='validatecode.jsp?'+Math.random();" />
							<label style="color: red; font-size: 10px;">${validateError }</label></td>
					</tr>
					<tr>
						<td colspan="3"><input type="submit" width="100" value="验证"
							name="submit" id="btnEp"
							style="background: url('./images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">
							<input type="button" width="100" value="取消" name="exit"
							style="background: url('./images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white; margin-left: 70px;"
							onclick="location.href='index.jsp'"></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</body>
</html>