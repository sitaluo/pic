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

.inlile{
	display: inline;
}

.test{
 	 display: inline-block;
 	width: 120px;
 	height:120px; 
 	padding-left: 10px;
 	padding-right: 10px;
}

.border5px{
	border: 5px solid #F7F7F7;
}
.border5px_select{
	border: 5px solid #428bca;
}

</style>
<style>

</style>
</head>
<body class="">
<input type="hidden" name="coverImg" id="coverImg" value="">

<div class="" style="padding:10px;">
	<img src="${basePath }static/upload/sysImgs/Rectangle.png" style="height:16px;"> 选择封面
  </div>
		<div class="example" style="background-color: #F7F7F7;">
			<div id="myCarousel" class="carousel slide" style="padding:20px 50px;">
				<ol class="carousel-indicators" style="display:none;">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
					<li data-target="#myCarousel" data-slide-to="3" class=""></li>
					<li data-target="#myCarousel" data-slide-to="4"></li>
					<li data-target="#myCarousel" data-slide-to="5"></li>
				</ol>
				<div class="carousel-inner">
					<div class="item active">
						<img src="${basePath }static/upload/sysImgs/cover_350_1.jpg" alt="" class="img-responsive">
						<div class="carousel-caption">
							<h4></h4>
							<p></p>
						</div>
					</div>
					<div class="item">
						<img src="${basePath }static/upload/sysImgs/cover_350_2.jpg" alt="" class="img-responsive">
						<div class="carousel-caption">
							<h4></h4>
							<p></p>
						</div>
					</div>
					<div class="item">
						<img src="${basePath }static/upload/sysImgs/cover_350_3.jpg" alt="" class="img-responsive">
						<div class="carousel-caption">
							<h4></h4>
							<p></p>
						</div>
					</div>
					<div class="item">
						<img src="${basePath }static/upload/sysImgs/cover_350_4.jpg" alt="" class="img-responsive">
						<div class="carousel-caption">
							<h4></h4>
							<p></p>
						</div>
					</div>
					<div class="item">
						<img src="${basePath }static/upload/sysImgs/cover_350_5.jpg" alt="" class="img-responsive">
						<div class="carousel-caption">
							<h4></h4>
							<p></p>
						</div>
					</div>
					<div class="item">
						<img src="${basePath }static/upload/sysImgs/cover_350_6.jpg" alt="" class="img-responsive">
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
		<!-- <hr> -->
		<br>

		<div id="sub" class="container" style="overflow: hidden;background-color: #F7F7F7;">
			<div class="row rolDiv" style="overflow: hidden;position: relative;width:720px;height:120px;">
				<div class="test  col-xs-4 col-sm-4 col-md-4 show" id="0">
					<img src="${basePath }static/upload/sysImgs/cover_min_1.jpg"
						class="img-responsive border5px border5px_select" alt="" style="margin-bottom: 15px;margin-top: 15px;">
						<span class="glyphicon glyphicon-ok-circle hidden" style="position: absolute;right:20px;top:10px;color: white;margin-bottom: 15px;"></span>
				</div>
				<div class="test  col-xs-4 col-sm-4 col-md-4 show"  id="1">
					<img src="${basePath }static/upload/sysImgs/cover_min_2.jpg"
						class="img-responsive border5px " alt="" style="margin-bottom: 15px;margin-top: 15px;">
						<span class="glyphicon glyphicon-ok-circle hidden" style="position: absolute;right:20px;top:10px;color: white;margin-bottom: 15px;"></span>
				</div>
				<div class="test   col-xs-4 col-sm-4 col-md-4 show"  id="2">
					<img src="${basePath }static/upload/sysImgs/cover_min_3.jpg"
						class="img-responsive border5px" alt="" style="margin-bottom: 15px;margin-top: 15px;">
						<span class="glyphicon glyphicon-ok-circle hidden" style="position: absolute;right:20px;top:10px;color: black;margin-bottom: 15px;"></span>
				</div>
				
				<div class="test   col-xs-4 col-sm-4 col-md-4 " id="3">
					<img src="${basePath }static/upload/sysImgs/cover_min_4.jpg"
						class="img-responsive border5px" alt="" style="margin-bottom: 15px;margin-top: 15px;">
						<span class="glyphicon glyphicon-ok-circle hidden" style="position: absolute;right:20px;top:10px;color: white;margin-bottom: 15px;"></span>
				</div>
				<div class="test   col-xs-4 col-sm-4 col-md-4 "  id="4">
					<img src="${basePath }static/upload/sysImgs/cover_min_5.jpg"
						class="img-responsive border5px" alt="" style="margin-bottom: 15px;margin-top: 15px;">
						<span class="glyphicon glyphicon-ok-circle hidden" style="position: absolute;right:20px;top:10px;color: white;margin-bottom: 15px;"></span>
				</div>
				<div class="test   col-xs-4 col-sm-4 col-md-4 "  id="5">
					<img src="${basePath }static/upload/sysImgs/cover_min_6.jpg"
						class="img-responsive border5px" alt="" style="margin-bottom: 15px;margin-top: 15px;">
						<span class="glyphicon glyphicon-ok-circle hidden" style="position: absolute;right:20px;top:10px;color: black;margin-bottom: 15px;"></span>
				</div>
			</div>

		</div>
	
		<!-- <div style="overflow: hidden;width:100%;">
			<div style="overflow: hidden;width:800px;height:100px;">
				<div style="width:100px;height:100px;background: #333 none;float:left;">
				</div>
				<div style="width:100px;height:100px;background: #999 none;float:left;">
				</div>
				<div style="width:100px;height:100px;background: #333 none;float:left;">
				</div>
				<div style="width:100px;height:100px;background: #999 none;float:left;">
				</div>
					<div style="width:100px;height:100px;background: #333 none;float:left;">
				</div>
					<div style="width:100px;height:100px;background: #999 none;float:left;">
				</div>
			</div>
		</div> -->
		

