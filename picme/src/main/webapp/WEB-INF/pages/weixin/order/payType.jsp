<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ include file="../../common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>确认订单</title>
<%@ include file="../../common/GTIncludeHead.jsp"%>

</head>
<body class="" id="body">
<div class="" style="padding:10px;">
	<img src="${basePath }static/upload/sysImgs/Rectangle.png" style="height:16px;"> 支付订单
</div>
<div id="container" class="container" >
  
	<div class="row">
	  <div class="col-xs-12 col-sm-12 col-md-12">
	  	<span class="pull-left">影集编号</span><span class="pull-right">${order.albumNo}</span>
	  </div>
	</div>
	<br>
	<div class="row">
	  <div class="col-xs-12 col-sm-12 col-md-12">
	  	<span class="pull-left">数量</span><span class="pull-right">${order.num}</span>
	  </div>
	</div>
	<br>
	<div class="row">
	  <div class="col-xs-12 col-sm-12 col-md-12">
	  	<span class="pull-left">价格</span><span class="pull-right"><font color="#5B9CE7">￥${order.totalPrice}</font></span>
	  </div>
	</div>
	<div class="row">
	  <div class="col-xs-12 col-sm-12 col-md-12">
	  	<br><br>
	  </div>
	</div>
	<!-- <div class="row">
	  <div class="col-xs-12 col-sm-12 col-md-12">
	  	<span class="pull-left">选择支付方式</span>
	  </div>
	</div> -->
	<div class="row">
	  <div class="col-xs-12 col-sm-12 col-md-12" style="text-align: center;">
	  	<p>微信支付</p>
	  </div>
	</div>
	<div class="row" style="text-align: center;">
		<img name="" src="${basePath }static/upload/sysImgs/weixinpay188.jpg"
	  		class="img-responsive" style="height:200px;margin: 0px auto;">
	</div>
	<div class="row">
	  <div class="col-xs-12 col-sm-12 col-md-12" style="text-align: center;">
	  	<p>长按二维码支付</p>
	  </div>
	</div>
	<br>
	<p style="color:#9D9D9D;">支付完成后选择已支付</p>
	<div class="row col-xs-12 col-sm-12 col-md-12" style="text-align: center;">
		<input name="orderId" type="hidden" value="${order.id }">
		<input name="albumId" type="hidden" value="${order.albumId }">
		<span class="col-xs-2 col-sm-2 col-md-2"></span>
 		<button id="payNoBtn" type="button" class="btn btn-default col-xs-4 col-sm-4 col-md-4" >未支付</button>
		<span class="col-xs-1 col-sm-1 col-md-1"></span>
		<button id="payYesBtn" type="button" class="btn btn-primary col-xs-4 col-sm-4 col-md-4" style="background-color: #5B9CE7;border-color:#5B9CE7; ">已支付</button>
		<span class="col-xs-2 col-sm-2 col-md-2"></span>
	</div>
	
	<!-- <div class="row">
	  <div class="col-xs-12 col-sm-12 col-md-12">
	  	<span class="pull-left">支付宝支付</span><span class="pull-right"><input type="radio" name="payType"></span>
	  </div>
	</div> -->
	<!-- <br>
	<br>
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12">
			<button id="payBtn" type="button" class="btn btn-primary col-xs-12 col-sm-12 col-md-12">确认支付</button>
		</div>
	</div> -->
</div>



	  		
<%@ include file="../../common/MainJS.jsp"%>
<script type="text/javascript">
$(function(){
	$("#payYesBtn").click(function(){
		var orderId = $(this).parent("div").children("input[name=orderId]").val();
		var albumId = $(this).parent("div").children("input[name=albumId]").val();
		if(Number(orderId) > 0 && Number(albumId) > 0){
			var dataStr = "?orderId="+orderId + "&albumId="+albumId + "&paySuccess=1";
			window.location.href= basePath + "weixin/order/sureOrder" + dataStr;
		}else{
			layer.open({
			    content: '出错了，请刷新页面重试'
			    ,skin: 'msg'
			    ,time: 2 //2秒后自动关闭
			  });
		}
	});
	
	$("#payNoBtn").click(function(){
		var orderId = $(this).parent("div").children("input[name=orderId]").val();
		var albumId = $(this).parent("div").children("input[name=albumId]").val();
		if(Number(orderId) > 0 && Number(albumId) > 0){
			var dataStr = "?orderId="+orderId + "&albumId="+albumId + "&paySuccess=0";
			window.location.href= basePath + "weixin/order/sureOrder" + dataStr;
		}else{
			layer.open({
			    content: '出错了，请刷新页面重试'
			    ,skin: 'msg'
			    ,time: 2 //2秒后自动关闭
			  });
		}
	});
});
</script>

</body>

</html>