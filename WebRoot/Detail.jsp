<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="javax.xml.soap.Detail"%>
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

<title>查看帖子</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="css/submit.css">
	<link rel="stylesheet" type="text/css" href="css/buttons.css">
	
<!-- Javascript goes in the document HEAD -->
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

<body bgcolor="#D1EEEE">

	<%
	Statement sql;
	Connection con;
	ResultSet rs;
	ResultSet rs2; 
	int id=Integer.parseInt(request.getParameter("id")); 
   try{
       Class.forName("com.mysql.jdbc.Driver");
       }
       catch(Exception e){
    	   out.print("加载驱动错误");
       };
       
    	try{ 
    		
    		int replyid=0;
    		String database="test";
      String uri="jdbc:mysql://localhost:3306/"+database+"?useUnicode=true&amp;characterEncoding=UTF-8"; 
          
    	   con = DriverManager.getConnection(uri,"root","");
    	   String condition="select * from discuss where id = '"+ id +"'";
    	   
    	/*   StringBuffer result=null; */
    	   sql=con.createStatement();
    	   rs=sql.executeQuery(condition);
    	
    	   while(rs.next())
    	   { out.println("这是帖子的详细内容:\n");
    	     out.print("</br>");
    	   
    	  /*  out.print("<table>");
    	   out.print("<tr>"); */
    	   out.print(rs.getString(4)); 
    	 /*   out.print("</tr>");
    	   out.print("</table>"); */
    	/*    out.print(result); */
    	   }
    	   out.print("<tr>");
    	   out.print("<hr>");
    	   out.print("</tr>");
  
  
  			String condition2="select * from reply where reply = '"+ id +"'"; 
    		rs2=sql.executeQuery(condition2); 
    	    while(rs2.next())
    	   {   out.print("<table>");
    	       out.print("<tr>");
    	       out.print("<td>用户" + rs2.getString(1) + "的回复内容是：</td>");
    	       out.print("<td>" + rs2.getString(2) + "</td>");
    	       out.print("</tr>");
    	       out.print("<tr>");
    	       out.print("<td>回复的时间是:" + rs2.getString(3) + "</td>");
    	       out.print("</tr>");
    	       out.print("</table>");
    	   int reply=Integer.parseInt(rs2.getString(5));//提取回复贴的id；
    	   out.print("<a href=delete.jsp?id="+id+
        		   "&replyid="+reply+">删除回复<img src=images/delete2.png width=20 height=20></a>");
    	   
    	   } 
    	}
    	catch(Exception e){
    		out.print("error啊");
    		e.printStackTrace();
    	}
%>
<%//System.out.println(id+" 我要看看！"); %>

	<form name=form2 action=saveRevert.jsp?id=<%=id%> method="post"
		onsubmit="return checkForm(this);">
		<table border=1 class="altrowstable" id="alternatecolor">

			<tr>
				<td>输入你要回复的内容</td>
				<td><textarea rows=15 cols=90 name=content></textarea></td>
			</tr>
			<tr align=center>
				<td colspan=2>
				<input type=submit value=确认回复 name=send class="btn-style-01">
					<input type=reset value=清除重写 class="btn-style-01">
					
					</td>
					</tr>
					<tr><td colspan=2>   <a href="discuss.jsp" class="button button-glow button-rounded button-raised button-primary">返回帖子页面</a></td></tr>
					
					</table>
					</form>
					
					
</body>
</html>
