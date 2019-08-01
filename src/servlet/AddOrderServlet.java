package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Cart;
import entity.Order;
import entity.OrderDetail;
import entity.User;
import impl.OrderDaoImpl;

/**
 * Servlet implementation class AddOrderServlet
 */
public class AddOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddOrderServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		List<Cart> cartList = (List<Cart>) session.getAttribute("cartList");
		if (cartList == null) {
			cartList = new ArrayList<Cart>();
		}
		Order o = new Order();
		o.setUserID(user.getId());
		o.setOrderStatus("已确认");
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		o.setRegistTime(sdf.format(date));
		List<OrderDetail> list = (List<OrderDetail>) o.getOrderDetail();
		for (Cart c : cartList) {
			OrderDetail od = new OrderDetail();
			od.setProductID(c.getpId());
			od.setNum(c.getNum());
			list.add(od);
		}
		OrderDaoImpl odi=new OrderDaoImpl();
		boolean flag=false;
		flag=odi.add(o);
		if(flag) {
			out.print("<script type='text/javascript'>alert('下单成功！')</script>");
			session.setAttribute("cartList", null);
		}else {
			out.print("<script type='text/javascript'>alert('下单失败！')</script>");
		}
		response.setHeader("refresh", "1;URL=list_order.jsp");//改变头部跳转
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
