<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>后台管理</title>
<%@ include file="../common/GTIncludeHead.jsp"%>
<%@ include file="../common/taglibs.jsp"%>

</head>
<body class="" id="body">

<input type="hidden" name="albumId" id="albumId" value="${album.id }">
<input type="hidden" name="userId" id="userId" value="${current_user.id }">

<input type="hidden" name="coverImg" id="coverImg" value="">
<div class="" style="padding:10px;">
	<img src="${basePath }static/upload/sysImgs/Rectangle.png" style="height:16px;"> 后台首页
	<br><br>
	<a class="btn btn-primary" href="${basePath }admin/order/list">订单管理</a>
	
</div>  


<%@include file="../common/MainJS.jsp"%>

</body>
</html>
