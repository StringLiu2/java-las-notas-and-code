package net.seehope.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/download")
public class DownloadDemoServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String img = request.getParameter("img");
		System.out.println(img);
		String fileName = super.getServletContext().getRealPath("upload") + File.separator
				+ img.substring(img.lastIndexOf("/") + 1);
		System.out.println(fileName);
		// 设置MIME类型
		response.setContentType(getServletContext().getMimeType(img.substring(img.lastIndexOf("/") + 1)));
		// 设置Context-Disposition
		response.setHeader("Content-Disposition", "attachment;filename=" + img.substring(img.lastIndexOf("/") + 1));
		// 获取文件（输入流）
		InputStream inputStream = new FileInputStream(fileName);
		// 获取输出流对象，将文件输出
		ServletOutputStream servletOutputStream = response.getOutputStream();
		// 设置缓冲区
		int len = -1;
		byte[] b = new byte[1024];
		while ((len = inputStream.read(b)) != -1) {
			servletOutputStream.write(b, 0, len);
		}
		// 关闭输入输出流
		servletOutputStream.close();
		inputStream.close();
	}

}
