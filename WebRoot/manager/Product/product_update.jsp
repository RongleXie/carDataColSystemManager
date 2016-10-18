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
    
    <title>My JSP 'news_update.jsp' starting page</title>
    
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
<jsp:include page="product!queryOne.action?id=${param.id}"></jsp:include>
<form action="product!update.action" method="post">
<input type="hidden" name="id" value="${param.id}"/>
<div>
<div style="float:left;width:75%;">
<table class="table table-bordered table-hover definewidth m10" style="float:left;">
    <tr>
        <td width="10%" class="tableleft">[更新新闻]</td>
    </tr>
     <tr>
        <td class="tableleft">产品名称</td>
        <td><input type="text" name="product.name" value="${product.name}"/></td>
    </tr>     
    <tr>
        <td class="tableleft">新闻类型</td>
        <td>
								<input type="radio" name="product.prtype" <c:if test="${product.prtype eq '超级酷跑系列'}">checked</c:if>
									value="超级酷跑系列"/>
								超级酷跑系列
								<input type="radio" name="product.prtype"
									<c:if test="${product.prtype eq '经典豪车系列'}"> checked</c:if>
									value="经典豪车系列" />
								经典豪车系列
							</td>
    </tr>
   <tr>
        <td class="tableleft">产品图片</td>
        <td><input type="text" name="product.url" value="${product.url}"/></td>
      
    </tr>
      <tr></tr>
    <tr>
        <td class="tableleft">产品介绍</td>
        <td>
				<textarea name="product.prcontext"
					style="width: 500px; height: 100px; float: left; padding: 3px 0px 0 4px; background-color: #F4F6F7; border: 1px #90A9B7 solid; color: #000; font-family: Arial, Helvetica, sans-serif; font-size: 12px; -moz-border-radius: 4px; -webkit-border-radius: 4px; border-radius: 4px;">${product.prcontext}</textarea>
		</td>
			</tr>    
   
    <tr>
        <td class="tableleft"></td>
        <td>
            <button type="submit" class="btn btn-primary" type="button">保存</button>&nbsp;&nbsp;<button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
        </td>
    </tr>
</table>
</div>
<div style="float:right;width:25%;"><img src="<%=basePath %>${product.url}" style="width:280px;height:350px;"/>
</div>
</div>
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