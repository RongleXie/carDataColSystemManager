<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Welcome</title>
    
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
	String code = request.getParameter("code");  
	if(code == "1"||code.equals("1")){%>
		</br>
		</br>
		</br>
		</br>
		</br>
		</br>
		</br>
		  <h1 align="center">登录成功!</h1>
	<% }else if(code == "0"||code.equals("0")){%>
	<script language="JavaScript">
	window.location.href = "404.action?code="+<%=code%>;
	</script>
	<%}else if(code == "4"||code.equals("4")){%>
		 <script language="JavaScript">
		 window.location.href = "404.action?code="+<%=code%>;
		 </script>
	<%}
   %>
  
  </body>
</html>
