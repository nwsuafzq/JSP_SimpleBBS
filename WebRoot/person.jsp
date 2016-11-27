<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>个人信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/buttons.css">
	
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
  
  <body>
    <%
    	String username = request.getParameter("username");
		String password = request.getParameter("password");
		String ip = request.getParameter("userIP");
		 %>
		 
		<form action="MainForm.jsp" method="post">
    <table class="altrowstable" id="alternatecolor" width="400" height="300" align="center" border="1">
    <tr>
    
    <td>头像：</td>
    <td style="width: 76px; ">用户名：</td>
    <td><input type="text" name="bid" value="${username}">
    </td>
    <tr>
    <td rowspan=3><img src="images/touxiang.png" height=100 width=60 style="height: 144px; width: 88px"></td>
    <td>密码:</td>
    <td><input type="text" name="name" value="${password}">
    </td>
    <tr>
    <td>你的ip:</td>
    <td><input type="text" name="authors" value="${userIP}">
    </td>
    </tr>
    <tr>
    <td colspan="2" align="center"><button class="button button-3d button-action button-pill" id="feedback" onclick="window.location.href='MainForm.jsp'" style=margin-right:30px;>返回</button> </td>
    </tr>
    </table>
    
    </form>
  </body>
</html>
