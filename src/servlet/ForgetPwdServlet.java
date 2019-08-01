package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import factory.UserDaoFactory;
import impl.UserDaoImpl;


public class ForgetPwdServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		HttpSession session = request.getSession();
		//自动生成的验证码
		String key = (String) session.getAttribute("key");
		String username=request.getParameter("username");
		String checkcode=request.getParameter("checkcode");
		UserDao udi=UserDaoFactory.getInstance();
		boolean flag=udi.getUserByName(username);
		if(checkcode.equals(key)){
			if(flag){
				String s=""+(111111+Math.round(Math.random()*999999));
				boolean f=udi.resetPwd(username,s);
				if(f){
				out.print("<script type=\"text/javascript\">");
				out.print("alert('密码重设为"+s+"，请尽快登录修改密码');");
				out.print("open(\"login.jsp\",\"_self\");");
				out.print("</script>");
				}else{
					out.print("<script type=\"text/javascript\">");
					out.print("alert(\"找回密码失败\");");
					out.print("open(\"forgetPwd.jsp\",\"_self\");");
					out.print("</script>");
				}
			}else{
				out.print("<script type=\"text/javascript\">");
				out.print("alert(\"用户名不存在，请重新输入\");");
				out.print("open(\"forgetPwd.jsp\",\"_self\");");
				out.print("</script>");
			}
		}else{
			request.setAttribute("username",username);
			out.print("<script type=\"text/javascript\">");
			out.print("alert(\"验证码输入有误，请重新输入\");");
			out.print("open(\"forgetPwd.jsp\",\"_self\");");
			out.print("</script>");
		}
	}
}
