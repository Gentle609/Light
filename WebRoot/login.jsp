<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>用户登录</title>
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<link rel="stylesheet" type="text/css" href="css/component.css" />
</head>
<body>
	<div class="container demo-1">
		<div class="content">
			<div id="large-header" class="large-header">
				<canvas id="demo-canvas"></canvas>
				<div class="logo_box">
					<h3>用户登录</h3>
					<form action="LoginServlet" name="f" method="post">
						<div class="input_outer">
							<span class="u_user"></span> <input name="logname" class="text"
								style="color: #FFFFFF !important" type="text"
								placeholder="请输入用户名">
						</div>
						<div class="input_outer">
							<span class="us_uer"></span> <input name="logpass" class="text"
								style="color: #FFFFFF !important; position: absolute; z-index: 100;"
								type="password" placeholder="请输入密码"> <span class="eye"></span>
						</div>
						<div class="mb2">
							<input type="submit" class="act-but submit"
								style="color: #FFFFFF" value="登录">
							<a class="act-but submit"
								style="color: #FFFFFF" href="index.jsp">首页</a>
						</div>
						<div class="mb3">
							<div class="regist">
								还没有账号，<a href="regist.jsp" class="regist_btn">免费注册</a>
							</div>
							<div class="forget">
								<a href="forgetPwd.jsp" class="forget_btn">忘记密码</a>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- /container -->
	<script src="js/TweenLite.min.js"></script>
	<script src="js/EasePack.min.js"></script>
	<script src="js/rAF.js"></script>
	<script src="js/demo-1.js"></script>
</body>
</html>