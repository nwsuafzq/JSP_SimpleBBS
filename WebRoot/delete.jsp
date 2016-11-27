<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'Delete.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="buttons.css">
	

</head>


<body background=photo/100.jpg>
	<%
Statement sql;
Connection con;
ResultSet rs;
   try{
       Class.forName("com.mysql.jdbc.Driver");
       }
       catch(Exception e){
    	   out.print("驱动失败");
       };
       
       
    	try{ 
    		String database="test";
      String uri="jdbc:mysql://localhost:3306/"+database+"?useUnicode=true&characterEncoding=UTF-8"; 
          
    	   con = DriverManager.getConnection(uri,"root","");
    	   int id = Integer.parseInt(request.getParameter("id"));//获得主贴id
    	   int replyid = Integer.parseInt(request.getParameter("replyid"));//删除主贴还是回复贴
    	   if(replyid>0){
    	   if (session.getAttribute("username").equals("admin")) {
           String updatecondition = "update reply set content='此回复已被删除！'"
     				+ "  where reply=" + id + " and id =" + replyid;//删除回复贴
                sql=con.createStatement();
     			sql.executeUpdate(updatecondition);
                out.print("帖子已经删除");
	    response.sendRedirect("Detail.jsp?id=" + id);
    	   }
    	   else
    		   out.print("<h4>"+"你是非管理员，所以，没有权利删除帖子"+id);%>
    		   <%System.out.println(id+" 我要看看.."); %>
	<a class="button button-large button-plain button-border button-circle" href=Detail.jsp?id=<%=id%>>返回</a>
	<% 
    	   }
       
	    else
       {//否则，当replyid=0时表示
 
	if (session.getValue("username").equals("admin")) 
	{		
	String	condition3 = "delete from discuss where id=" + id;
	  sql=con.createStatement();
		sql.executeUpdate(condition3);
		String condition2= "delete from reply where reply=" + id;
		sql=con.createStatement();
		sql.executeUpdate(condition2);
		String condition4 = "alter table discuss drop id ";
		sql= con.createStatement();
			sql.executeUpdate(condition4);	
			String condition5 = "alter table discuss add id int not null auto_increment primary key";
			sql= con.createStatement();
			sql.executeUpdate(condition5);
	  response.sendRedirect("discuss.jsp");
	}
	else
		out.print("你还不是管理员，所以你没有权删除帖子");
	 out.print("<a href=discuss.jsp>返回</a>");
    	}
    	}
    	catch(Exception e){
    		out.print("删除主贴失败");
    	}
    	   %>

</body>
</html>
