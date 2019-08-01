package servlet;

import impl.UserDaoImpl;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import entity.User;
import factory.UserDaoFactory;

public class LoginServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		String name=request.getParameter("logname");
		String pwd=request.getParameter("logpass");
		HttpSession session=request.getSession();
		session.setAttribute("user1", name);
		//存取登录后的用户信息
		User user=new User();
		//调用UserDaoImpl的方法
		UserDao udi=UserDaoFactory.getInstance();
		int flag=udi.login(name, pwd);
		if(flag==3){
			//登录成功
			user=udi.getUserByUserName(name);
			session.setAttribute("user", user);
			//添加cookie，存储用户名和密码
			Cookie c=new Cookie("username",URLEncoder.encode(name,"utf-8"));
			c.setMaxAge(60*60*24);
			response.addCookie(c);
			//request.getRequestDispatcher("index.jsp").forward(request, response);
			response.sendRedirect("index.jsp");
		}else if(flag==2){
			//密码错误
			out.print("<script type=\"text/javascript\">");
            out.print("alert(\"密码错误\");");
            out.print("open(\"login.jsp\",\"_self\");");
            out.print("</script>");
		}else if(flag==1){
			out.print("<script type=\"text/javascript\">");
			out.print("alert(\"您还没有账号，请注册\");");
			out.print("open(\"regist.jsp\",\"_self\");");
			out.print("</script>");
		}
	}
}
