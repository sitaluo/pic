<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ page language="java" import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<title>影集首页</title>
<%@ include file="../common/GTIncludeHead.jsp"%>

<style type="text/css">

.pos_relative
{
	position:relative;
}
.pos_absoluteb
{
	position:absoluteb;
	top:10px;
	right:10px;
}
.textCenter{
	text-align: center;
}
.height120{
	height:80px;
}
.width130{
	height:130px;
}
</style>
</head>
<body class="">
<div class="example">
	<div id="myCarousel" class="carousel slide">
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="item active">
				<img src="${basePath }static/upload/sysImgs/carousel1.png" alt="">
			<div class="carousel-caption">
				<h4></h4>
				<p></p>
			</div>
		</div>
		<div class="item">
			<img src="${basePath }static/upload/sysImgs/carousel2.png" alt="">
			<div class="carousel-caption">
				<h4></h4>
				<p></p>
			</div>
		</div>
		<div class="item">
			<img src="${basePath }static/upload/sysImgs/carousel3.png" alt="">
			<div class="carousel-caption">
				<h4></h4>
				<p></p>
			</div>
		</div>
	</div>
	<!-- <a class="left carousel-control" href="#myCarousel"
		data-slide="prev">&lsaquo;</a> <a class="right carousel-control"
		href="#myCarousel" data-slide="next">&rsaquo;</a> -->
	</div>
</div>
<div class="col-xs-12 col-sm-12 col-md-12" style="text-align: center;">
		<br>
	  	<div style="margin: 5px auto;"><span>Picme 影集定制</span></div>
	  	<div style="margin: 5px auto;"><span>精挑细选你喜欢的照片</span></div>
	  	<div style="margin: 5px auto;"><span>剩下的交给我们来完成</span></div>
</div>

<div style="" class="textCenter">
	<p style="color:#9D9D9D;">「简单步骤    &nbsp;影集到手」</p>
</div>
<div class="col-xs-12 col-sm-12 col-md-12">
	<div class="row" >
		<div class="col-xs-2 col-sm-2 col-md-2"></div>
		 <div class="col-xs-4 col-sm-4 col-md-4 textCenter height1201" style="border-right: 1px solid #D9D9D9;border-bottom: 1px solid #D9D9D9;">
		  	<img name="" src="${basePath }static/upload/sysImgs/step1.jpg" style="height:60px;width:60px;right:20px;position: ;" class=" " alt="">
			<p style="color:#9D9D9D;right:20px;bottom:0px;position: ;">①选择封面</p>
		 </div>
		 <div class="col-xs-4 col-sm-4 col-md-4 textCenter height1201" style="border-bottom: 1px solid #D9D9D9;">
		  	<img name="" src="${basePath }static/upload/sysImgs/step2.jpg" style="height:60px;width:60px;left:20px;position: ;" class=" " alt="">
			<p ><span style="color:#9D9D9D;">②上传照片</span></p>
		 </div>
		 <div class="col-xs-2 col-sm-2 col-md-2"></div>		
	 </div>
	 <div class="row" style="height:130px;">
	 	<div class="col-xs-2 col-sm-2 col-md-2"></div>
		 <div class="col-xs-4 col-sm-4 col-md-4 textCenter height1201" style="border-right: 1px solid #D9D9D9;">
		  	<br><img name="" src="${basePath }static/upload/sysImgs/step3.jpg" style="height:60px;width:60px;margin: 0px auto;right:20px;position: ;" 
		  		class=" " alt="">
			<p style="color:#9D9D9D;">③页面排版</p>
		 </div>
		 <div class="col-xs-4 col-sm-4 col-md-4 textCenter height1201">
		  	<br><img name="" src="${basePath }static/upload/sysImgs/step4.jpg" style="height:60px;width:60px;left:20px;position: ;" class=" " alt="">
			<p style="color:#9D9D9D;">④ 支付费用</p>
		 </div>
		 <div class="col-xs-2 col-sm-2 col-md-2"></div>
	 </div>
</div>
<%-- <a href="${basePath }/weixin/order/payType?albumId=261&addressId=2">支付页面test</a>
<a href="${basePath }/weixin/address/list?albumId=262">地址</a><br>
<a href="${basePath }/weixin/testsort">排序</a> --%>

<div style="height:70px;" class="col-xs-12 col-sm-12 col-md-12">
</div>
 <div class="col-xs-12 col-sm-12 col-md-12 textCenter" style="position: fixed;top:auto; left: auto; right: auto;  bottom: 0px;padding: 0px;">
	  <button class="btn btn-default btn-lg col-xs-4 col-sm-4 col-md-4" id="myOrder" style="border-radius:0px;"> 我的订单  </button>
	  <button class="btn btn-primary btn-lg col-xs-8 col-sm-8 col-md-8" id="next" style="border-radius:0px;"> 定制影集  </button>	
</div> 
</body>
<%@ include file="../common/MainJS.jsp"%>
<script src="${staticPath }/bootstrap-3.3.0/carousel.js"></script>
<script type="text/javascript">
		$(function(){
			$('.carousel').carousel();
			$("#next").click(function(){
				//选择封面
				//var path = "${basePath}weixin/selectCover"; 
				var path = "${basePath}weixin/register"; 
				window.location.href = path;
			});
			
			$("#myOrder").click(function(){
				var path = "${basePath}weixin/order/myOrder"; 
				window.location.href = path;
			});
		});		
</script>
</html>
