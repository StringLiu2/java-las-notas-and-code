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
//相当于
//<servlet>
//<servlet-name>demo</servlet-name>
//<servlet-class>net.seehope.servlet.DemoServlet</servlet-class>
//</servlet>
//
//<!-- 路由： servlet-name：指定demo去处理 url-pattern：uri的值 /*:表示所有请求 *表示通配符 -->
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
	 * 1、创建Servlet的，导包
	 *   导包的两种方式：1、在buildpath --> addLibary --> serverruntime --> 选择添加服务器Tomcat的jar包
	 *              2、将servlet.jar 复制到lib目录下 -- > 选中jar包 ad                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            d build path
	 * 2、先在src创建package（注意：不要使用default package）
	 * 3、在package创建class extends HttpServlet
	 * 4、填写好匹配的规则
	 */
	// servlet初始化方法
	// 只执行一次
	// 当servlet第一次被调用的时候执行
	/*
	 * @Override public void init() throws ServletException { // TODO Auto-generated
	 * method stub System.out.println("初始化...."); }
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
		// 获取请求的方法 ：GET POST PUT...
		// 设置相应编码格式
		response.setCharacterEncoding(encoding);
		// 设置MIME类型
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
		response.getWriter().println("注册成功");
	}

	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String sex = request.getParameter("sex");
		String[] fac = request.getParameterValues("fav");
		String select = request.getParameter("select");
 		System.out.println(username + "," + password + "," + sex + "," + Arrays.toString(fac) + "," + select);
		response.getWriter().println("登录成功");
	}

	private void my_do_get(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("这是我的doget");
		System.out.println(request.getMethod());
	}

}