<div style="height:70px;" class="col-xs-12 col-sm-12 col-md-12">
</div>
<!-- <div class="col-xs-12 col-sm-12 col-md-12" style="padding: 0px;">
	<br>
	<button class="btn btn-primary btn-lg col-xs-12 col-sm-12 col-md-12" id="next" style="border-radius:0px;"> 下一步 </button>	
</div> -->

<!-- <div class="col-xs-12 col-sm-12 col-md-12 textCenter" style="position: fixed;top:auto; left: auto; right: auto;  bottom: 50px;padding: 0px;">
	  <button class="btn btn-primary btn-lg col-xs-12 col-sm-12 col-md-12" id="next" style="border-radius:0px;"> 下一步(H5)  </button>	
</div> -->
<div class="col-xs-12 col-sm-12 col-md-12 textCenter" style="position: fixed;top:auto; left: auto; right: auto;  bottom: 0px;padding: 0px;">
	  <button class="btn btn-primary btn-lg col-xs-12 col-sm-12 col-md-12" id="next2" style="border-radius:0px;"> 下一步  </button>	
</div>
<%@ include file="../common/MainJS.jsp"%>
<script src="${staticPath }/bootstrap-3.3.0/carousel.js"></script>
<script src="${staticPath}/js/jquery.mobile-1.4.5.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){
			
		$("#sub img").on("swipeleft",function() {
					$("div.rolDiv").animate({left:'-=120px'},"fast",function(){
						var leftStr = $("div.rolDiv").css("left");
						var left_num = leftStr.replace("px","");
						var left = Number(left_num);
						console.log(left);
						if(left < -360){
							$("div.rolDiv").animate({left:'-360px'},"fast");
						}
					});
					
					
				});
		$("#sub img").on("swiperight",function() {
			$("div.rolDiv").animate({left:'+=120px'},"fast",function(){
				var leftStr = $("div.rolDiv").css("left");
				var left_num = leftStr.replace("px","");
				var left = Number(left_num);
				console.log(left);
				console.log($("div.rolDiv").css("right"));
				if(left > 0){
					$("div.rolDiv").animate({left:'0px'},"fast");
				}
			});

		});

		//$('.carousel').carousel();
		$("#sub div.row div").click(
				function() {
					var id = $(this).attr("id");
					$("#coverImg").val((Number(id) + 1));
					$(".carousel-indicators li").eq(id).trigger("click");
					$(this).siblings().find("img").removeClass("border5px_select");
					$(this).find("img").addClass("border5px_select");
					//$(this).children("span.hidden").removeClass("hidden").addClass("show");
					$(this).siblings("div").children("span.show").removeClass(
							"show").addClass("hidden");
				});

		$("#next").click(
				function() {
					var coverImg = $("#coverImg").val();
					if (coverImg > 0) {
						var path = "${basePath}weixin/typeSetting?coverImg="
								+ coverImg;
						window.location.href = path;
					} else {
						layer.open({
							content : '请点击选择一张图片作为封面',
							btn : '我知道了'
						});
					}
				});
		$("#next2").click(
				function() {
					var coverImg = $("#coverImg").val();
					if (coverImg > 0) {
						var path = "${basePath}weixin/typeSetting2?coverImg="
								+ coverImg;
						window.location.href = path;
					} else {
						layer.open({
							content : '请点击选择一张图片作为封面',
							btn : '我知道了'
						});
					}
				});
	});
</script>


</body>
</html>
