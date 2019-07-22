<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="net.seehope.pojo.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>el表达式</title>
	</head>

	<body>
		<%=pageContext.findAttribute("msg") != null ? pageContext.findAttribute("msg") : ""%>
		<!--  等价于下面的EL表达式语句 -->
		${msg }

		<table border="1" cellspacing="" cellpadding="">
			<tr>
				<th>姓名</th>
				<th>密码</th>
			</tr>
			<%
			List<User> users = (List<User>) request.getAttribute("users");
			for (User user : users) {
		%>
			<tr>
				<td>
					<%=user.getUsername()%>
				</td>
				<td>
					<%=user.getPassword()%>
				</td>
			</tr>
			<%
			}
		%>

			<!-- 使用jstl表达式 -->
			<c:forEach items="${users }" var="user">
				<tr>
					<td>${user.username }</td>
					<td>${user.password }</td>
				</tr>
			</c:forEach>
		</table>
	</body>

</html>