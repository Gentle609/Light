package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import entity.User;
import factory.UserDaoFactory;

/**
 * Servlet implementation class FindUserServlet
 */
public class FindUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		System.out.println(2);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session=request.getSession();
		String name=request.getParameter("name");
		PrintWriter out=response.getWriter();
		UserDao pdi=UserDaoFactory.getInstance();
		List<User> list=pdi.find(name);
		if(list==null) {
			list=new ArrayList<User>();
		}
		if(list.size()==0){
			out.print("<script type='text/javascript'>alert('您查询的用户不存在！')</script>");
			list=null;
		}
		session.setAttribute("userList", list);
		response.setHeader("refresh", "0.5;URL=admin/user-list.jsp");
	}

}
