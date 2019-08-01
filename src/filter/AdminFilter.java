package filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.User;

/**
 * Servlet Filter implementation class AdminFilter
 */
public class AdminFilter implements Filter {

    /**
     * Default constructor. 
     */
    public AdminFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		response.setContentType("text/html;charset=utf-8");
		HttpServletRequest httpRequest = (HttpServletRequest)request;  
		HttpServletResponse httpResponse = (HttpServletResponse)response; 
		HttpSession session=httpRequest.getSession();
		String user=(String) session.getAttribute("userName");
		if(user!=null){
			chain.doFilter(request, response);
		}else{
			PrintWriter out=httpResponse.getWriter();
			out.print("<script type='text/javascript'>alert('登录后才能进行操作！')</script>");
			httpResponse.setHeader("refresh", "2;URL=login.html");//改变头部跳转
			//带参数的跳转
			out.flush();
			out.close();
			}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
