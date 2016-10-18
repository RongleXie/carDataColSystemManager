<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>"/>
    
    <title>查寻产品列表</title>
    
	 <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>manager/Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>manager/Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>manager/Css/style.css" />
    <script type="text/javascript" src="<%=basePath%>manager/Js/jquery.js"></script>
    <script type="text/javascript" src="<%=basePath%>manager/Js/jquery.sorted.js"></script>
    <script type="text/javascript" src="<%=basePath%>manager/Js/bootstrap.js"></script>
    <script type="text/javascript" src="<%=basePath%>manager/Js/ckform.js"></script>
    <script type="text/javascript" src="<%=basePath%>manager/Js/common.js"></script>
     <link href="<%=basePath%>manager/main/bootstrap.min.css" rel="stylesheet">
	<script src="<%=basePath%>manager/main/jquery.min.js"></script>
    <script src="<%=basePath%>manager/main/bootstrap.min.js"></script>
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
        #main-nav {
            margin-left: 1px;
        }

            #main-nav.nav-tabs.nav-stacked > li > a {
                padding: 10px 8px;
                font-size: 12px;
                font-weight: 600;
                color: #4A515B;
                background: #E9E9E9;
                background: -moz-linear-gradient(top, #FAFAFA 0%, #E9E9E9 100%);
                background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#FAFAFA), color-stop(100%,#E9E9E9));
                background: -webkit-linear-gradient(top, #FAFAFA 0%,#E9E9E9 100%);
                background: -o-linear-gradient(top, #FAFAFA 0%,#E9E9E9 100%);
                background: -ms-linear-gradient(top, #FAFAFA 0%,#E9E9E9 100%);
                background: linear-gradient(top, #FAFAFA 0%,#E9E9E9 100%);
                filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#FAFAFA', endColorstr='#E9E9E9');
                -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr='#FAFAFA', endColorstr='#E9E9E9')";
                border: 1px solid #D5D5D5;
                border-radius: 4px;
            }

                #main-nav.nav-tabs.nav-stacked > li > a > span {
                    color: #4A515B;
                }

                #main-nav.nav-tabs.nav-stacked > li.active > a, #main-nav.nav-tabs.nav-stacked > li > a:hover {
                    color: #FFF;
                    background: #3C4049;
                    background: -moz-linear-gradient(top, #4A515B 0%, #3C4049 100%);
                    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#4A515B), color-stop(100%,#3C4049));
                    background: -webkit-linear-gradient(top, #4A515B 0%,#3C4049 100%);
                    background: -o-linear-gradient(top, #4A515B 0%,#3C4049 100%);
                    background: -ms-linear-gradient(top, #4A515B 0%,#3C4049 100%);
                    background: linear-gradient(top, #4A515B 0%,#3C4049 100%);
                    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#4A515B', endColorstr='#3C4049');
                    -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr='#4A515B', endColorstr='#3C4049')";
                    border-color: #2B2E33;
                }

                    #main-nav.nav-tabs.nav-stacked > li.active > a, #main-nav.nav-tabs.nav-stacked > li > a:hover > span {
                        color: #FFF;
                    }

            #main-nav.nav-tabs.nav-stacked > li {
                margin-bottom: 4px;
            }

        /*定义二级菜单样式*/
        .secondmenu a {
            font-size: 10px;
            color: #4A515B;
            text-align: center;
        }

        .navbar-static-top {
            background-color: #212121;
            margin-bottom: 5px;
        }

        .navbar-brand {
            background: url('') no-repeat 10px 8px;
            display: inline-block;
            vertical-align: middle;
            padding-left: 50px;
            color: #fff;
        }
    </style>
		<script type="text/javascript">
	function del() {
		if (!confirm("确认要删除？")) {
			window.event.returnValue = false;
		}
	}
	/**	<script type="text/javascript">
		$(document).ready(function(){
			$("#id").click(function(){
				var str=window.location.href.split("?");
				if(str[1]==undefined){
					str=str+"?pager.offset=0&tag=list";
				}
				else{
					str=str[0]+"?"+str[1]+"&sort=userid";
				}
				$(this).attr("href",str);
				
			})
		})
		**/
	</script>
	
</script>
	</head>
<body>
<div class="navbar navbar-duomi navbar-static-top" role="navigation"  style="height:80px;">
        <div class="container-fluid">
            <div class="navbar-header">
            <br>
                <a class="navbar-brand" href="<%=basePath%>manager/index.jsp" id="logo">酷跑汽车后台管理系统
                </a>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-2">
                <ul id="main-nav" class="nav nav-tabs nav-stacked" style="">
                    <li class="active">
                        <a href="<%=basePath %>manager/index.jsp">
                            <i class="glyphicon glyphicon-th-large"></i> 
                            首页 		
                        </a>
                    </li>
                    <li>
                        <a href="#systemSetting" class="nav-header collapsed" data-toggle="collapse">
                            <i class="glyphicon glyphicon-cog"></i>
                            系统管理
                               <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                        </a>
                        <ul id="systemSetting" class="nav nav-list collapse secondmenu" style="height: 0px;">
                         <li><a href="user!adminQueryPage.action"><i class="glyphicon glyphicon-user"></i>用户管理</a></li>
                            <li><a href="news!adminQueryPage.action"><i class="glyphicon glyphicon-th-list"></i>新闻管理</a></li>
                            <li><a href="product!adminQueryPage.action"><i class="glyphicon glyphicon-asterisk"></i>产品管理</a></li>
                            <li><a href="message!adminQueryPage.action"><i class="glyphicon glyphicon-eye-open"></i>留言管理</a></li>
                            <li><a href="link!adminQueryPage.action"><i class="glyphicon glyphicon-edit"></i>链接管理</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">
                            <i class="glyphicon glyphicon-credit-card"></i>
                            物料管理
                            <span class="label label-warning pull-right">10</span>		
                        </a>
                    </li>

                    <li>
                        <a href="#">
                            <i class="glyphicon glyphicon-globe"></i>
                            分发配置
							<span class="label label-warning pull-right">5</span>
                        </a>
                    </li>

                    <li>
                        <a href="#">
                            <i class="glyphicon glyphicon-use"></i>
                            人力资源
                            <span class="label label-warning pull-right">55</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="glyphicon glyphicon-calendar"></i>
                            图表统计
                            <span class="label label-warning pull-right">22</span>
                        </a>
                    </li>
                      <li>
                        <a href="#">
                            <i class="glyphicon glyphicon-eye-open"></i>
                            资金管理
                            <span class="label label-warning pull-right">16</span>
                        </a>
                    </li>
                      <li>
                        <a href="#">
                            <i class="glyphicon glyphicon-equalizer"></i>
                            工资纪录
                            <span class="label label-warning pull-right">12</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="glyphicon glyphicon-fire"></i>
                            关于系统
                            <span class="label label-warning pull-right"></span>
                        </a>
                    </li>
					 <li>
                        <a href="<%=basePath %>index.jsp">
                            <i class="glyphicon glyphicon-arrow-left"></i>
                            返回首页
                            <span class="label label-warning pull-right"></span>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="col-md-10">
          <form class="form-inline definewidth m20" action="product!adminquerylike.action" method="post">  
    产品名称：
    <input type="text" name="keywords"  class="abc input-default" placeholder="" >
			&nbsp;&nbsp;
			<a href="">
			<button type="submit" class="btn btn-primary">
				查询
			</button></a>
			&nbsp;&nbsp;
			<a href="<%=basePath%>manager/Product/product.jsp?flag=add"><button
					type="button" class="btn btn-success" >
					新增产品
				</button>
			</a>
		</form>
<table class="table table-bordered table-hover definewidth m10" style="text-align:center;margin-left:30px;">
    <table>
			<tr>
				<c:forEach items="${list}" var="product" varStatus="vs">
					<td>
						<img src="<%=basePath%>${product.url}" width="275px" height="250px" />
						<br />
						<span style="float:left;font-weight: bold;padding-left: 20px;">${product.name}</span>
						<span style="float:right;font-weight: bold;padding-right: 20px;">${product.prtype}</span>
						<br />
						 <a href="<%=basePath%>manager/Product/product.jsp?flag=update&id=${product.id}"><button
					type="button" class="btn btn-success" >
					编辑
				</button></a>
                         <a href="<%=basePath%>product!delete.action?id=${product.id}"  onclick="del()"><button
					type="button" class="btn btn-success" >
					删除
				</button></a>
					</td>
					<c:if test="${vs.count%4==0}">
						<tr></tr>
					</c:if>
				</c:forEach>
			</tr>
		</table>
 

<div style="float:left;color:blue;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;共${count}条纪录，每页10条纪录  </div>
<div class="inline pull-right page">
        <pg:pager items="${count}" maxPageItems="10"
            export="currentNum=pageNumber" url="product!adminQueryPage.action" >
            <pg:first>
                <a href="${pageUrl}">首页</a>
            </pg:first>
            <pg:prev>
                <a href="${pageUrl}">前页</a>
            </pg:prev>
            <pg:pages>
                <c:choose>
                    <c:when test="${currentNum eq pageNumber}">
                        <font color="red">&nbsp;&nbsp;${pageNumber}&nbsp;&nbsp;</font>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageUrl}">&nbsp;&nbsp;${pageNumber}&nbsp;&nbsp;</a>
                    </c:otherwise>
                </c:choose>
            </pg:pages>
            <pg:next>
                <a href="${pageUrl}">后页</a>
            </pg:next>
            <pg:last>
                <a href="${pageUrl}">尾页</a>
            </pg:last>
        </pg:pager>

</div>
            </div>
        </div>
    </div>




</body>
</html>
   
<script>
    $(function () {
        
		$('#addnew').click(function(){

				window.location.href="add.html";
		 });


    });

	function del(id)
	{
		
		
		if(confirm("确定要删除吗？"))
		{
		
			var url = "index.html";
			
			window.location.href=url;		
		
		}
	
	
	
	
	}
</script>