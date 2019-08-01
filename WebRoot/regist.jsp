<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>用户注册</title>
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<link rel="stylesheet" type="text/css" href="css/component.css" />
<link rel="stylesheet" type="text/css" href="css/regist.css" />
<script type="text/javascript">
	function Juge(registform)
    {
		if(registform.username.value=="")
		   {
		    window.alert("请输入用户名！"); 
		    registform.username.focus(); 
		    return (false); 
		   }
		if(registform.repwd.value=="")
		   {
		    window.alert("请输入密码！"); 
		    registform.repwd.focus(); 
		    return (false); 
		   }
		if(registform.repwd.value.length <6)
	  	{
	  		window.alert("密码长度过短 可能不安全");
	  		registform.repwd.focus();
	  		return (false);
	  	}
	   if (registform.repwd.value != registform.confpwd.value) 
	    { 
	      window.alert("两者密码不匹配！"); 
	      registform.confpwd.focus(); 
	      return (false); 
	    }
		if(registform.rename.value=="")
		   {
		    window.alert("请输入真实姓名！"); 
		    registform.rename.focus(); 
		    return (false); 
		   }
		if(registform.tel.value=="")
		   {
		    window.alert("请输入电话号码！"); 
		    registform.tel.focus(); 
		    return (false); 
		   }
		if(isNaN(registform.tel.value))
		{
			alert("电话号码不能是字符!");
			return false;
		}
		if(registform.tel.value.length!=11)
		   {
		    window.alert("手机号码长度错误！"); 
		    registform.tel.focus(); 
		    return (false); 
		   }
		if(registform.addr.value=="")
		   {
		    window.alert("请输入收货地址！"); 
		    registform.addr.focus(); 
		    return (false); 
		   } 
		if(registform.email1.value=="")
		   {
		    window.alert("请输入你的邮箱"); 
		    registform.email1.focus(); 
		    return (false); 
		   }
    }
</script>	
</head>
<body>
	<div class="container demo-1">
		<div class="content">
			<div id="large-header" class="large-header">
				<canvas id="demo-canvas"></canvas>
				<div class="logo_box">
					<h3>用户注册</h3>
					<form action="RegistServlet" method="post" onsubmit="return Juge(registform);" name="registform" id="registform">
						<table>
							<tr align="center">
								<td class="infor">用户名</td>
								<td><input type="text" name="username" class="username"
									placeholder="请输入用户名"></td>
							</tr>
							<tr align="center">
								<td class="infor">密码</td>
								<td><input type="password" name="repwd" placeholder="请输入密码"
									class="repwd"></td>
							</tr>
							<tr align="center">
								<td class="infor">确认密码</td>
								<td><input type="password" name="confpwd"
									placeholder="请输入确认密码" class="confpwd"></td>
							</tr>
							<tr align="center">
								<td class="infor">姓名</td>
								<td><input type="text" name="rename" class="rename"
									placeholder="请输入真实姓名"></td>
							</tr>
							<tr align="center">
								<td class="infor">性别</td>
								<td align="left"><input type="radio" name="sex" value="男"
									checked class="sex" />男&nbsp; <input type="radio" name="sex"
									value="女" class="sex" />女</td>
							</tr>
							<tr align="center">
								<td class="infor">手机号</td>
								<td><input type="text" maxlength="11" name="tel"
									placeholder="请输入11位手机号" class="tel"></td>
							</tr>
							<tr align="center">
								<td class="infor">收货地址</td>
								<td>
								<input type="text" name="addr" class="addr" placeholder="请输入收货地址">
									<!-- <div class="city-picker-select"></div> -->
								</td>
							</tr>
							<tr align="center">
								<td class="infor">邮箱</td>
								<td><input type="text" name="email1" class="email1">
									<select name="email2" class="email2">
										<option value="@qq.com">@qq.com</option>
										<option value="@163.com">@163.com</option>
										<option value="@sina.com">@sina.com</option>
								</select></td>
							</tr>
							<tr align="center">
								<td colspan="2"><input type="submit" value="提交"
									class="submit"><input type="button" value="首页"
									class="index" onclick="f()">
									<!-- <input type="reset" value="重置"
									class="reset"> --></td>
							</tr>
						</table>
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
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/citydata.js"></script>
	<script type="text/javascript" src="js/cityPicker-1.0.0.js?v=1"></script>
	<script type="text/javascript">
	function f(){
		window.open('index.jsp');
	}
		$(function () {
			//原生城市-无联动
			var select = $('.city-picker-select').cityPicker({
				dataJson: cityData,
				renderMode: false,
				linkage: false
			});
		});
	</script>
</body>
</html>