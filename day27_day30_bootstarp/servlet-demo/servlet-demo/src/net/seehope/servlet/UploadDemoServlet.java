package net.seehope.servlet;

import java.io.File;
import java.io.IOException;

import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import net.seehope.pojo.User;

@WebServlet("/upload")
public class UploadDemoServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	/**
	 * 1、选择要上传文件
	 * 2、将文件转换成二进制流
	 * 3、在服务器读取流
	 * 4、将流写进磁盘
	 * 5、回馈信息
	 */

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = new User();
		// TODO Auto-generated method stub
		// 检查request请求是否是multipart/form-data请求
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		// 如果不是该类型请求，结束
		if (!isMultipart) {
			return;
		}
		try {
			// 创建FileItemFactory容器-->创建FileItem对象使用
			FileItemFactory factory = new DiskFileItemFactory();
			// 创建文件上传处理器
			ServletFileUpload upload = new ServletFileUpload(factory);
			// 解析request请求，将表单信息转换为一FileItem对象
			List<FileItem> items = upload.parseRequest(request);
			System.out.println(items);
			if (items != null) {
				for (FileItem fileItem : items) {
					// 获取每个字段名称
					String fieldName = fileItem.getFieldName();
					// 判断该字段是否是普通的form表单字段
					if (fileItem.isFormField()) {
						String value = fileItem.getString("UTF-8");
						if(fieldName.equals("account")) {
							user.setUsername(value);
						}else if(fieldName.contentEquals("email")) {
							user.setPassword(value);
						}
						System.out.println(fieldName + ":" + value);
					} else {
						// 获取文件名称
						String fileName = fileItem.getName();
						String dir = super.getServletContext().getRealPath("/upload");
						System.out.println(dir);
						File file = new File(dir);
						if (!file.exists()) {
							file.mkdir();
						}
						String realFileName = UUID.randomUUID().toString()
								+ fileName.substring(fileName.lastIndexOf("."));
						// 将文件写进磁盘，注意：写进磁盘的文件名称一般都需要重命名，防止用户上传同名称的文件
						fileItem.write(new File(dir + File.separator + realFileName));
						System.out.println(super.getServletContext().getContextPath() + "/upload/" + realFileName);
						request.setAttribute("imgSrc",
								super.getServletContext().getContextPath() + "/upload/" + realFileName);
						user.setPhoto_src(super.getServletContext().getContextPath() + "/upload/" + realFileName);
					}
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		System.out.println(user);
		request.getRequestDispatcher("/success.jsp").forward(request, response);
	}

}
