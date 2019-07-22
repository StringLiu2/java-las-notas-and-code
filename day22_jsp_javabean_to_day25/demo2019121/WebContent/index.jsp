<%@page import="net.seehope.pojo.User"%>
<%@page import="java.util.Date,java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%!
   /* 全局变量的声明 */
   int test;
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>我的第一个jsp</title>
	</head>
	<body>
	
	   <%--  <%@include file="/_404.html" %> --%>
	    <jsp:include page="/_500.html"></jsp:include>
	    
	    <br/>
		<%-- 这是jsp的注释 --%>
		<!-- %和= 中间不能有空格 -->
		<%= new Date() %>
		
		${1+1}
		
		<%-- <%
		   int age = 10;
		   /* System.out.print(age/0); */
		   System.out.print("test:" + test);
		   for(int i = 0;i<100;i++){
			   System.out.println(i);
		   }
		%> --%>
		
		
		<%
		    List<User> userss = (List<User>)request.getAttribute("users");
		%>
		
	
		
		<%--  <%
		   for(int i=0;i<userss.size();i++){
			   System.out.println(userss.get(i).getUsername());
		   }
		%>  --%>
		
		<% for(int i=0;i<userss.size();i++){%>
			<%=i %>
		<%}%>
		
	</body>
</html>
