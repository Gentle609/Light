package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Cart;


public class UpdateCartServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String id=request.getParameter("id");
		String num=request.getParameter("num");
		List<Cart> list=(List<Cart>)session.getAttribute("cartList");
		if(list==null) {
			list=new ArrayList<Cart>();
		}
		for(Cart c:list) {
			if(c.getpId()==Integer.parseInt(id)) {
				c.setNum(Integer.parseInt(num));
				break;
			}
		}
		session.setAttribute("cartList", list);
		response.sendRedirect("list_cart.jsp");
	}

}
