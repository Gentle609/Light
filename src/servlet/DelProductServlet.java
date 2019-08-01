package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;
import factory.ProductDaoFactory;

public class DelProductServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public DelProductServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		String id=request.getParameter("id");
		ProductDao pdi=ProductDaoFactory.getInstance();
		boolean flag=false;
		flag=pdi.delete(Integer.parseInt(id));
		if(flag) {
			out.print("<script type='text/javascript'>alert('删除成功')</script>");
		}else {
			out.print("<script type='text/javascript'>alert('删除失败')</script>");
		}
		response.setHeader("refresh", "1;URL=admin/product-list.jsp");
		out.flush();
		out.close();
	}


}
