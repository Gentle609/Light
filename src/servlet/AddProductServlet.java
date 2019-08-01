package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;
import entity.Product;
import factory.ProductDaoFactory;

public class AddProductServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		String name=request.getParameter("pname");
		String code=request.getParameter("pcode");
		String type=request.getParameter("type");
		String num=request.getParameter("num");
		String price=request.getParameter("price");
		String pic=request.getParameter("pic");
		String ad=request.getParameter("ad");
		String intro=request.getParameter("editorValue");
		double dprice=0.0;
		int inum=0;
		if(price!=null) {
			dprice=Double.parseDouble(price);
		}
		if(num!=null) {
			inum=Integer.parseInt(num);
		}
		Product p=new Product();
		p.setpName(name);
		p.setpCode(code);
		p.setPrice(dprice);
		p.setType(type);
		p.setNumber(inum);
		p.setInformation(intro);
		p.setAd(ad);
		p.setPicture(pic);
		p.setpFlag(0);
		ProductDao pdi=ProductDaoFactory.getInstance();
		boolean flag=false;
		flag=pdi.add(p);
		if(flag) {
			out.print("<script type='text/javascript'>alert('添加成功')</script>");
		}else{
			out.print("<script type='text/javascript'>alert('添加失败')</script>");
		}
		response.setHeader("refresh", "2;URL=admin/product-add.html");
	}
}
