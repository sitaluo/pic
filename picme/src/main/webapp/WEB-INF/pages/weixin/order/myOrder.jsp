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
  </div>
<div id="container" class="container" >
	 <form role="form" id="form">
	  <div class="form-group">
	    <label for="phone">输入手机号查询订单</label>
	    <input type="text" class="form-control" name="phone" id="phone" placeholder="手机号">
	    <button class="btn btn-primary" type="submit">查询</button>
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
	
	<div class="row margin0px">
		<c:forEach items="${orderList }" var="item">
			<div class="col-xs-12 col-sm-12 col-md-12 ">
				 <div class="col-xs-3 col-sm-3 col-md-3"><a href="${basePath }weixin/order/info?orderId=${item.id}">
				 影集</a>
			 	 </div>
			  	 <div class="col-xs-6 col-sm-6 col-md-6">
			  	 		<div class="col-xs-12 col-sm-12 col-md-12">订单号：${item.orderNo }</div>
			  	 		<div class="col-xs-12 col-sm-12 col-md-12">影集制作</div>
			  	 </div>
			  	 <div class="col-xs-3 col-sm-3 col-md-3"><br>${item.totalPrice}
			 	 </div>
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