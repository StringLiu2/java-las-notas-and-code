package net.seehope.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.seehope.pojo.User;

public class DemoServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("ss");
		List<User> users = new ArrayList<User>();
		for (int i = 0; i < 20; i++) {
			User user = new User();
			user.setUsername("username" + i);
			user.setPassword("password" + i);
			users.add(user);
		}
		req.setAttribute("users", users);
		// ת��
		req.getRequestDispatcher("/index.jsp").forward(req, resp);
		// �ض���
		// resp.sendRedirect("http://www.baidu.com");
		// ����
		// ת��������request �� response
		// url��ַ�����ᷢ���ı�
		// �ض��򣺲�����request �� response
		// url��ַ�������ı�

		//

	}

}
