<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>上传下载</title>
	</head>

	<body>
		<form action="/servlet-demo/upload" method="post" enctype="multipart/form-data">
			账号：<input type="text" name="account" id="account" value="" placeholder="请输入您的账号" />
			<br />
			邮箱：<input type="email" name="email" id="email" value="" placeholder="请输入您的邮箱账号..." />
			<br />
			头像：<input type="file" name="img" id="img" value="" />
			<br />
			<input type="submit" value="提交"/>
		</form>
	</body>

</html>