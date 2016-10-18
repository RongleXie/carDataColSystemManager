<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="<%=basePath %>manager/main/bootstrap.css" rel="stylesheet">
    <style>
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
        .tableleft{
			text-align:center;
			padding-left:5px;
			font-weight:800;
			font-style:"华文行楷";
			background-color:#f5f5f5;
		}
    </style>
</head>

<body>
    <div class="navbar navbar-duomi navbar-static-top" role="navigation" style="height:80px;">
        <div class="container-fluid">
            <div class="navbar-header">
            <br/>
                <a class="navbar-brand" href="<%=basePath %>/manager/index.jsp" id="logo">智能汽车数据采集APP后台管理系统
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
       <table class="table table-bordered table-hover definewidth m10">
    <tr>
        <td width="10%" class="tableleft">位置</td>
        <td> <a href="<%=basePath %>manager/index.jsp">
                            <i class="glyphicon glyphicon-th-large"></i> 
                      		 首页 		
                        </a></td>
    </tr>
    <tr>
        <td class="tableleft">系统名称</td>
        <td>智能汽车数据采集APP后台管理系统</td>
    </tr>   
    <tr>
        <td class="tableleft">系统版本</td>
        <td>8.8.8.8.8.8.8</td>
    </tr>
    <tr>
        <td class="tableleft">web服务器</td>
        <td>TOMCAT &nbsp;7.0</td>
    </tr>
     <tr>
        <td class="tableleft">操作系统</td>
        <td>windows&nbsp;7</td>
    </tr>
    <tr>
        <td class="tableleft">系统简介</td>
        <td>
				<textarea
					disabled="disabled"
					style="width: 500px; height: 220px; float: left; padding: 3px 0px 0 4px; background-color: #F4F6F7; border: 1px #90A9B7 solid; color: #000; font-family: Arial, Helvetica, sans-serif; font-size: 16px; -moz-border-radius: 4px; -webkit-border-radius: 4px; border-radius: 4px;text-align:left;">本系统为智能汽车数据采集APP后台管理系统专用后台管理系统</textarea>
		</td>
			</tr>   
            </div>
        </div>
    </div>
    <script src="<%=basePath %>manager/main/jquery.min.js"></script>
    <script src="<%=basePath %>manager/main/bootstrap.min.js"></script>
    <script>
    </script>
</body>
</html>