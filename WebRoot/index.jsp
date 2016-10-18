<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>Login</title>
		<style type="text/css">
		body {
			background: #068bd6;
		}
		</style>
		<script type="text/javascript">
			function check() {
				var emailCheck = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
				var userEmail = document.getElementById("userEmail"); //账号
				var userPwd = document.getElementById("userPwd"); //密码
				if (!(emailCheck.test(userEmail.value))) {
					alert('邮箱输入不正确');
					return false;
				} else if (userPwd.value.length < 6) {
					alert('请输入6位以上的密码');
					return false;
				}
			}
		</script>
	</head>

	<body>
		<div align="center">
			<form action="User_login.action" method="post"
				style="margin: 0 auto;">
				</br>
				</br>
				</br>
				</br>
				</br>
				</br>
				</br>
				</br>
				</br>
				</br>
				<h1 align="center">
					机动车浮动数据采集
				</h1>
				</br>
				用户名：
				<input type="text" id="userEmail" name="useEmail"
					style="font-size: 20px; height: 50px; width: 240px" />
				</br>
				密&nbsp;码：
				<input type="text" id="userPwd" name="usePwd"
					style="font-size: 20px; height: 50px; width: 240px;" />
				</br>
				</br>
				&nbsp;&nbsp;&nbsp;
				<input style="width: 100px; height: 30px" type="submit" value="登录" onclick="return check();" />
				</br>

				</br>
			</form>
			<div>
				<a style="font-size: 30px; color: #ffffff;"> 成都市环科院</a>
				</br>
				<a style="font-size: 25px; color: #ffffff;"> 机动车浮动数据采集</a>
			</div>
		</div>
		
	</body>
</html>