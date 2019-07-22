package net.seehope.servlet;

import java.util.UUID;

public class DemoServlet {

	public static void main(String[] args) {
		// uuid 36位字符随机数
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid);
		System.out.println(uuid.toString().replaceAll("-", ""));
	}

}
