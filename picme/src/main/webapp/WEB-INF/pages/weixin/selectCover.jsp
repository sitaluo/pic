<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ page language="java" import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<title>选择封面</title>
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
</style>
</head>
<body class="">
<div class="" style="padding:10px;">
			<div class="col-xs-4 pull-left">上一步</div><div class="col-xs-4">选择封面</div><div class="col-xs-4 pull-right" id="next">下一步</div>
 			<input type="hidden" name="coverImg" id="coverImg" value="">
  </div>
  <hr>
		<div class="example">
			<div id="myCarousel" class="carousel slide">
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="item active">
						<img src="${basePath }static/upload/sysImgs/1.jpg" alt="">
						<div class="carousel-caption">
							<h4></h4>
							<p></p>
						</div>
					</div>
					<div class="item">
						<img src="${basePath }static/upload/sysImgs/2.jpg" alt="">
						<div class="carousel-caption">
							<h4></h4>
							<p></p>
						</div>
					</div>
					<div class="item">
						<img src="${basePath }static/upload/sysImgs/3.jpg" alt="">
						<div class="carousel-caption">
							<h4></h4>
							<p></p>
						</div>
					</div>
				</div>
				<a class="left carousel-control" href="#myCarousel"
					data-slide="prev">&lsaquo;</a> <a class="right carousel-control"
					href="#myCarousel" data-slide="next">&rsaquo;</a>
			</div>
		</div>

		<hr class="bs-docs-separator">

		<div id="sub" class="container">
			<div class="row">
				<div class="col-xs-4 col-sm-4 col-md-4 " id="0">
					<img src="${basePath }static/upload/sysImgs/1.jpg"
						class="img-responsive" alt="">
						<span class="glyphicon glyphicon-ok-circle hidden" style="position: absolute;right:20px;top:10px;color: white;"></span>
				</div>
				<div class="col-xs-4 col-sm-4 col-md-4 "  id="1">
					<img src="${basePath }static/upload/sysImgs/2.jpg"
						class="img-responsive" alt="">
						<span class="glyphicon glyphicon-ok-circle hidden" style="position: absolute;right:20px;top:10px;color: white;"></span>
				</div>
				<div class="col-xs-4 col-sm-4 col-md-4 "  id="2">
					<img src="${basePath }static/upload/sysImgs/3.jpg"
						class="img-responsive" alt="">
						<span class="glyphicon glyphicon-ok-circle hidden" style="position: absolute;right:20px;top:10px;color: black;"></span>
				</div>
			</div>


		</div>




<%@ include file="../common/MainJS.jsp"%>
<script src="${staticPath }/bootstrap-3.3.0/carousel.js"></script>
<script type="text/javascript">
		$(function(){
			$('.carousel').carousel();
			$("#sub div.row div").click(function(){
				var id = $(this).attr("id");
				$("#coverImg").val((Number(id)+1));
				$(".carousel-indicators li").eq(id).trigger("click");
				$(this).children("span.hidden").removeClass("hidden").addClass("show");
				$(this).siblings("div").children("span.show").removeClass("show").addClass("hidden");
			});
			
			$("#next").click(function(){
				var coverImg = $("#coverImg").val();
				if(coverImg >= 0){
					var path = "${basePath}weixin/typeSetting?coverImg="+coverImg; 
					window.location.href = path;
				}
			});
		});		
</script>


</body>
</html>
