<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ include file="../../common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>确认订单</title>
<%@ include file="../../common/GTIncludeHead.jsp"%>

</head>
<body class="" id="body">
<div id="container" class="container" >
	<div class="" style="padding:10px;">
			<div class="col-xs-4 "><span class="glyphicon glyphicon-chevron-left pull-left"></span></div>
			<div class="col-xs-4" style="text-align:center;">支付订单</div>
			<div class="col-xs-4"><span class="pull-right" id="next">下一步</span></div>
  </div>
  <hr class="col-xs-12 col-sm-12 col-md-12 ">
	<div class="row">
	  <div class="col-xs-12 col-sm-12 col-md-12">
	  	<span class="pull-left">影集编号</span><span class="pull-right">${order.albumNo}</span>
	  </div>
	</div>
	<div class="row">
	  <div class="col-xs-12 col-sm-12 col-md-12">
	  	<span class="pull-left">数量</span><span class="pull-right">${order.num}</span>
	  </div>
	</div>
	<div class="row">
	  <div class="col-xs-12 col-sm-12 col-md-12">
	  	<span class="pull-left">价格</span><span class="pull-right">￥${order.totalPrice}</span>
	  </div>
	</div>
	<div class="row">
	  <div class="col-xs-12 col-sm-12 col-md-12">
	  	<br><br>
	  </div>
	</div>
	<div class="row">
	  <div class="col-xs-12 col-sm-12 col-md-12">
	  	<span class="pull-left">选择支付方式</span>
	  </div>
	</div>
	<div class="row">
	  <div class="col-xs-12 col-sm-12 col-md-12">
	  	<span class="pull-left">微信支付</span><span class="pull-right"><input type="radio" name="payType" checked="checked"></span>
	  </div>
	</div>
	<div class="row">
	  <div class="col-xs-12 col-sm-12 col-md-12">
	  	<span class="pull-left">支付宝支付</span><span class="pull-right"><input type="radio" name="payType"></span>
	  </div>
	</div>
	<br>
	<br>
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12">
			<button id="payBtn" type="button" class="btn btn-primary col-xs-12 col-sm-12 col-md-12">确认支付</button>
		</div>
	</div>
</div>
<%@ include file="../../common/MainJS.jsp"%>
<script type="text/javascript">
$(function(){
	$("#payBtn").click(function(){
		window.location.href= basePath + "weixin/order/sureOrder";
	});
});
</script>

</body>

</html>