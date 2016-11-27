<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

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

<title>My JSP 'SaveRegister.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>


<%
	Statement sql;
	Connection con;
	ResultSet rs;
	try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch (Exception e) {
		out.print("123");
	}
	/* 
	public String handleString(String s){
	   try{byte bb[] = s.getBytes("iso-8859-1");
	   s=new String(bb);
	   }
	   catch(Exception ee){
		   return s;
	   } */

	try {
		String database = "test";
		String uri = "jdbc:mysql://localhost:3306/" + database+"?useUnicode=true&characterEncoding=UTF-8";

		con = DriverManager.getConnection(uri, "root", "");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String sex = request.getParameter("sex");
		String age = request.getParameter("age");
		String telephone = request.getParameter("telephone");
		String email = request.getParameter("email");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String year = request.getParameter("year");

		String msg = null;
		sql = con.createStatement();
		rs = sql.executeQuery("select * from student where username='"
				+ username + "'"); //查询数据库
		if (!rs.next()) {//如果不存在
			String birth;
			birth = year + "年" + month + "月" + day + "日";
			/*  byte[] bb=username.getBytes("iso-8859-1");
			   username=new String(bb); 
			byte[] b=sex.getBytes("iso-8859-1");
			   sex=new String(b);  */
			String updateCondition = "insert into student ( username, password, sex, birth, age, telephone , email )values('"
					+ username
					+ "','"
					+ password
					+ "','"
					+ sex
					+ "','"
					+ birth
					+ "','"
					+ age
					+ "','"
					+ telephone
					+ "','"
					+ email + "')";

			sql = con.createStatement();
			sql.executeUpdate(updateCondition); //插入数据库中

			msg = "恭喜你，已注册成功！";
			out.println("<center><font color=green size=5>提示信息：<hr></font><font color=red size=4>"
					+ msg + "</font><hr>");
			response.sendRedirect("index.html");
		} else {//如果注册用户已存在
			msg = "你所注册的用户已经存在，请你重新注册！";
			out.println("<center><font color=green size=5>提示信息：<hr></font><font color=red size=4>"
					+ msg + "</font><hr>");
			out.println("<input type=button value=回上一页  onclick=history.back();>");
		}
	} catch (Exception e) {
		out.println("系统错误");
	}
	;
%>

</body>
</html>
