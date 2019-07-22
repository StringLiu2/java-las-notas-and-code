<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>我的第一个JSP</title>
	</head>

	<body>
	       你好，现在的北京时间是：<%= new Date() %>
	   <%=session %>
	</body>

</html>