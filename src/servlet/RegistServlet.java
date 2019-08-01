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
 * Servlet implementation class RegistServlet
 */
public class RegistServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(2);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		 /*String s=request.getParameter("userProvinceId");
		 String s2=request.getParameter("userCityId");
		 String s3=request.getParameter("userDistrictId");
		 System.out.println(s+"-"+s2+"-"+s3);*/
		// 接收用户输入的数据
		String name = request.getParameter("username");
		String pwd = request.getParameter("repwd");
		String confpwd = request.getParameter("confpwd");
		String rename = request.getParameter("rename");
		String sex = request.getParameter("sex");
		String tel = request.getParameter("tel");
		String address = request.getParameter("addr");
		String email = request.getParameter("email1") + request.getParameter("email2");
		// 创建user对象，封装用户的注册信息
		User user = new User();
		user.setUsername(name);
		user.setPassword(pwd);
		user.setRealName(rename);
		user.setSex(sex);
		user.setTelephone(tel);
		user.setAddress(address);
		user.setEmail(email);
		// 创建数据库操作类对象，调用具体的数据库操作方法add(user)
		UserDao udi = UserDaoFactory.getInstance();
		boolean f = false;
		f = udi.getUserByName(name);
		if (!f) {
			boolean flag = false;
			flag = udi.add(user);
			// 根据方法返回值的结果，给用户进行提示并跳转
			if (flag) {
				// 提示注册成功
				out.print("<script type='text/javascript'>alert('恭喜您注册成功！')</script>");
				response.setHeader("refresh", "2;URL=login.jsp");
			} else {
				// 提示注册失败
				out.print("<script type='text/javascript'>alert('注册失败，请重新注册！')</script>");
				response.setHeader("refresh", "2;URL=regist.jsp");
			}
		} else {
			out.print("<script type='text/javascript'>alert('用户名已存在，请重新注册！')</script>");
			response.setHeader("refresh", "2;URL=regist.jsp");
		}
		out.flush();
		out.close();
	}
}
