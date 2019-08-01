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

/**
 * Servlet implementation class UpdateProductServlet
 */
public class UpdateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProductServlet() {
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
		String id=request.getParameter("id");
		String name=request.getParameter("pname");
		String code=request.getParameter("pcode");
		String type=request.getParameter("type");
		String num=request.getParameter("num");
		String price=request.getParameter("price");
		String pic=request.getParameter("pic");
		String ad=request.getParameter("ad");
		String intro=request.getParameter("editorValue");
		double price1=0.0;
		int number=0;
		int pid=0;
		if(id!=null){
			pid=Integer.parseInt(id);
		}
		if(price!=null){
			price1=Double.parseDouble(price);
		}
		if(num!=null){
			number=Integer.parseInt(num);
		}
		Product p=new Product();
		p.setpId(pid);
		p.setpName(name);
		p.setpCode(code);
		p.setType(type);
		p.setPrice(price1);
		p.setNumber(number);
		p.setPicture(pic);
		p.setAd(ad);
		p.setInformation(intro);
		ProductDao pdi=ProductDaoFactory.getInstance();
		boolean flag=false;
		flag=pdi.update(p);
		if(flag) {
			out.print("<script type='text/javascript'>alert('商品信息修改成功')</script>");
		}else{
			out.print("<script type='text/javascript'>alert('商品信息修改失败')</script>");
		}
		response.setHeader("refresh", "2;URL=admin/product-list.jsp");
	}

}
