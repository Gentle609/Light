package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import factory.UserDaoFactory;

/**
 * Servlet implementation class UpdatePwdServlet
 */
public class UpdatePwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePwdServlet() {
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
		PrintWriter out=response.getWriter();
		//得到输入的密码信息
		String userName=request.getParameter("username");
		String oldpwd=request.getParameter("oldpwd");
		String newpwd=request.getParameter("newpwd");
		//创建数据库操作类对象，调用具体的数据库操作方法modiPwd
		UserDao udi = UserDaoFactory.getInstance();
		boolean flag=false;
		flag=udi.modiPwd(userName,oldpwd,newpwd);
		//提示信息
		if(flag){
			//给用户提示注册成功
			out.print("<script type='text/javascript'>alert('密码修改成功！')</script>");
			response.setHeader("refresh", "2;URL=login.jsp");//改变头部跳转
		}else {
			//给用户提示注册失败
			out.print("<script type='text/javascript'>alert('密码修改失敗！')</script>");
			response.setHeader("refresh", "2;URL=resetPwd.jsp");
		}
		out.flush();
		out.close();
	}
}
