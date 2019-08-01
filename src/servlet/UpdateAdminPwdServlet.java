package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AdminDao;
import impl.AdminDaoImpl;

/**
 * Servlet implementation class UpdateAdminPwdServlet
 */
public class UpdateAdminPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateAdminPwdServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session=request.getSession();
		PrintWriter out = response.getWriter();
		String name=request.getParameter("name");
		String pwd=request.getParameter("pwd");
		String newpwd=request.getParameter("newpwd");
		String confpwd=request.getParameter("confpwd");
		AdminDao ad=new AdminDaoImpl();
		System.out.println(name);
		int flag=ad.updatePwd(name,pwd,newpwd);
		if(!newpwd.equals(confpwd)){
			out.print("<script>alert('两次输入密码不一致')</script>");
			response.setHeader("Refresh","1;URL=admin/admin-info.jsp");
		}else{
			if(flag==1){
				out.print("<script>alert('修改成功')</script>");
				session.setAttribute("userName", "");
				response.sendRedirect("admin/login.html");
			}else if(flag==2){
				out.print("<script>alert('修改失败')</script>");
				response.setHeader("Refresh","1;URL=admin/admin-info.jsp");
			}else if(flag==3){
				out.print("<script>alert('原密码不正确')</script>");
				response.setHeader("Refresh","1;URL=admin/admin-info.jsp");
			}
		}
	}

}
