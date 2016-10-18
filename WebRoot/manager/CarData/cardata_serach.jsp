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
    <title>查询结果</title>
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
		function checkN(){
				alert("check(0)");
				alert("str1:"+str);
				//var str=$(this).attr("href").split("?");
				var str=window.location.href.split("?");
				alert("str2:"+str);
				if(str[1]==undefined){
					str=str+"?pager.offset=0&flag=serach&rolename="+${rolename};
				}
				else{
					str=str[0]+"?"+str[2]+"&flag=serach&rolename="+${rolename};
				}
				alert("str3:"+str);
				$(this).attr("href",str);
				}
	
</script>
<script type="text/javascript">
		$(document).ready(function(){
			$("#id").click(function(){
				var str=window.location.href.split("?");
				if(str[1]==undefined){
					str=str+"?pager.offset=0&flag=serach&rolename="+${rolename};
				}
				else{
					str=str[0]+"?"+str[1]+"&flag=serach&rolename="+${rolename};
				}
				$(this).attr("href",str);
				
			})
		})
		**/
	</script>
	</head>
<body>
<%
		String tag =" list";
		request.setAttribute("tag",tag);
 %>
<form class="form-inline definewidth m20" action="cardata!searchPage.action?flag=serach" method="post">  
    用户或详细数据：
    <input type="text" name="rolename" id="rolename"class="abc input-default" placeholder="" value="${rolename}">&nbsp;&nbsp;  
    <button type="submit" class="btn btn-primary">查询</button>&nbsp;&nbsp; <a href="<%=basePath%>manager/CarData/cardata.jsp?flag=add"><button type="button" class="btn btn-success" id="addnew">新增数据</button></a>
</form>
<table class="table table-bordered table-hover definewidth m10" >
    <thead>
    <tr>
        <th width="6%">序号</th>
        <th width="10%">用户</th>
        <th width="10%">速度</th>
        <th width="10%">加速度</th>
        <th width="10%">经度</th>
        <th width="10%">纬度</th>
          <th width="10%">海拔</th>
        <th width="10%">坡度</th>
        <th width="15%">收集时间</th>
        <th width="10%">数据管理</th>
    </tr>
    </thead>
			<c:if test="${cardata eq null}">
				<tr>
					<td height="18" colspan="12" bgcolor="#FFFFFF">
						<div align="center" class="STYLE1">
							暂无数据
						</div>
					</td>
				</tr>
			</c:if>
			<c:forEach items="${cardata}" var="n" varStatus="coun">
	     <tr>
            <td>A00${initsize+coun.count}</td>
            <td>${n.userEmail}</td>
            <td>${n.cardataSpeed}</td>
            <td>${n.cardataAcceleration}</td>
            <td>${n.cardataLongitude}</td>
            <td>${n.cardataLatitude}</td>
            <td>${n.cardataAltitude}</td>
            <td>${n.cardataSlope}</td>
            <td>${n.cardataTime}</td>
            <td>
                  <a href="<%=basePath%>manager/CarData/cardata.jsp?flag=update&id=${n.cardataId}">编辑</a>
                  <a href="<%=basePath%>cardata!delete.action?id=${n.cardataId}"  onclick="del()">删除</a>
            </td>
    </c:forEach>
        </tr></table>
 

<div style="float:left;color:blue;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;共${count}条纪录，每页10条纪录  </div>
<div class="inline pull-right page">
		<input type="hidden" name="rolename" value="${rolename}"/>
		<input type="hidden" name="flag" value="serach"/>
        <pg:pager items="${count}" maxPageItems="10"
            export="currentNum=pageNumber" url="cardata!searchPage.action" >
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
                        <a id="uuu" href="${pageUrl}" onclick="return checkN();" >&nbsp;&nbsp;${pageNumber}&nbsp;&nbsp;</a>
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