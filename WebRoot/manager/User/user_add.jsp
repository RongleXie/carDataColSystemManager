<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>"/>
    
    <title>My JSP 'user_add.jsp' starting page</title>
    
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
    <script type="text/javascript">
			function check() {
				var emailCheck = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
				var userEmail = document.getElementById("user.userEmail"); //邮箱
				var userPwd = document.getElementById("user.userPwd"); //密码
				var userPwdCheck = document.getElementById("user.userPwdCheck");//确认密码
				if (!(emailCheck.test(userEmail.value))) {
					alert('邮箱输入不正确！');
					return false;
				} else if (userPwd.value.length < 6) {
					alert('请输入6位以上的密码！');
					return false;
				} else if (userPwd!=userPwdCheck) {
					alert('两次输入的密码不一致，请重新输入！');
				}
			}
		</script>
</head>
<form action="user!add.action" method="post">
<input type="hidden" name="method" value="add"/>
<table class="table table-bordered table-hover definewidth m10">
    <tr>
        <td width="10%" class="tableleft">[新增用户]</td>
    </tr>
    <tr>
        <td class="tableleft">用户名</td>
        <td><input id="user.userName" type="text" name="user.userName"/></td>
    </tr>   
    <tr>
        <td class="tableleft">邮箱</td>
        <td><input id="user.userEmail" type="text" name="user.userEmail"/>
        </td>
    </tr> 
     <tr>
        <td class="tableleft">密码</td>
        <td><input id="user.userPwd" type="text" name="user.userPwd"/>
        </td>
    </tr> 
    <tr>
        <td class="tableleft">确认密码</td>
        <td><input id="user.userPwdCheck" type="text" name="user.userPwdCheck"/>
        </td>
    </tr> 
    <tr>
        <td class="tableleft"></td>
        <td>
            <button type="submit" class="btn btn-primary" type="button" onclick="return check();" >保存</button>&nbsp;&nbsp;<button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
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