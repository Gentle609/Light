<%@page import="entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
<style type="text/css">
#regist{
	text-align: center;
	font-size: 20px;
}
#regist input {
	width: 260px;
	height: 30px;
	font-size: 18px;
}

#regist .picbut {
	width: 70px;
	height: 40px;
	background: #00f5ff;
	border-radius: 15px;
	margin-left: 40px;
	color: #0000ff;
}
#regist h2{
	color:#9B30FF;
	font-size:28px;
	padding: 20px;
}
#regist table{
	margin: 0px auto;
}
#regist td{
	padding: 10px;
}
</style>
<script type="text/javascript">
	function Juge(pwdmodiform)
    {
		if(pwdmodiform.oldpwd.value=="")
		   {
		    window.alert("请输入旧密码！"); 
		    pwdmodiform.oldpwd.focus(); 
		    return (false); 
		   }
		if(pwdmodiform.newpwd.value=="")
		   {
		    window.alert("请输入新密码！"); 
		    pwdmodiform.newpwd.focus(); 
		    return (false); 
		   }
		if(pwdmodiform.newpwd.value.length <6)
	  	{
	  		window.alert("密码长度过短 可能不安全");
	  		pwdmodiform.newpwd.focus();
	  		return (false);
	  	}
		if(pwdmodiform.newpwdsame.value=="")
		   {
		    window.alert("请输入确认密码！"); 
		    pwdmodiform.newpwdsame.focus(); 
		    return (false); 
		   }
		if(pwdmodiform.newpwdsame.value.length <6)
	  	{
	  		window.alert("密码长度过短 可能不安全");
	  		pwdmodiform.newpwdsame.focus();
	  		return (false);
	  	}
	   if (pwdmodiform.newpwd.value != pwdmodiform.newpwdsame.value) 
	    { 
	      window.alert("两者密码不匹配！"); 
	      pwdmodiform.newpwdsame.focus(); 
	      return (false); 
	    }
	  }
    </script>
</head>
<div id="content">
	<div id="regist">
		<%
        User user=(User)session.getAttribute("user");
        %>
		<div id="registtop">
			<h2>重置密码</h2>
		</div>
		<div>
		<!--./站点表示根目录,../表示上一级 -->
			<form name="pwdmodiform" id="registform" action="./UpdatePwdServlet"
				onsubmit="return Juge(pwdmodiform);" method="post">
				<table align="center">
					<tr>
						<th>旧密码</th>
						<td>
						<input type="hidden" readonly="readonly" name="username" size="20" maxlength="20" value="<%=user.getUsername() %>" />
						<input type="password" name="oldpwd" size="20"
							maxlength="20" /></td>
					</tr>
					<tr>
						<th>新密码</th>
						<td><input type="password" name="newpwd" size="20"
							maxlength="20" /></td>
					</tr>
					<tr>
						<th>确认密码</th>
						<td><input type="password" name="newpwdsame" size="20"
							maxlength="20" /></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit"
							name="submit" value=" 提交" class="picbut" /> &nbsp;&nbsp; <input
							name="reset" type="reset" value="清空" class="picbut" style="background: red;color:white;"/></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>
</html>