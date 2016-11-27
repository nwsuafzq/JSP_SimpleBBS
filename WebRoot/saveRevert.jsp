<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.GregorianCalendar"%>
<%@ page import="java.sql.*"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'SaveRevert.jsp' starting page</title>

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
	//int id=Integer.parseInt(request.getParameter("id"));
   try{
       Class.forName("com.mysql.jdbc.Driver");
       }
       catch(Exception e){
    	   out.print(e);
       };
       
    	try{ 
    		String database="test";
      String uri="jdbc:mysql://localhost:3306/"+database+"?useUnicode=true&amp;characterEncoding=UTF-8"; 
          
    	   con = DriverManager.getConnection(uri,"root","");
    String reply = request.getParameter("id");
    String name = (session.getAttribute("username")).toString();
    String content = request.getParameter("content");
    int year, month, day, hour, minute, second;
     String time;
     GregorianCalendar calendar;
    calendar = new GregorianCalendar();
    year = calendar.get(Calendar.YEAR);
    month = calendar.get(Calendar.MONTH) + 1;
    day = calendar.get(Calendar.DAY_OF_MONTH);
    hour = calendar.get(Calendar.HOUR_OF_DAY);
    minute = calendar.get(Calendar.MINUTE);
    second = calendar.get(Calendar.SECOND);
    time = year + "-" + month + "-" + day + " " + hour + ":" + minute+ ":" + second;
    //byte[] bb=content.getBytes("iso-8859-1");
    //content=new String(bb);
    //content = new String(content.getBytes("iso-8859-1"),"GBK");
    String updateCondition = "insert into reply ( name, content, time, reply )values('"+ name+ "','"+ 
    		content+ "','"+ time+ "','"	+ reply+"')";
     sql=con.createStatement();
    out.print(updateCondition);
     sql.executeUpdate(updateCondition);
     out.print("内部失败??");
     response.sendRedirect("Detail.jsp?id=" + reply);
       }
       catch (Exception e){
    	   out.print("更新回复失败what?");
    	   e.printStackTrace();
       }
       %>
</body>
</html>
