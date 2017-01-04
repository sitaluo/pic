<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ include file="../../common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>影集制作</title>
<%@ include file="../../common/GTIncludeHead.jsp"%>

</head>
<body class="" id="body">
  <div class="" style="padding:10px;">
	<img src="${basePath }static/upload/sysImgs/Rectangle.png" style="height:16px;"> 我的订单
	<a href="${basePath }weixin/code" class="btn btn-link  pull-right" style="padding: 0px 10px;">返回首页</a>
  </div>
<div id="container" class="container" >
	 <form role="form" id="form">
	  <div class="form-group">
	    <input type="text" class="form-control pull-left" name="phone" id="phone" placeholder="输入手机号查询订单" style="width:65%;">
	    <button class="btn btn-primary pull-right" type="submit" style="width:30%;">查询</button>
	  </div>
	</form>
  <hr class="col-xs-12 col-sm-12 col-md-12 ">
  <c:if test="${empty orderList }">
 	 <div class="row">
	  <div class="col-xs-12 col-sm-12 col-md-12">
	  	<p>亲，您还没有订单哦~</p>
	  </div>
	</div>
	<hr class="col-xs-12 col-sm-12 col-md-12 ">
  </c:if>
	<div class="col-xs-12 col-sm-12 col-md-12 ">
			  	<div class="col-xs-6 col-sm-6 col-md-6">订单号</div>
			  	<div class="col-xs-3 col-sm-3 col-md-3">价格</div>
			  	<div class="col-xs-3 col-sm-3 col-md-3"></div>
			  </div>
			  <hr class="col-xs-12 col-sm-12 col-md-12 ">
	<div class="row margin0px">
		<c:forEach items="${orderList }" var="item">
			  <div class="col-xs-12 col-sm-12 col-md-12 ">
			  	<div class="col-xs-6 col-sm-6 col-md-6">${item.orderNo }</div>
			  	<div class="col-xs-3 col-sm-3 col-md-3">￥${item.totalPrice}</div>
			  	<div class="col-xs-3 col-sm-3 col-md-3"><a href="${basePath }weixin/order/info?orderId=${item.id}">
				 详情</a></div>
			  </div>
			  <hr class="col-xs-12 col-sm-12 col-md-12" style="margin: 10px 0px;">
		</c:forEach>
	 </div> 
</div>		


</body>
<%@ include file="../../common/MainJS.jsp"%>
<script type="text/javascript">

</script>
</html>