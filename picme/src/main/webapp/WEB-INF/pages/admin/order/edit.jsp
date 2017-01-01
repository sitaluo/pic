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
	<div class="col-xs-6 col-sm-6 col-md-6 pull-right">${order.orderNo }</div><br><br>
</div>
<div class="col-xs-12 col-sm-12 col-md-12">
	<div class="col-xs-6 col-sm-6 col-md-6">订单状态</div>
	<div class="col-xs-6 col-sm-6 col-md-6 pull-right">${orderStateMap.get(order.state) }</div><br><br>
</div>
<div class="col-xs-12 col-sm-12 col-md-12">
	<div class="col-xs-6 col-sm-6 col-md-6">订单类型</div>
	<div class="col-xs-6 col-sm-6 col-md-6 pull-right">影集制作</div><br><br>
</div>
<div class="col-xs-12 col-sm-12 col-md-12">
	<div class="col-xs-6 col-sm-6 col-md-6">下单时间</div>
	<div class="col-xs-6 col-sm-6 col-md-6 pull-right">
		<fmt:formatDate value="${order.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
	</div><br><br>
</div>
<div class="col-xs-12 col-sm-12 col-md-12">
	<div class="col-xs-6 col-sm-6 col-md-6">
		<a href="${basePath }admin/album/edit?id=${order.albumId}">查看影集</a>
	</div>
</div>
<hr class="col-xs-12 col-sm-12 col-md-12">
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
<%-- <div class="row col-xs-12 col-sm-12 col-md-12" style="text-align: center;">
	<input type="hidden" name="orderId" id="orderId" value="${order.id}">
	<span class="col-xs-2 col-sm-2 col-md-2"></span>
	<button id="customerService" type="button" class="btn btn-default col-xs-4 col-sm-4 col-md-4" >联系客服</button>
	<span class="col-xs-1 col-sm-1 col-md-1"></span>
	<button id="payYesBtn" type="button" class="btn btn-primary col-xs-4 col-sm-4 col-md-4" >立即支付</button>
	<span class="col-xs-2 col-sm-2 col-md-2"></span>
</div> --%>
<div class="col-xs-12 col-sm-12 col-md-12 textCenter" style="position: fixed;top:auto; left: auto; right: auto;  bottom: 0px;padding: 0px;">
	<input type="hidden" name="orderId" id="orderId" value="${order.id}">
	<button id="customerService" type="button" class="btn btn-default btn-lg col-xs-4 col-sm-4 col-md-4" style="border-radius:0px;">联系客服</button>
	<button id="payYesBtn" type="button" class="btn btn-primary btn-lg col-xs-8 col-sm-8 col-md-8" style="border-radius:0px;">立即支付</button>
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
	$("#customerService").click(function(){
		 layer.open({
			    content: '微信：picmekf   手机：13316027531'
			    ,btn: '确定'
			  });
	});
});
</script>



</body>
</html>