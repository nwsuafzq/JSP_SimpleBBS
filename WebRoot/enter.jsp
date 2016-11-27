<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<body bgcolor=yellow>
<%
   try{out.print("系统错误0");
	    Class.forName("com.mysql.jdbc.Driver");
   }
   catch(Exception e){ out.print("系统错误1");}//数据库的驱
   Connection con;
   ResultSet rs;
    String sql;
   String username=request.getParameter("username");
   String password=request.getParameter("password");
	try{ 
		String database="test";
        String uri="jdbc:mysql://localhost:3306/"+database+"?useUnicode=true&characterEncoding=UTF-8"; 
	   con=DriverManager.getConnection(uri,"root","");//连接到数据库
	PreparedStatement pstmt = null;// 数据库表达式
    sql = "select * from Student where username = ? and password= ?";// SQL语句
    pstmt = con.prepareStatement(sql);
     pstmt.setString(1, username);//1代表上面的第一个问号。
	pstmt.setString(2, password);
    rs = pstmt.executeQuery();
	   if(rs.next())
	   {
		   request.getSession(true);//创建一个session
		   session.setAttribute("username",username);
		   session.setAttribute("password",password);
		   session.setAttribute("userIP",request.getRemoteAddr());//获取用户的ip地址	  
		   
		   session.setAttribute("enter","true") ;
		   response.sendRedirect("MainForm.jsp");//登录成功
	   }else{
		   response.sendRedirect("Login.html");//登录失败 返回！
		   }
		   }
		   catch(Exception e){
			   out.print("系统错误");
		   }%>
        </body>
</html>
