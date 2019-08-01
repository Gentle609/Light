package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import impl.OrderDaoImpl;

/**
 * Servlet implementation class OrderReceiveServlet
 */
public class OrderReceiveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderReceiveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
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
		OrderDaoImpl odi=new OrderDaoImpl();
		boolean flag=false;
		flag=odi.receive(Integer.parseInt(id));
		if(flag) {
			out.print("<script type='text/javascript'>alert('收货成功！')</script>");
		}else {
			out.print("<script type='text/javascript'>alert('收货失败！')</script>");
		}
		response.setHeader("refresh", "2;URL=list_order.jsp");//改变头部跳转
		//带参数的跳转
		out.flush();
		out.close();
		
	}
}
