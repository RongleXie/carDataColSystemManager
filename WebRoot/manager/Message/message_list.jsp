<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--格式化  -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

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
<%
		String tag =" list";
		request.setAttribute("tag",tag);
 %>
<form class="form-inline definewidth m20" action="index.html" method="get">  
    新闻名称：
    <input type="text" name="rolename" id="rolename"class="abc input-default" placeholder="" value="">&nbsp;&nbsp;  
    <button type="submit" class="btn btn-primary">查询</button>&nbsp;&nbsp; <a href="<%=basePath%>manager/Message/message.jsp?flag=add"><button type="button" class="btn btn-success" id="addnew">新增留言</button></a>
</form>
<table class="table table-bordered table-hover definewidth m10" >
    <thead>
    <tr>
        <th width="6%">序号</th>
        <th width="10%">留言人(Name)</th>
        <th width="10%">邮箱(E-mail)</th>
        <th width="10%">电话(Tel)</th>
        <th width="30%">内容(Content)</th>
         <th width="20%">时间(Time)</th>
        <th width="14%">留言管理</th>
       
    </tr>
    </thead>
			<c:if test="${message eq null}">
				<tr>
					<td height="18" colspan="12" bgcolor="#FFFFFF">
						<div align="center" class="STYLE1">
							暂无数据
						</div>
					</td>
				</tr>
			</c:if>
			<c:forEach items="${message}" var="n" varStatus="coun">
	     <tr>
            <td>A00${coun.count}</td>
            <td>${n.name}</td>
            <td>${n.email}</td>
            <td>${n.tel}</td>
            <td>${n.content}</td>
            <td>${n.time}</td>
            <td>
                  <a href="<%=basePath%>manager/Message/message.jsp?flag=update&id=${n.id}">编辑</a>
                  <a href="<%=basePath%>message!delete.action?id=${n.id}"  onclick="del()">删除</a>
            </td>
    </c:forEach>
        </tr></table>
 

<div style="float:left;color:blue;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;共${count}条纪录，每页10条纪录  </div>
<div class="inline pull-right page">
        <pg:pager items="${count}" maxPageItems="10"
            export="currentNum=pageNumber" url="message!adminQueryPage.action" >
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