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
			<div class="col-xs-4 "><span class="glyphicon glyphicon-chevron-left pull-left"></span></div>
			<div class="col-xs-4" style="text-align:center;">确认订单</div>
			<div class="col-xs-4"><span class="pull-right" id="next"></span></div>
  </div>
  
	 <div class="col-xs-12 col-sm-12 col-md-12" style="text-align: center;">
	  	<div class="col-xs-8 col-sm-8 col-md-8 col-xs-offset-2 col-sm-offset-2 col-md-offset-2">
	  		<div class="col-xs-12 col-sm-12 col-md-12">
	  			<img name="preview6" src="${basePath }static/upload/sysImgs/noimg.png" class="img-responsive" alt="">
	  		</div>
	  		<div class="col-xs-12 col-sm-12 col-md-12"><br>
	  			<span class="glyphicon glyphicon-ok-circle"></span><span>支付成功</span>
	  		</div>
	  	</div>
	 </div>
	 <div class="col-xs-12 col-sm-12 col-md-12"> <br>
	  	<div class="col-xs-10 col-sm-10 col-md-10  col-xs-offset-2 col-sm-offset-2 col-md-offset-2">
	  		<button id="queryOrder" type="button" class="btn btn-primary col-xs-4 col-sm-4 col-md-4">查看订单</button>
	  		<div class="col-xs-1 col-sm-1 col-md-1"></div>
	  		<button id="backIndex" type="button" class="btn btn-info col-xs-4 col-sm-4 col-md-4">返回首页</button>
	  	</div>
	 </div>

<%@ include file="../../common/MainJS.jsp"%>
<script type="text/javascript">

</script>
</body>
</html>