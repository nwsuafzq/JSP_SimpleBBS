<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.GregorianCalendar"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'SaveNewTitle.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>


<%
Statement sql;
Connection con;
ResultSet rs;
   try{
       Class.forName("com.mysql.jdbc.Driver");
       }
       catch(Exception e){
    	   out.print(e);
       };
       
    	try{ 
    		String database="test";
      String uri="jdbc:mysql://localhost:3306/"+database+"?useUnicode=true&characterEncoding=UTF-8"; 
    	  con = DriverManager.getConnection(uri,"root","");
    	  
   String name=request.getParameter("name");
   String email=request.getParameter("email");
   String subject = request.getParameter("subject");
   String content = request.getParameter("content");
   int year,month,day,hour,minute,second;
   String time;
   GregorianCalendar calendar;
   calendar=new GregorianCalendar();
   year=calendar.get(Calendar.YEAR);
   month=calendar.get(Calendar.MONTH)+1;
   day=calendar.get(Calendar.DAY_OF_MONTH);
   hour=calendar.get(Calendar.HOUR_OF_DAY);
   minute=calendar.get(Calendar.MINUTE);
   second=calendar.get(Calendar.SECOND);
   time = year + "年" + month + "月" + day + "日" + hour + ":" + minute
			+ ":" + second;
   //byte[] bb=content.getBytes("iso-8859-1");
  // content=new String(bb);
 //  byte[] cc=subject.getBytes("iso-8859-1");
  // subject=new String(cc);
   String username = session.getAttribute("username").toString();
   String updateCondition1="insert into discuss ( name, email, subject, content, time, username) values( '"+ name+  
		   "','"+ email	+ "','"	+ subject+ "','"+ content+ "','"+ time + "','" + username + "')";
   sql=con.createStatement();

   sql.executeUpdate(updateCondition1);
   
   out.print("更新成功");

        response.sendRedirect("discuss.jsp");}
        catch(SQLException e){out.print("更新失败");
        e.printStackTrace();}
        %>
  </body>
</html>
