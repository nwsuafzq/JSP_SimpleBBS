<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'NewTitle.jsp' starting page</title>

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
	font-family: verdana, arial, sans-serif;
	font-size: 11px;
	color: #333333;
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

.oddrowcolor {
	background-color: #d4e3e5;
}

.evenrowcolor {
	background-color: #c3dde0;
}
</style>

</head>



<body bgcolor="#AEEEEE">
	<form action=SaveNewsTitle.jsp?pageNO=1 method=post
		onsubmit="return checkForm(this);">
		<table border=3 class="altrowstable" id="alternatecolor">
			<tr>
				<td>姓名</td>
				<td><input type="text" size=60 name=name></td>
			</tr>
			<tr>
				<td>E-mail</td>
				<td><input type=text size=60 name=email></td>
			</tr>
			<tr>
				<td><pre>主题</td>
				<td><input type=text size=60 name=subject></td>
			</tr>
			<tr valign=top>
				<td><pre>内容</td>
				<td><textarea rows=10 cols=60 name=content></textarea></td>
			</tr>
			<tr align=center>
				<td colspan=2><input type=submit value=发送新主题 name=send
					class="btn-style-01"> <input type=reset value="重置"
					class="btn-style-01"></td>
			</tr>
		</table>
		<hr>
		<a href=discuss.jsp?pageNO=1 class="button button-3d button-royal">返回主题页</a>
	</form>

</body>
</html>
