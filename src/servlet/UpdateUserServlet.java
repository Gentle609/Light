package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import entity.User;
import factory.UserDaoFactory;

/**
 * Servlet implementation class UpdateServlet
 */
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateUserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session=request.getSession();
		PrintWriter out=response.getWriter();
		//获取用户修改的信息
		String userName=request.getParameter("username");
		String rename=request.getParameter("rename");
		String sex=request.getParameter("sex");
		String tel=request.getParameter("tel");
		String address=request.getParameter("address");
		String email=request.getParameter("email");
		//创建user对象，封装用户修改的信息
		User user=new User();
		user.setUsername(userName);
		user.setRealName(rename);
		user.setSex(sex);
		user.setTelephone(tel);
		user.setAddress(address);
		user.setEmail(email);
		//创建数据库操作类对象，调用具体的数据库操作方法update(user)
		UserDao udi = UserDaoFactory.getInstance();
		boolean flag=false;
		flag=udi.update(user);
		//根据方法返回值的结果，给用户进行提示并跳转
		if(flag){
			//提示注册成功
			session.setAttribute("user", user);
			out.print("<script type='text/javascript'>alert('修改信息成功！')</script>");
			//2秒后跳转到index页面
			response.setHeader("refresh", "2;URL=index.jsp");
		}else{
			//提示注册失败
			out.print("<script type='text/javascript'>alert('修改失败！')</script>");
			response.setHeader("refresh", "2;URL=userInfo.jsp");
		}
		out.flush();
		out.close();
	}

}
