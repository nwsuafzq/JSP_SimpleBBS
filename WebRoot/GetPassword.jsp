<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>找回密码</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/submit.css">
	
<script type="text/javascript">
function altRows(id){
	if(document.getElementsByTagName){  
		
		var table = document.getElementById(id);  
		var rows = table.getElementsByTagName("tr"); 
		 
		for(i = 0; i < rows.length; i++){          
			if(i % 2 == 0){
				rows[i].className = "evenrowcolor";
			}else{
				rows[i].className = "oddrowcolor";
			}      
		}
	}
}

window.onload=function(){
	altRows('alternatecolor');
}
</script>


<!-- CSS goes in the document HEAD or added to your external stylesheet -->
<style type="text/css">
table.altrowstable {
	font-family: verdana,arial,sans-serif;
	font-size:11px;
	color:#333333;
	border-width: 1px;
	border-color: #a9c6c9;
	border-collapse: collapse;
}
table.altrowstable th {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #a9c6c9;
}
table.altrowstable td {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #a9c6c9;
}
.oddrowcolor{
	background-color:#d4e3e5;
}
.evenrowcolor{
	background-color:#c3dde0;
}
</style>
  </head>
  
    <img src="images/logo/wx.png" style="height: 82px; width: 87px">
<body bgcolor="#BBFFFF" >
<p><center><h5>填写以下资料，找回您的密码</h5></center>
<form action="" name="getpassword">
<table border=0 class="altrowstable" id="alternatecolor" align="center">
<tr><td>姓名:</td><td><input type="text" name="username"></td></tr>
<tr><td>性别:</td><td><input type="text" name="sex"></td></tr>
<tr><td>邮箱:</td><td><input type="text" name="email"></td></tr>
<tr ><td colspan=2 align="center"><input type="submit" name="submit" value="提交" class="btn-style-01"></td></tr>

<%
Statement sql;
Connection con;
ResultSet rs;
   try{
       Class.forName("com.mysql.jdbc.Driver");
       }
       catch(Exception e){
    	   out.print("123");
       };
       
       
    	try{ 
    		String database="test";
      String uri="jdbc:mysql://localhost:3306/"+database; 
          
    	   con = DriverManager.getConnection(uri,"root","");
    	if (request.getParameter("username") != null//username用户名
            && request.getParameter("sex") != null//sex性别
         	&& request.getParameter("email") != null) {//email电子邮箱
    	String username = request.getParameter("username");
    	String sex = request.getParameter("sex");
    	String email = request.getParameter("email");
     	String condition = "select * from student where username='" + username+ 
     			"' and sex='" + sex + "' and email='" + email + "'";
     	sql=con.createStatement();
		rs = sql.executeQuery(condition);//从数据库中查找对应信息
		if (rs.next()) {//如果找到
			String password = rs.getString(3);
			String errmsg = "正确的填写信息,你的密码为：";
		out.println("<center><font color=green size=5>提示信息：<hr></font><font color=red size=4>"
							+ errmsg + password + "</font><hr>");
			out.println("<input type=button value=回上一页  onclick=history.back();>");
		} else {
		String errmsg = "对不起，您不能取回你的密码，原因是你没能正确的填写信息！";
		out.println("<center><font color=green size=5>提示信息：<hr></font><font color=red size=4>"
							+ errmsg + "</font><hr>");
			out.println("<input type=button value=回上一页  onclick=history.back();>");
		}
	}
    	}
    	catch(Exception e){
    		 out.print("系统的错误");
    	}
%>
  </body>
</html>
