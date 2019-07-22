package net.seehope.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.PageContext;

import net.seehope.pojo.User;

@WebServlet("/eldemo")
public class ELDemoServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("1", "1");
		request.removeAttribute("1");
//		request.setAttribute("", response);
	/*	HttpSession session = request.getSession();
		session.setAttribute("msg", "您好，我是session的儿子");
		request.setAttribute("msg", "你好，是我，request的对象值！");
		User user = new User();
		user.setUsername("111");
		user.setPassword("111");
		User user2 = new User();
		user2.setUsername("222");
		user2.setPassword("222");
		List<User> users = new ArrayList<>();
		users.add(user);
		users.add(user2);
		request.setAttribute("users", users);
		request.getRequestDispatcher("/el-demo.jsp").forward(request, response);*/
	}

}
