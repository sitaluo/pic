<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>排序测试</title>
<%@ include file="../common/GTIncludeHead.jsp"%>
<style type="text/css">
.select_img_div div div{
}

.border1px{
 	border: 1px solid gray;
}
</style>
<script type="text/javascript" src="${basePath }static/js/Sortable.js"></script>
</head>
<body>
<ul id="items">
    <li>item 1</li>
    <li>item 2</li>
    <li>item 3</li>
</ul>
<div class="row select_img_div" id="select_img_div">
		<div class="col-xs-6 col-sm-6 col-md-6 border1px title" style="padding: 15px;0px;height:230px;">
			<div class="col-xs-12 col-sm-12 col-md-12 border1px my-handle" draggable="false" style="padding: 15px;0px;display: inline-block;">
			</div> <img name="preview1" src="${basePath }static/upload/sysImgs/1.jpg"
				class="img-responsive " alt="">
				
		</div>
		<div class="col-xs-6 col-sm-6 col-md-6 2 border1px title" style="padding: 15px;0px;height:230px;">
			<div class="col-xs-12 col-sm-12 col-md-12 border1px   my-handle" style="padding: 15px;0px;">
			</div><img name="preview2" src="${basePath }static/upload/sysImgs/noimg.png"
				class="img-responsive " alt="">
				
		</div>
		<div class="col-xs-6 col-sm-6 col-md-6 border1px title"  style="padding: 15px;0px;height:230px;">
			<div class="col-xs-12 col-sm-12 col-md-12 border1px  my-handle" style="padding: 15px;0px;">
			</div><img name="preview3" src="${basePath }static/upload/sysImgs/3.jpg"
				class="img-responsive" alt="">
		</div>
		<div class="col-xs-6 col-sm-6 col-md-6 border1px title" style="padding: 15px;0px;height:230px;">
			<div class="col-xs-12 col-sm-12 col-md-12 border1px my-handle" style="padding: 15px;0px;">
			</div><img  name="preview4" src="${basePath }static/upload/sysImgs/4.jpg"
				class="img-responsive" alt="">
		</div>
		<div class="col-xs-6 col-sm-6 col-md-6 border1px title" style="padding: 15px;0px;height:230px;">
			<div class="col-xs-12 col-sm-12 col-md-12 border1px  my-handle" style="padding: 15px;0px;">
			</div><img name="preview5"  src="${basePath }static/upload/sysImgs/5.jpg"
				class="img-responsive" alt=""></div>
		
		<div class="col-xs-6 col-sm-6 col-md-6 border1px title" style="padding: 15px;0px;height:230px;">
			<div class="col-xs-12 col-sm-12 col-md-12 border1px my-handle" style="padding: 15px;0px;">
			</div><img  name="preview6" src="${basePath }static/upload/sysImgs/6.jpg"
				class="img-responsive" alt="">
		</div>
	</div>
	
	
<div class="container">
		<div id="multi" style="margin-left: 30px">
			<!-- <div><div data-force="5" class="layer title title_xl">Multi</div></div> -->
				
				<div class="layer tile col-xs-6 col-sm-6 col-md-6" data-force="25" draggable="false">
					<span class="tile__name">Group B</span>
					<div class="tile__list">
						<img name="preview2" src="${basePath }static/upload/sysImgs/noimg.png"
					class="img-responsive " alt="">
					</div>
				</div>
				
				<div class="layer tile col-xs-6 col-sm-6 col-md-6" data-force="30" draggable="false">
					<div class="tile__name">Group A</div>
					<div class="tile__list">
						<img name="preview5"  src="${basePath }static/upload/sysImgs/5.jpg"
						class="img-responsive" alt="" draggable="false">
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-12 ignore pageNumDiv">
					<span class="pull-left">P01</span><span class="pull-right">P02</span>
				</div>
				<div class="layer tile col-xs-6 col-sm-6 col-md-6" data-force="20">
					<div class="tile__name">Group C</div>
					<div class="tile__list">
						<img name="preview5"  src="${basePath }static/upload/sysImgs/3.jpg"
						class="img-responsive" alt="" draggable="false">
					</div>
				</div>
				<div class="layer tile col-xs-6 col-sm-6 col-md-6" data-force="20">
					<div class="tile__name">Group C</div>
					<div class="tile__list">
						<img name="preview5"  src="${basePath }static/upload/sysImgs/2.jpg"
						class="img-responsive" alt="" draggable="false">
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-12 ignore pageNumDiv">
					<span class="pull-left">P03</span><span class="pull-right">P04</span>
				</div>
				<div class="layer tile col-xs-6 col-sm-6 col-md-6" data-force="20">
					<div class="tile__name">Group C</div>
					<div class="tile__list">
						<img name="preview5"  src="${basePath }static/upload/sysImgs/1.jpg"
						class="img-responsive" alt="" draggable="false">
					</div>
				</div>
				<div class="layer tile col-xs-6 col-sm-6 col-md-6" data-force="20">
					<div class="tile__name">Group C</div>
					<div class="tile__list">
						<img name="preview5"  src="${basePath }static/upload/sysImgs/4.jpg"
						class="img-responsive" alt="" draggable="false">
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-12 ignore pageNumDiv">
					<span class="pull-left">P05</span><span class="pull-right">P06</span>
				</div>
			</div>
		</div>
</body>
<%@include file="../common/MainJS.jsp"%>
<script type="text/javascript">
$(function(){
	$(".img-responsive").click(function(){
		alert($(this).attr("name"));
	});
	//var el = document.getElementById('items');
	//new Sortable(el);
		new Sortable(multi, {
				draggable: '.tile',
				handle: '.tile__list',
				ignore:'span,'
			});
		
	var e2 = document.getElementById('select_img_div');
	var sortable = new Sortable(select_img_div,{
	    handle: '.my-handle',
	    draggable: '. title'
	});
	/* [].forEach.call(e2.getElementsByClassName('my-handle'), function (el){
		new Sortable(el, { group: 'photo' });
	}); */
	var order = sortable.toArray();
	console.log(order);
});

function refreshPageNumDiv(){
	var pageNumDivs = $("#multi").find(".pageNumDiv");
	var tirleDivs = $("#multi").find(".tile");
	tirleDivs.each(function(i){
		var tirleDiv = $(this);
		if( (i +1) % 2 == 0){
			pageNumDivs.eq(((i+1)/2)-1).insertAfter(tirleDiv);
		}
	});
}
</script>

</html>