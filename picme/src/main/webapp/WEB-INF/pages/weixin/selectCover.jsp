<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ page language="java" import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<title>影集制作</title>
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
<input type="hidden" name="coverImg" id="coverImg" value="">

<div class="" style="padding:10px;">
	<img src="${basePath }static/upload/sysImgs/Rectangle.png" style="height:16px;"> 选择封面
  </div>
		<div class="example">
			<div id="myCarousel" class="carousel slide">
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
					<li data-target="#myCarousel" data-slide-to="3" class=""></li>
					<li data-target="#myCarousel" data-slide-to="4"></li>
					<li data-target="#myCarousel" data-slide-to="5"></li>
				</ol>
				<div class="carousel-inner">
					<div class="item active">
						<img src="${basePath }static/upload/sysImgs/1.jpg" alt="" class="img-responsive">
						<div class="carousel-caption">
							<h4></h4>
							<p></p>
						</div>
					</div>
					<div class="item">
						<img src="${basePath }static/upload/sysImgs/2.jpg" alt="" class="img-responsive">
						<div class="carousel-caption">
							<h4></h4>
							<p></p>
						</div>
					</div>
					<div class="item">
						<img src="${basePath }static/upload/sysImgs/3.jpg" alt="" class="img-responsive">
						<div class="carousel-caption">
							<h4></h4>
							<p></p>
						</div>
					</div>
					<div class="item">
						<img src="${basePath }static/upload/sysImgs/4.jpg" alt="" class="img-responsive">
						<div class="carousel-caption">
							<h4></h4>
							<p></p>
						</div>
					</div>
					<div class="item">
						<img src="${basePath }static/upload/sysImgs/5.jpg" alt="" class="img-responsive">
						<div class="carousel-caption">
							<h4></h4>
							<p></p>
						</div>
					</div>
					<div class="item">
						<img src="${basePath }static/upload/sysImgs/6.jpg" alt="" class="img-responsive">
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

		<!-- <hr class="bs-docs-separator"> -->
		<hr>

		<div id="sub" class="container">
			<div class="row">
				<div class="col-xs-4 col-sm-4 col-md-4 " id="0">
					<img src="${basePath }static/upload/sysImgs/1.jpg"
						class="img-responsive" alt="" style="margin-bottom: 15px;">
						<span class="glyphicon glyphicon-ok-circle hidden" style="position: absolute;right:20px;top:10px;color: white;margin-bottom: 15px;"></span>
				</div>
				<div class="col-xs-4 col-sm-4 col-md-4 "  id="1">
					<img src="${basePath }static/upload/sysImgs/2.jpg"
						class="img-responsive" alt="" style="margin-bottom: 15px;">
						<span class="glyphicon glyphicon-ok-circle hidden" style="position: absolute;right:20px;top:10px;color: white;margin-bottom: 15px;"></span>
				</div>
				<div class="col-xs-4 col-sm-4 col-md-4 "  id="2">
					<img src="${basePath }static/upload/sysImgs/3.jpg"
						class="img-responsive" alt="" style="margin-bottom: 15px;">
						<span class="glyphicon glyphicon-ok-circle hidden" style="position: absolute;right:20px;top:10px;color: black;margin-bottom: 15px;"></span>
				</div>
				
				<div class="col-xs-4 col-sm-4 col-md-4 " id="3">
					<img src="${basePath }static/upload/sysImgs/4.jpg"
						class="img-responsive" alt="" style="margin-bottom: 15px;">
						<span class="glyphicon glyphicon-ok-circle hidden" style="position: absolute;right:20px;top:10px;color: white;margin-bottom: 15px;"></span>
				</div>
				<div class="col-xs-4 col-sm-4 col-md-4 "  id="4">
					<img src="${basePath }static/upload/sysImgs/5.jpg"
						class="img-responsive" alt="" style="margin-bottom: 15px;">
						<span class="glyphicon glyphicon-ok-circle hidden" style="position: absolute;right:20px;top:10px;color: white;margin-bottom: 15px;"></span>
				</div>
				<div class="col-xs-4 col-sm-4 col-md-4 "  id="5">
					<img src="${basePath }static/upload/sysImgs/6.jpg"
						class="img-responsive" alt="" style="margin-bottom: 15px;">
						<span class="glyphicon glyphicon-ok-circle hidden" style="position: absolute;right:20px;top:10px;color: black;margin-bottom: 15px;"></span>
				</div>
			</div>

		</div>
		
<div style="height:70px;" class="col-xs-12 col-sm-12 col-md-12">
</div>
<!-- <div class="col-xs-12 col-sm-12 col-md-12" style="padding: 0px;">
	<br>
	<button class="btn btn-primary btn-lg col-xs-12 col-sm-12 col-md-12" id="next" style="border-radius:0px;"> 下一步 </button>	
</div> -->

<div class="col-xs-12 col-sm-12 col-md-12 textCenter" style="position: fixed;top:auto; left: auto; right: auto;  bottom: 0px;padding: 0px;">
	  <button class="btn btn-primary btn-lg col-xs-12 col-sm-12 col-md-12" id="next" style="border-radius:0px;"> 下一步  </button>	
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
				if(coverImg > 0){
					var path = "${basePath}weixin/typeSetting?coverImg="+coverImg; 
					window.location.href = path;
				}else{
					 layer.open({
						    content: '请点击选择一张图片作为封面'
						    ,btn: '我知道了'
						  });
				}
			});
		});		
</script>


</body>
</html>
