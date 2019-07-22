package net.seehope.servlet;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

/**
 * 
 * @author lxgy
 * ============
 * 我的第一个Servlet.
 * url:/*
 *
 */
public class MyFirstServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		/*response.getWriter().print("my first servlet~");*/

		ServletContext servletContext = request.getServletContext();
		ServletContext servletContext2 = request.getSession().getServletContext();
		ServletContext servletContext3 = super.getServletContext();
		
		System.out.println(request.getServletContext().getRealPath(""));
		
		System.out.println(servletContext+"," + servletContext2 + "," + servletContext3);

		if (servletContext == servletContext2) {
			System.out.println("1 == 2");
		} else if (servletContext == servletContext3) {
			System.out.println("1==3");
		} else if (servletContext2 == servletContext3) {
			System.out.println("2==3");
		} else {
			System.out.println("不一致");
		}

	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
		String servletName = config.getServletName();
		String encoding = config.getInitParameter("encoding");
		String contentType = config.getInitParameter("contentType");
		Enumeration<String> pnames = config.getInitParameterNames();
		while (pnames.hasMoreElements()) {
			System.out.println(pnames.nextElement());
		}
		System.out.println("init方法....");
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		super.destroy();
	}

}
