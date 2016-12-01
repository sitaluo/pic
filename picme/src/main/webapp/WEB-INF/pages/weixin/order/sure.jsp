<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ include file="../../common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>影集制作</title>
<%@ include file="../../common/GTIncludeHead.jsp"%>

</head>
<body class="" id="body">
	<!-- <div class="" style="padding:10px;">
			<div class="col-xs-4 "><span class="glyphicon glyphicon-chevron-left pull-left"></span></div>
			<div class="col-xs-4" style="text-align:center;">确认订单</div>
			<div class="col-xs-4"><span class="pull-right" id="next"></span></div>
  </div> -->
  <div class="" style="padding:10px;">
	<img src="${basePath }static/upload/sysImgs/Rectangle.png" style="height:16px;"> 支付结果
</div>
	 <div class="col-xs-12 col-sm-12 col-md-12" style="text-align: center;">
	  	<div class="col-xs-8 col-sm-8 col-md-8 col-xs-offset-2 col-sm-offset-2 col-md-offset-2">
	  		<div class="col-xs-12 col-sm-12 col-md-12">
	  			<c:if test="${paySuccess eq 1 }">
		  			<img name="preview6" src="${basePath }static/upload/sysImgs/pay_success.png" class="img-responsive" alt="">
	  			</c:if>
	  			<c:if test="${paySuccess eq 0 }">
	  				<img name="preview6" src="${basePath }static/upload/sysImgs/pay_error.png" class="img-responsive" alt="">
	  			</c:if>
	  		</div>
	  		<div class="col-xs-12 col-sm-12 col-md-12"><br>
	  			<c:if test="${paySuccess eq 1 }"><span>支付成功</span>
	  			</c:if>
	  			<c:if test="${paySuccess eq 0 }"><span>支付失败</span>
	  			</c:if>
	  			
	  		</div>
	  	</div>
	 </div>
	 <div class="col-xs-12 col-sm-12 col-md-12"> <br>
	  	<div class="col-xs-10 col-sm-10 col-md-10  col-xs-offset-2 col-sm-offset-2 col-md-offset-2">
	  		<c:if test="${paySuccess eq 1 }">
	  			<a id="queryOrder" href="${basePath }weixin/order/myOrder" class="btn btn-success col-xs-4 col-sm-4 col-md-4">查看订单</a>
	  		</c:if>
	  		<c:if test="${paySuccess eq 0 }">
	  			<a id="queryOrder" href="${basePath }weixin/code" class="btn btn-danger col-xs-4 col-sm-4 col-md-4">查看订单</a>
	  		</c:if>
	  		<div class="col-xs-1 col-sm-1 col-md-1"></div>
	  		<a id="backIndex" href="${basePath }weixin/code"  class="btn btn-info col-xs-4 col-sm-4 col-md-4">返回首页</a>
	  	</div>
	 </div>

<%@ include file="../../common/MainJS.jsp"%>
<script type="text/javascript">

</script>
</body>
</html>