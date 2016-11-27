<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="javax.xml.soap.Detail"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
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

<title>主界面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="css/buttons.css">
	

</head>

<body background="images/3haolou.jpg" style="background-size:cover;">

	<%
		try {

			//out.print("系统错误01");

			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			out.print("系统错误1");
		}//数据库的驱
		Connection con;
		ResultSet rs;
		String sql;
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		try {
			String database = "test";
			String uri = "jdbc:mysql://localhost:3306/" + database
					+ "?useUnicode=true&characterEncoding=UTF-8";
			con = DriverManager.getConnection(uri, "root", "");//连接到数据库
			PreparedStatement pstmt = null;// 数据库表达式
			sql = "select * from Student where username = ? and password= ?";// SQL语句
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, username);//1代表上面的第一个问号。
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				request.getSession(true);//创建一个session
				session.setAttribute("username", username);
				session.setAttribute("password", password);
				session.setAttribute("userIP", request.getRemoteAddr());//获取用户的ip地址	  

				session.setAttribute("enter", "true");
				//response.sendRedirect("discuss.jsp");//登录成功
			}
		} catch (Exception e) {
			out.print("系统错误");
		}
	%>
	<%

		//out.print("<a href=discuss.jsp>浏览帖子</a> <br>");
		//out.print(" <a href=#>联系管理员</a>");


	%> 
	<div style="border:0px solid red;width:1000px;height:380px;position:absolute;left:50%;margin-left:-250px;top:50%;margin-top:-190px;">
<button class="button button-3d button-action button-pill" id="feedback" onclick="window.location.href='discuss.jsp'" style=margin-right:30px;>浏览帖子</button> 
<button class="button button-3d button-action button-pill" id="" onclick="window.location.href='http://wpa.qq.com/msgrd?v=1&uin=804194244&site=qq&menu=yes'" style=margin-right:30px;>联系管理员</button>
 <button class="button button-3d button-action button-pill" id="feedback" onclick="window.location.href='person.jsp'" style=margin-right:30px;>查看个人信息</button> 
<a href="index.html" class="button button-3d button-royal">返回登陆界面</a>
</div>
</body>
</html>
