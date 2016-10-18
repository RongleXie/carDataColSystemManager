<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>"/>
    
    <title>My JSP 'message_update.jsp' starting page</title>
    
	<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta charset="UTF-8">
     <link rel="stylesheet" type="text/css" href="<%=basePath%>manager/Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>manager/Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>manager/Css/style.css" />
    <script type="text/javascript" src="<%=basePath%>manager/Js/jquery.js"></script>
    <script type="text/javascript" src="<%=basePath%>manager/Js/jquery.sorted.js"></script>
    <script type="text/javascript" src="<%=basePath%>manager/Js/bootstrap.js"></script>
    <script type="text/javascript" src="<%=basePath%>manager/Js/ckform.js"></script>
    <script type="text/javascript" src="<%=basePath%>manager/Js/common.js"></script> 

    <style type="text/css">
        body {
            padding-bottom: 40px;
        }
        .sidebar-nav {
            padding: 9px 0;
        }

        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }


    </style>
</head>
<body>
<jsp:include page="message!queryOne.action?id=${param.id}"></jsp:include>
<form action="message!update.action" method="post">
<input type="hidden" name="id" value="${param.id}"/>
<table class="table table-bordered table-hover definewidth m10">
    <tr>
        <td width="10%" class="tableleft">[更新留言]</td>
    </tr>
    <tr>
        <td class="tableleft">留言人</td>
        <td><input type="text" name="message.name"  value="${message.name}"/></td>
    </tr>   
    <tr>
        <td class="tableleft">邮箱</td>
        <td><input type="text" name="message.email"  value="${message.email}"/></td>
    </tr>  
    <tr>
        <td class="tableleft">电话</td>
        <td><input type="text" name="message.tel"  value="${message.tel}"/></td>
    </tr>   
    <tr>
        <td class="tableleft">内容</td>
        <td>
				<textarea name="message.content"
					style="width: 500px; height: 100px; float: left; padding: 3px 0px 0 4px; background-color: #F4F6F7; border: 1px #90A9B7 solid; color: #000; font-family: Arial, Helvetica, sans-serif; font-size: 12px; -moz-border-radius: 4px; -webkit-border-radius: 4px; border-radius: 4px;">${message.content}</textarea>
		</td>
			</tr>   
   
    <tr>
        <td class="tableleft"></td>
        <td>
            <button type="submit" class="btn btn-primary" type="button">保存</button>&nbsp;&nbsp;<button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
        </td>
    </tr>
</table>
</form>
</body>
</html>
<script>
    $(function () {       
		$('#backid').click(function(){
				window.location.href="javascript:history.go(-1);location.reload()";
		 });

    });
</script>