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


public class AddCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session=request.getSession();
		String pid=request.getParameter("pid");
		String picture=request.getParameter("picture");
		String pname=request.getParameter("pname");
		String price=request.getParameter("price");
		//库存数量
		String pNum=request.getParameter("max");
		//用户输入的购买数量
		String number=request.getParameter("count");
		List<Cart> list = (List<Cart>) session.getAttribute("cartList");
		if(list==null){
			list=new ArrayList<Cart>();
		}
		Cart c=new Cart();
		c.setpId(Integer.parseInt(pid));
		c.setPicture(picture);
		c.setpName(pname);
		c.setPrice(Double.parseDouble(price));
		c.setPnum(Integer.parseInt(pNum));
		c.setNum(Integer.parseInt(number));
		//判断购物车是否有该商品
		boolean flag=false;
		for (Cart cart : list) {
			if(cart.getpId()==c.getpId()){
				cart.setNum(cart.getNum()+c.getNum());
				flag=true;
				break;
			}
		}
		if(!flag){
			list.add(c);
		}
		session.setAttribute("cartList", list);
		response.sendRedirect("list_cart.jsp");
	}
}
