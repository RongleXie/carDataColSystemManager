<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>"/>
    
    <title>My JSP 'cardata_add.jsp' starting page</title>
    
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
<form action="cardata!add.action" method="post">
<input type="hidden" name="method" value="add"/>
<table class="table table-bordered table-hover definewidth m10">
    <tr>
        <td width="10%" class="tableleft">[新增新闻]</td>
    </tr>
        <tr>
        <td class="tableleft">用户</td>
        <td><input type="text" name="cardata.userEmail"  value="${cardata.userEmail}"/></td>
    </tr>   
    <tr>
        <td class="tableleft">速度</td>
         <td><input type="text" name="cardata.cardataSpeed" value="${cardata.cardataSpeed}"/></td>
    </tr>
     <tr>
        <td class="tableleft">加速度</td>
         <td><input type="text" name="cardata.cardataAcceleration" value="${cardata.cardataAcceleration}"/></td>
    </tr>
     <tr>
        <td class="tableleft">经度</td>
         <td><input type="text" name="cardata.cardataLongitude" value="${cardata.cardataLongitude}"/></td>
    </tr>
     <tr>
        <td class="tableleft">纬度</td>
         <td><input type="text" name="cardata.cardataLatitude" value="${cardata.cardataLatitude}"/></td>
    </tr>
     <tr>
        <td class="tableleft">海拔</td>
         <td><input type="text" name="cardata.cardataAltitude" value="${cardata.cardataAltitude}"/></td>
    </tr>
     <tr>
        <td class="tableleft">坡度</td>
         <td><input type="text" name="cardata.cardataSlope" value="${cardata.cardataSlope}"/></td>
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