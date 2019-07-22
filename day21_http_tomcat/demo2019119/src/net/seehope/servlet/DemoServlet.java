package net.seehope.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/demo/*")
//�൱��
//<servlet>
//<servlet-name>demo</servlet-name>
//<servlet-class>net.seehope.servlet.DemoServlet</servlet-class>
//</servlet>
//
//<!-- ·�ɣ� servlet-name��ָ��demoȥ���� url-pattern��uri��ֵ /*:��ʾ�������� *��ʾͨ��� -->
//<servlet-mapping>
//<servlet-name>demo</servlet-name>
//<!-- /demo/regist -->
//<url-pattern>/demo/*</url-pattern>
//</servlet-mapping>

public class DemoServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String encoding;
	private String contentType;

	/**
	 * 1������Servlet�ģ�����
	 *   ���������ַ�ʽ��1����buildpath --> addLibary --> serverruntime --> ѡ����ӷ�����Tomcat��jar��
	 *              2����servlet.jar ���Ƶ�libĿ¼�� -- > ѡ��jar�� ad                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            d build path
	 * 2������src����package��ע�⣺��Ҫʹ��default package��
	 * 3����package����class extends HttpServlet
	 * 4����д��ƥ��Ĺ���
	 */
	// servlet��ʼ������
	// ִֻ��һ��
	// ��servlet��һ�α����õ�ʱ��ִ��
	/*
	 * @Override public void init() throws ServletException { // TODO Auto-generated
	 * method stub System.out.println("��ʼ��...."); }
	 */
	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		encoding = config.getServletContext().getInitParameter("encoding");
		contentType = config.getServletContext().getInitParameter("contentType");
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// ��ȡ����ķ��� ��GET POST PUT...
		// ������Ӧ�����ʽ
		response.setCharacterEncoding(encoding);
		// ����MIME����
		response.setContentType(contentType);
//		String method = request.getMethod().toUpperCase();
//		String contextRoot = request.getContextPath();
		System.out.println(request.getRequestURI());
		String uri = request.getRequestURI();
		String action = uri.substring(uri.lastIndexOf("/") + 1);
		System.out.println(action);
		switch (action) {
		case "login":
			login(request, response);
			break;
		case "resgist":
			regist(request, response);
			break;
		default:

			break;
		}
		// System.out.println(contextRoot);
		// switch (method) {
		// case "GET":
		// my_do_get(request, response);
		// break;
		// default:
		// break;
		// }
	}

	private void regist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().println("ע��ɹ�");
	}

	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String sex = request.getParameter("sex");
		String[] fac = request.getParameterValues("fav");
		String select = request.getParameter("select");
 		System.out.println(username + "," + password + "," + sex + "," + Arrays.toString(fac) + "," + select);
		response.getWriter().println("��¼�ɹ�");
	}

	private void my_do_get(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("�����ҵ�doget");
		System.out.println(request.getMethod());
	}

}
