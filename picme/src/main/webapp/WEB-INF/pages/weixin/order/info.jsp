<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ include file="../../common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>影集制作</title>
<%@ include file="../../common/GTIncludeHead.jsp" %>

</head>
<body class="" id="body">
<div class="" style="padding:10px;">
	<img src="${basePath }static/upload/sysImgs/Rectangle.png" style="height:16px;"> 订单详情
</div>
<div class="col-xs-12 col-sm-12 col-md-12">
	<div class="col-xs-6 col-sm-6 col-md-6">订单号</div>
	<div class="col-xs-6 col-sm-6 col-md-6 pull-right">${order.orderNo }</div>
</div>
<div class="col-xs-12 col-sm-12 col-md-12">
	<div class="col-xs-6 col-sm-6 col-md-6">订单状态</div>
	<div class="col-xs-6 col-sm-6 col-md-6 pull-right">${order.orderNo }</div>
</div>
<div class="col-xs-12 col-sm-12 col-md-12">
	<div class="col-xs-6 col-sm-6 col-md-6">订单类型</div>
	<div class="col-xs-6 col-sm-6 col-md-6 pull-right">${order.orderNo }</div>
</div>
<div class="col-xs-12 col-sm-12 col-md-12">
	<div class="col-xs-6 col-sm-6 col-md-6">下单时间</div>
	<div class="col-xs-6 col-sm-6 col-md-6 pull-right">${order.orderNo }</div>
</div>
<hr>
<div class="col-xs-12 col-sm-12 col-md-12">
	<div class="col-xs-6 col-sm-6 col-md-6">费用</div>
	<div class="col-xs-6 col-sm-6 col-md-6 pull-right">${order.totalPrice }</div>
</div>
<div class="col-xs-12 col-sm-12 col-md-12">
	<div class="col-xs-6 col-sm-6 col-md-6">优惠</div>
	<div class="col-xs-6 col-sm-6 col-md-6 pull-right">￥0</div>
</div>
<div class="col-xs-12 col-sm-12 col-md-12">
	<div class="col-xs-6 col-sm-6 col-md-6">实际付款</div>
	<div class="col-xs-6 col-sm-6 col-md-6 pull-right">${order.totalPrice }</div>
</div>
<hr>
<div class="row col-xs-12 col-sm-12 col-md-12" style="text-align: center;">
	<input type="hidden" name="orderId" id="orderId" value="${order.id}">
	<span class="col-xs-2 col-sm-2 col-md-2"></span>
	<button id="customerService" type="button" class="btn btn-default col-xs-4 col-sm-4 col-md-4" >联系客服</button>
	<span class="col-xs-1 col-sm-1 col-md-1"></span>
	<button id="payYesBtn" type="button" class="btn btn-primary col-xs-4 col-sm-4 col-md-4" >立即支付</button>
	<span class="col-xs-2 col-sm-2 col-md-2"></span>
</div>
	  

<%@ include file="../../common/MainJS.jsp"%>
<script type="text/javascript">
$(function(){
	$("#payYesBtn").click(function(){
		var orderId = $("#orderId").val();
		if(Number(orderId) > 0){
			window.location.href = basePath + "weixin/order/payType?orderId=" + orderId;
		}
	});
});
</script>
</body>
</html>