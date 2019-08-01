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

import dao.OrderDao;
import entity.Order;
import factory.OrderDaoFactory;

/**
 * Servlet implementation class FindOrderServlet
 */
public class FindOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindOrderServlet() {
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
		PrintWriter out=response.getWriter();
		String number=request.getParameter("code");
		OrderDao odi=OrderDaoFactory.getInstance();
		List<Order> list=odi.find(number);		
		if(list==null) {
			list=new ArrayList<Order>();
		}
		if(list.size()==0){
			out.print("<script type='text/javascript'>alert('您查询的订单不存在！')</script>");
			list=null;
		}
		session.setAttribute("orderList", list);
		response.setHeader("refresh", "0.5;URL=admin/order-list.jsp");
	}

}
