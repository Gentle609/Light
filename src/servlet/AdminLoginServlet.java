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
 * Servlet implementation class AdminLoginServlet
 */
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	doPost(req, resp);
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session=request.getSession();
		PrintWriter out=response.getWriter();
		String userName=request.getParameter("username");
		String pwd=request.getParameter("password");
		AdminDao adi=new AdminDaoImpl();
		int flag=0;
		flag=adi.login(userName, pwd);
		if(flag==3) {
			session.setAttribute("MyCKFinder_MyUserRole", "admin@110");//
			session.removeAttribute("loginInfo");
			session.setAttribute("userName", userName);
			response.sendRedirect("admin/index.html");
		}else if(flag==2){
			//密码错误
			out.print("<script type=\"text/javascript\">");
            out.print("alert(\"密码错误\");");
            out.print("open(\"admin/login.html\",\"_self\");");
            out.print("</script>");
		}else if(flag==1){
			out.print("<script type=\"text/javascript\">");
			out.print("alert(\"用户名不存在\");");
			out.print("open(\"admin/login.html\",\"_self\");");
			out.print("</script>");
		}
	}

}
