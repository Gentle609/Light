package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Cart;


public class DeleteCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String id=request.getParameter("id");
		List<Cart> list=(List<Cart>)session.getAttribute("cartList");
		if(list==null) {
			list=new ArrayList<Cart>();
		}
		Iterator<Cart> it=list.iterator();
		while(it.hasNext()) {
			Cart c=it.next();
			if(c.getpId()==Integer.parseInt(id)) {
				it.remove();
				break;
			}
		}
		session.setAttribute("cartList", list);
		response.sendRedirect("list_cart.jsp");
	}

}
