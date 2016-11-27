<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'register.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="css/reset.css">

    <link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />

</head>

<body>


</head>
<body background=photo/0.jpg>
	 <div class="register-switch">
	<table>
<tr>
			<td><center>您好，欢迎登陆注册页面，请详细填写您的资料。</center></td>
		</tr>
</table>
<form class="register" action=SaveRegister.jsp method="post">
<table>
<tr>
				<td>姓名</td>
				<td><input type="text" size=20 name="username"></td>
			</tr>
<tr>
				<td>密码</td>
				<td><input type="password" size=20 name="password"></td>
			</tr>
<tr>
				<td>性别</td>
				<td><!--  <input type="text" size=20 name="sex">-->
				<input type="radio" name="sex" value="F" id="sex_f" class="register-switch-input" checked>
    			<label for="sex_f" class="register-switch-label">Female</label>
				
				</td>
			</tr>
<tr>
				<td>年龄</td>
				<td><input type="text" size=20 name="age"></td>
			</tr>
<tr>
				<td>生日</td>
				<td><input type="text" size=5 name="year">年</td>
<td><input type="text" size=5 name="month">月</td>
<td><input type="text" size=5 name="day">日</td>
			</tr>
<tr>
				<td>电话</td>
				<td><input type="text" size=20 name="telephone"></td>
			</tr>
<tr>
				<td>邮箱</td>
				<td><input type="text" size=20 name="email"></td>
			</tr>

<tr>
				<td><input  class="register-button" type="submit" name="submit" value="注册"></td>
			</tr>
<tr>
				<td><a href=Login.html>返回前一页</a></td>
			</tr>
</table>
	</form>
	
	</div>
</body>

</html>

