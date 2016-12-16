<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>影集制作</title>
<%@ include file="../../common/GTIncludeHead.jsp"%>
<%@ include file="../../common/taglibs.jsp"%>
<style type="text/css">
.img-responsive{
	display:block;
	max-height: 100%;
	width:auto;
	margin-top:auto;
	margin-bottom:auto;
	margin-left:auto;
	margin-right:auto;
	vertical-align: middle;
}
.marging15px{
	/* margin: 15px; */
	border: 1px solid gray;
}
.padding15px{
	padding: 15px;
}
.padding10px{
	padding: 10px;
}
.bd1{
	border: 1px solid gray;
}

</style>


</head>
<body class="" id="body">

<input type="hidden" name="albumId" id="albumId" value="${album.id }">
<input type="hidden" name="userId" id="userId" value="${current_user.id }">

<input type="hidden" name="coverImg" id="coverImg" value="">
<div class="" style="padding:10px;">
	<img src="${basePath }static/upload/sysImgs/Rectangle.png" style="height:16px;"> 查看影集
</div>  
<div id="step1_div" >
	<hr>
	<div class="col-xs-12 col-sm-12 col-md-12 padding10px">
	  <div class="col-xs-6 col-sm-6 col-md-6 padding15px bd1"><img src="${basePath }static/upload/sysImgs/back_cover.jpg" class="img-responsive" style="border:1px dashed gray;"></div>
	  <div class="col-xs-6 col-sm-6 col-md-6 padding15px bd1"><img src="${basePath }${paramTemp.coverImg }" class="img-responsive" style="border:1px dashed gray;"></div>
	  <div class="col-xs-12 col-sm-12 col-md-12"><span class="pull-left">封底</span><span class="pull-right">封面</span></div>
	</div>
	<hr>
	<div class="row col-xs-12 col-sm-12 col-md-12 select_img_div" id="select_img_div" style="margin: 0px 0px;padding:10px;">
		
		<c:forEach items="${paramTemp.imgList }" var="item" varStatus="i">
			<div class="tile col-xs-6 col-sm-6 col-md-6 marging15px " style="padding: 10px 10px;height:200px;">
				<!-- <div class="tile__name" ><span class="glyphicon glyphicon-edit imgEdit"></span></div> -->
				<div class="tile__list" style="height:inherit;padding-bottom: 20px;display:table;vertical-align:middle;max-height:180px;width:100%;">
					<span style="display:table-cell;vertical-align:middle;height:180px;width:0px;padding-bottom: 20px;">
						<img name="preview1 " src="${basePath }${item.thumbPath}"
						class="img-responsive  noPreImg" alt="">
					<input type="hidden" name="img_index" value="${i.index }"></span>
				</div>
			</div>
			<c:if test="${((i.index + 1)%2 eq 0) && (i.index gt 0) }">
				<div class="col-xs-12 col-sm-12 col-md-12 ignore pageNumDiv">
					<span class="pull-left">P0${i.index }</span><span class="pull-right">P0${i.index + 1}</span>
				</div>
			</c:if>
		</c:forEach>
	</div>
</div>
	
<div class="col-xs-12 col-sm-12 col-md-12" style="height:50px;"></div>

<%@include file="../../common/MainJS.jsp"%>

</body>
</html>
