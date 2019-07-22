package net.seehope.servlet;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.mail.util.MailSSLSocketFactory;

/**
 * servlet发送邮件实例.
 * =============
 * @author lxgy
 *
 */
@WebServlet("/mail")
public class MailServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			Properties props = new Properties();

			// 开启debug调试
			props.setProperty("mail.debug", "true");
			// 发送服务器需要身份验证
			props.setProperty("mail.smtp.auth", "true");
			// 设置邮件服务器主机名
			props.setProperty("mail.host", "smtp.163.com");
			// props.setProperty("mail.port", "465");
			// 发送邮件协议名称
			props.setProperty("mail.transport.protocol", "smtp");

			MailSSLSocketFactory sf = new MailSSLSocketFactory();
			sf.setTrustAllHosts(true);
			props.put("mail.smtp.ssl.enable", "true");
			props.put("mail.smtp.ssl.socketFactory", sf);

			Session session = Session.getInstance(props);

			Message msg = new MimeMessage(session);
			msg.setSubject("码云社激活验证");
			StringBuilder builder = new StringBuilder();
			builder.append("\nlxgy账号激活");
			builder.append("\nlxgy提醒您：点击下链接即可激活账号使用");
			builder.append("url=" + "http://127.0.0.1:8080/servlet-demo/regist.html");
			builder.append("\n时间 " + new Date());
			msg.setText(builder.toString());
			msg.setFrom(new InternetAddress("a44098215360@163.com"));
			Transport transport = session.getTransport();
			transport.connect("smtp.163.com", "a44098215360@163.com", "lai0736207933...");
			transport.sendMessage(msg, new Address[] { new InternetAddress("1058378595@qq.com") });
			transport.close();
		} catch (GeneralSecurityException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		response.getWriter().print("success");
	}

}
