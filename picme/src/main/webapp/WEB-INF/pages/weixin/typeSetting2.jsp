<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>影集排版</title>
<%@ include file="../common/GTIncludeHead.jsp"%>
<%@ include file="../common/taglibs.jsp"%>
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
.dashBorder{
  border: 1px dashed;
}
.touchImg{
	-webkit-touch-callout:none;
}
</style>
</head>
<body class="" id="body">

<input id="timestamp" type="hidden" value="${jsApiSign.get('timestamp')}" />
<input id="noncestr" type="hidden" value="${jsApiSign.get('nonceStr')}" />
<input id="signature" type="hidden" value="${jsApiSign.get('signature')}" />
<input id="url" type="hidden" value="${jsApiSign.get('url')}" />
<input id="appId" type="hidden" value="${jsApiSign.get('appId')}" />

<input type="hidden" name="albumId" id="albumId" value="${album.id }">
<input type="hidden" name="userId" id="userId" value="${current_user.id }">

<input type="hidden" name="coverImg" id="coverImg" value="">
<div class="" style="padding:10px;">
	<img src="${basePath }static/upload/sysImgs/Rectangle.png" style="height:16px;"> 影集排版
</div>  
<div class="col-xs-12 col-sm-12 col-md-12">
	  	<p id="dragOrder">亲，拖动图片可以调整页面顺序</p>
	  	<p id="uploadingMsg" class="hidden">亲，图片上传ing，请勿关闭应用，且保持网络畅通</p>
	  	<p id="uploadCompleteMsg" class="hidden">亲，图片已经全部上传成功</p>
	  </div>
<div id="step1_div" >
	  
	<hr>
	<div class="col-xs-12 col-sm-12 col-md-12 padding10px" style="background-color: #F7F7F7;">
	  <div class="col-xs-6 col-sm-6 col-md-6 padding15px "><img src="${basePath }static/upload/sysImgs/cover_350_${coverImg }.jpg" class="img-responsive" style="border:0px dashed gray;"></div>
	  <div class="col-xs-6 col-sm-6 col-md-6 padding15px "><img src="${basePath }static/upload/sysImgs/back_cover.jpg" class="img-responsive" style="border:0px dashed gray;"></div>
	  <div class="col-xs-12 col-sm-12 col-md-12"><span class="pull-left">封面</span><span class="pull-right">封底</span></div>
	</div>
	<hr>
	<div class="row col-xs-12 col-sm-12 col-md-12 select_img_div" id="select_img_div" style="margin: 0px 0px;padding:10px;">
		
		<c:forTokens items="1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24" delims="," var="item" varStatus="i">
		   <div class="tile col-xs-6 col-sm-6 col-md-6 marging15px " style="padding: 10px 10px;height:200px;">
				<!-- <div class="tile__name" ><span class="glyphicon glyphicon-edit imgEdit"></span></div> -->
				<div class="tile__list" style="height:inherit;padding-bottom: 20px;display:table;vertical-align:middle;max-height:180px;width:100%;">
					<span style="display:table-cell;vertical-align:middle;height:180px;width:0px;padding-bottom: 20px;" class="touchSpan">
						<img name="preview${(i.index + 1)}" src="${basePath }static/upload/sysImgs/noimg.png"
						class="img-responsive noPreImg touchImg hidden" alt="">
						<img name="default${(i.index + 1)}" src="${basePath }static/upload/sysImgs/noimg.png"
						class="img-responsive defaultImg" alt="">
					</span>
					<input type="hidden" name="img_index" value="${i.index }">
				</div>
			</div>
			<c:if test="${((i.index + 1)%2 eq 0) && (i.index gt 0) }">
				<div class="col-xs-12 col-sm-12 col-md-12 ignore pageNumDiv" style="margin-bottom: 10px;">
					<c:if test="${i.index lt 10 }">
						<span class="pull-left">P0${ i.index }</span>
						<span class="pull-right">P0${ i.index + 1}</span>
					</c:if>
					<c:if test="${i.index gt 10 or i.index eq 10}">
						<span class="pull-left">P${ i.index }</span>
						<span class="pull-right">P${ i.index + 1}</span>
					</c:if>
				</div>
			</c:if>
		</c:forTokens>
		
	</div>
</div>
	
<div id="step2_div" class="hidden">
	<div class="" id="upload_img_div">
	  <c:forTokens items="1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24" delims="," var="item" varStatus="i">
	  <div id="upImgDiv${i.index }" class="col-xs-12 col-sm-12 col-md-12" style="padding:15px 0px;">
	  	<div class="col-xs-5 col-sm-5 col-md-5" >
	  		<img name="up_preview" src="${basePath }static/upload/sysImgs/noimg_min.png" class="img-responsive noPreImg tempPreImg" alt="" style="max-height:100px;">
	  		<input type="file" multiple name="file1" onchange="fileSelected(this);" class="hidden" >
	  	</div>
	  	<div class="col-xs-7 col-sm-7 col-md-7 col-xs-offset-7" style="position: absolute;top:40%;"> 
	  		<span class="text_msg">上传中...</span>
	  		<span class="glyphicon glyphicon-ok-circle hidden" style="color:green;"></span>
	  		<span class="glyphicon glyphicon-remove-circle hidden" style="color:red;"></span>
	  		<input type="hidden" name="fileIndexOfArr" value="">
	  		<input type="hidden" name="order" value="${i.index }">
	  		<input type="hidden" name="localId" value="">
	  		<input type="hidden" name="serverId" value="">
	  		<!-- <span  class="btn btn-danger hidden reUpload" >重新上传</span> -->
	  		<span class="glyphicon glyphicon-repeat hidden reUpload" style="color:blue;"></span>
	  	</div>
	  </div>
	  </c:forTokens>
	  
	</div>	  
	  
</div>
<div class="col-xs-12 col-sm-12 col-md-12" style="height:50px;"></div>

<div class="col-xs-12 col-sm-12 col-md-12" style="position: fixed;top:auto; left: auto; right: auto;  bottom: 0px;padding: 0px;">
	<button class="btn btn-primary btn-lg col-xs-12 col-sm-12 col-md-12" id="batchFileBtn" style="border-radius:0px;"> 添加图片(0/24)  </button>	
 	<input id="batchFile" type="file" multiple name="file" onchange="fileBatchSelected(this);" class="hidden">
 	<input type="hidden" name="step" value="0">
</div>
<!-- 修改图片 -->
 <div id="modify_img_div" class="hidden" style="position: fixed;top:0px;height:100%;width:100%;background-color: white;text-align: center;">
		<div style="padding: 20px;border: 0px solid grey;max-height:380px;">
			<div style="border: 1px solid grey;height:350px;padding: 10px;">
				<img  id="modify_img" src="${basePath }static/upload/sysImgs/noimg.png"
				class="img-responsive" alt="" style="width:auto;max-height: 100%;">
			</div>
		</div>
		<div>
			<button id="modify_img_btn" class="modify_img_btn btn btn-primary">更换图片</button>
			<button id="modify_img_cancel_btn" class="modify_img_cancel_btn btn  btn-default">取消</button>
		</div>
		<input type="file" id="modify_img_file" onchange="modifyFileSelected(this);" class="hidden">
	</div> 

<%@include file="../common/MainJS.jsp"%>
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script src="${staticPath}/js/DragSort.js" type="text/javascript"></script>
<script src="${staticPath}/js/WeixinJsApi.js" type="text/javascript"></script>
<script src="${staticPath}/js/jquery.mobile-1.4.5.js" type="text/javascript"></script>
<!-- <script src="//cdn.bootcss.com/jquery-mobile/1.4.5/jquery.mobile.min.js" type="text/javascript"></script>
 -->
 
<script type="text/javascript">
var timestamp = $("#timestamp").val();//时间戳
var nonceStr = $("#noncestr").val();//随机串
var signature = $("#signature").val();//签名
var url = $("#url").val();
var appId = $("#appId").val();
//var appId = "wx4ce2981befb8f07f";

var images = {
		localIds:[],
		srverIds:[],
		flags:[],
		localId2serverIdMap:[],
		localId2uploadStateMap:[],
		serverId2uploadStateMap:[]
	};

function isAllSuccess(){
	return images.serverId2uploadStateMap.length == MAX_PIC_NUM;
}

WeixinJsApi.config(appId,timestamp,nonceStr,signature);

var MAX_PIC_NUM = 24;//24
var have_num = 0;
var index_2_file_arr = new Array();
var previewIndex = 0;
var upload_complete_num = 0;
var upload_fail_num = 0;
var loadingIndex = null;
var localIdArr = new Array();//

var isAlertError = false;//debug用

Array.prototype.contains = function ( needle ) {
	  for (i in this) {
	    if (this[i] == needle) return true;
	  }
	  return false;
	}
Array.prototype.contains2 = function ( needle ) {
	  for (i in this) {
	    if (this[i] == needle) return i;
	  }
	  return -1;
	}	
	
function aaa(){
	//localIdArr = null;
	
	wx.chooseImage({
	    count: 8, // 默认9
	    sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有
	    sourceType: ['album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有
	    success: function (res) {
	        var localIds = res.localIds; // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
	        console.log("选择图片："+localIds);
	        //alert(localIds.length + "-haveNum:" + have_num + "-MAX_PIC_NUM:" + MAX_PIC_NUM);
	        //var have_num = images.localIds.length;
	        if((localIds.length + have_num) > MAX_PIC_NUM){
	    		 layer.open({
	    		    content: "最大可选"+MAX_PIC_NUM+"张，超出的部分将会忽略"
	    		    ,btn: '我知道了'
	    		  }); 
	    	}
	        var needNum = MAX_PIC_NUM - have_num;
	    	var num = localIds.length > needNum ? needNum : localIds.length;
	    	
	    	var repeatNum = 0;
	        for(var i = 0; i< num; i ++ ){
	        	 //解决IOS无法上传的坑
		        if (localIds[i].indexOf("wxlocalresource") != -1) {
		        	localIds[i] = localIds[i].replace("wxlocalresource", "wxLocalResource");
		        }
	        	 if(!localIdArr.contains(localIds[i])){
		        	localIdArr.push(localIds[i]);
		        	images.localIds.push(localIds[i]);
		        	//$("img[name=preview"+(i+1)+"]").attr("src",localIds[i]);
		        	var imgTemp = $("img[name^=preview].noPreImg").first();
		        	imgTemp.removeClass("hidden");
		        	imgTemp.parent().children(".defaultImg").addClass("hidden");
		            imgTemp.prop("src",localIds[i]);
		            imgTemp.removeClass("noPreImg");
		            var imgTemp2 = $("img[name^=up_preview].noPreImg").first();
		            imgTemp2.prop("src",localIds[i]);
		            imgTemp2.removeClass("noPreImg");
	        	 }else{
	        		 repeatNum ++;
	        		 layer.open({
	        			    content: '选择了和之前相同的图片，请需要重新选择没有选过的图片'
	        			    ,btn: '我知道了'
	        			  });
	        	 }
	        }
	        
	        have_num = have_num + num - repeatNum;
	    	$("#batchFileBtn").html("添加图片("+have_num + "/" + MAX_PIC_NUM + ")");
	    	if(have_num >= MAX_PIC_NUM){
	    		$("#batchFileBtn").html("立即上传");
	    		$("#batchFileBtn").parent("div").children("input[name=step]").val(1);
	    	}
	    	//alert("选择图片2："+localIds);
	    },
	    fail:function(res){
	    	if(isAlertError){
	    		alert("选择图片失败"+JSON.stringify(res));
	    	}
	    	layer.open({
    		    content: "选择图片失败，请重新选择"
    		    ,btn: '确定'
    		  }); 
	    }
	});
}

var serverIdArr = new Array();
var uploadImgCompletedNum = 0;

function weixinUpload(localId,order,isShowLoading){
	var singleIndex;
	if(isShowLoading){ //单个上传进度  
		singleIndex = layer.open({
    	    type: 2,shadeClose: false,shade: 'background-color: rgba(0,0,0,.3)'
    	    ,content: '上传中'
    	  });
	}
	wx.uploadImage({
	    localId: localId, // 需要上传的图片的本地ID，由chooseImage接口获得
	    isShowProgressTips: 0, // 默认为1，显示进度提示
	    success: function (res) {
	        var serverId = res.serverId; // 返回图片的服务器端ID
	        images.localId2serverIdMap[localId] = serverId;
	        images.localId2uploadStateMap[localId] = 1;
	        
	        console.log("上传到微信服务器："+serverId);
	        order = Number(order);
	        //alert("上传到微信服务器："+serverId);
	        serverIdArr[order] = serverId;
	        $("#upImgDiv"+ order).find("input[name=serverId]").val(serverId);
	        if(isShowLoading){//单个上传进度
				layer.close(singleIndex);
			}
	        downloadAndUploadImg(serverId,order);
	        
	    },
		fail:function (res) {
			if(isAlertError){
	    		alert("wx.uploadImage fail:"+JSON.stringify(res));
	    	}
			if(isShowLoading){//单个上传进度
				layer.close(singleIndex);
				layer.open({
				    content: '上传失败,请稍后重试'
				    ,skin: 'msg'
				    ,time: 2 //2秒后自动关闭
				  });
			}
			//alert("weixinupload fail:"+order+ ";"+JSON.stringify(res));
			$("#upImgDiv"+ order).find(".glyphicon-ok-circle").addClass("hidden").removeClass("show");
			$("#upImgDiv"+ order).find(".glyphicon-repeat").addClass("show").removeClass("hidden");
			$("#upImgDiv"+ order).find(".text_msg").html("上传失败");
			$("#upImgDiv"+ order).find("input[name=localId]").val(localId);
			upload_fail_num ++;
			checkLoading();
		}
	});
}

/**
 * 上传一个文件到自己的服务器
 */
function downloadAndUploadImg(serverId,order,isShowLoading){
	var singleIndex;
	if(isShowLoading){//单个上传进度
		singleIndex = layer.open({
    	    type: 2,shadeClose: false,shade: 'background-color: rgba(0,0,0,.3)'
    	    ,content: '上传中'
    	  });
	}
	var albumId = $("#albumId").val();
	var userId = $("#userId").val();
	if(userId > 0 && albumId > 0){
	}else{
		console.log("userId，albumId不能为空");	
	}
	var dataStr = "mediaId="+serverId + "&userId=" + userId + "&albumId=" + albumId+"&order="+order;
	
	$.ajax({
		type : "POST",
		data : dataStr,
		dataType : "json",
		url : "${basePath }download/tmpFile.json",
		success : function(resp, textStatus) {
			//console.info(resp);
			if (1 == resp.ret_flag) {
				//alert(order +"-success");
				images.serverId2uploadStateMap[serverId] = 1;//1成功
				console.log("上传到服务器");
				if(isShowLoading){//单个上传进度
					layer.close(singleIndex);
				}
				$("#upImgDiv"+ order).find(".glyphicon-ok-circle").addClass("show").removeClass("hidden");
				$("#upImgDiv"+ order).find(".glyphicon-repeat").addClass("hidden").removeClass("show");
				$("#upImgDiv"+ order).find(".text_msg").html("上传成功");
				 upload_complete_num ++;
				if(loadingIndex != 0){//全局进度
					layer.close(loadingIndex);
				}
				//alert(loadingIndex);
				loadingIndex = layer.open({
		    	    type: 2,shadeClose: false,shade: 'background-color: rgba(0,0,0,.3)'
		    	    ,content: "上传中("+upload_complete_num+"/"+MAX_PIC_NUM+")"
		    	  });
				//alert("上传到服务器");
			} else {
				$("#upImgDiv"+ order).find(".glyphicon-ok-circle").addClass("hidden").removeClass("show");
				$("#upImgDiv"+ order).find(".glyphicon-repeat").addClass("show").removeClass("hidden");
				$("#upImgDiv"+ order).find(".text_msg").html("上传失败");
				console.log("上传到服务器失败了");
				upload_fail_num ++;
				if(isAlertError){
		    		alert(JSON.stringify(res));
		    	}
				if(isAlertError){
		    		alert("下载图片失败："+JSON.stringify(errorThrown));
		    	}
			}
			
			checkLoading();
			
			if(isShowLoading){//单个上传进度
				upload_fail_num --;//重新上传成功后失败的减少
				layer.close(singleIndex);
			}
		},
		error : function(request, textStatus, errorThrown) {
			$("#upImgDiv"+ order).find(".glyphicon-ok-circle").addClass("hidden").removeClass("show");
			$("#upImgDiv"+ order).find(".glyphicon-repeat").addClass("show").removeClass("hidden");
			$("#upImgDiv"+ order).find(".text_msg").html("上传失败");
			upload_fail_num++;
			checkLoading();
			if(isShowLoading){//单个上传进度
				layer.close(singleIndex);
			}
			console.log("网络连接失败");
			if(isAlertError){
	    		alert("下载图片 网络连接失败"+JSON.stringify(errorThrown));
	    	}
		}
	});
}

function checkLoading(){
	 if(upload_complete_num + upload_fail_num >= MAX_PIC_NUM){
		  
		  layer.close(loadingIndex);
		  //if(upload_complete_num >= MAX_PIC_NUM){
		if(isAllSuccess){
   		  layer.open({
   			    content: '全部上传成功'
   			    ,skin: 'msg'
   			    ,time: 2 //2秒后自动关闭
   			  });
   		  $("input[name=step]").val(3);
   		  $("#batchFileBtn").html("下一步");
   		  $("#uploadingMsg").addClass("hidden").removeClass("show");
			  $("#uploadCompleteMsg").addClass("show").removeClass("hidden");
		  }
	  }
}

$(function(){
	/* $(".touchImg").click(function(){
		alert("click");
	}); */
	
	
	$(".reUpload").click(function(){
		//重新上传
		var order = $(this).parent("div").children("input[name=order]").val();
		var upImgDiv = $(this).parent("div").parent("div");
		//var serverId = upImgDiv.find("input[name=serverId]").val();
		//var localId = upImgDiv.find("input[name=localId]").val();
		var serverId = serverIdArr[Number(order)];
		var localId = localIdArr[Number(order)];
		if(serverId != null && serverId != ""){
			downloadAndUploadImg(serverId,order,true);
		}else if(localId != null && localId != ""){
			//alert("weixinUpload(localId,order)" + localId + ","+order);
			weixinUpload(localId,order,true);
		}
	});
	
	var isFirstChoose = false;
	$("#batchFileBtn").click(function(){
		var step = $("input[name=step]").val();
		
		if(step == 0){
			//添加图片
			//$("#batchFile").trigger("click");
			if(isFirstChoose){
				isFirstChoose  = false;
				var idx =  layer.open({
					    content: '温馨提示：为保障印刷质量，选择图片后请依次点击屏幕下方“预览”、“原图”、“完成”按钮'
					    ,btn: ['我知道了']
					    ,yes: function(index){
					    	//aaa();
					    	layer.close(idx);
					    	aaa();
					    }
					  });
			}else{
				aaa();
			}
			
			
		}
		if(step == 1){
			//准备上传
			 layer.open({
				    content: '亲，图片即将上传，影集返回将根据当前排版制作，确定要上传吗？'
				    ,btn: ['确定', '取消']
				    ,yes: function(index){
				    	//startUpload();
				    	
				    	$("#batchFileBtn").html("上传中,请耐心等待...");
						$("#uploadingMsg").addClass("show").removeClass("hidden");
						$("#dragOrder").addClass("show").removeClass("hidden");
						$("#step1_div").addClass("hidden").removeClass("show");
						$("#dragOrder").addClass("hidden").removeClass("show");
						$("#step2_div").addClass("show").removeClass("hidden");
				      layer.close(index);
				      
				      loadingIndex = layer.open({
				    	    type: 2,shadeClose: false,shade: 'background-color: rgba(0,0,0,.3)'
				    	    ,content: '上传中(0/24)'
				    	  });
				      
				      var orderArr = [];
				      var order2LocalId = [];
				      $(".touchImg").each(function(j){
				    	  var img = $(this);
				    	  orderArr[img.attr("src")] = j;
				    	  order2LocalId[j] = img.attr("src");
				    	  $("img[name=up_preview]").eq(j).attr("src",order2LocalId[j]);
				      });
				      if(orderArr.length != 24){
				    	  console.log("error:order");
				      }
				      $(".tempPreImg").each(function(j){
				    	  $(this).attr("src",order2LocalId[j]);
				      });
				      
				      $("input[name=step]").val(2);
				      //alert("localIdArr:"+localIdArr.length + "="+localIdArr + "---" + localIdArr[0]);
						$("#uploadingMsg").addClass("show").removeClass("hidden");
						for( var i = 0; i< localIdArr.length; i++){
							weixinUpload(localIdArr[i], orderArr[localIdArr[i]]);
						}
				   }
			  });
		}
		if(step == 3){
			//跳转到下一页
			var albumId =$("#albumId").val();
			if(albumId > 0){
				window.location.href="${basePath}weixin/address/list?albumId="+albumId;
			}else{
				alert("出错了，请刷新页面重试");
			}
		}
	});
	
//修改图片start
	$(".modify_img_cancel_btn").click(function(){
		//取消修改图片
		hiddenModifyImgDiv();
	 });
	$(".modify_img_btn").click(function(){
		//修改图片
		console.log($(this).parent().next());
		//$("#modify_img_file").trigger("click");//原生input file选择图片
		wx.chooseImage({
		    count: 1, // 默认9
		    sizeType: ['original'], // 可以指定是原图还是压缩图，默认二者都有
		    sourceType: ['album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有
		    success: function (res) {
		        var localIds = res.localIds; // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
		        console.log("选择图片："+localIds);
		       if(localIds.length > 0){
		    	   var localId = localIds[0];
		    	 //解决IOS无法上传的坑
			        if (localId.indexOf("wxlocalresource") != -1) {
			        	localId = localId.replace("wxlocalresource", "wxLocalResource");
			        }
		    		
			        if(!localIdArr.contains(localId)){
			        	 var oldLocalId = $currentEditImg.attr("src");
				    	 var indexOflocalId = localIdArr.contains2(oldLocalId);
				    	 if(indexOflocalId > -1){
				    		 //localIdArr.push(localId);
				    		 localIdArr[indexOflocalId] = localId;
					        	//images.localIds.push(localId);
					        	images.localIds[indexOflocalId] = localId;
					        	 $currentEditImg.attr("src",localId);
				    	 }else{
				    		 console.log("error:indexOflocalId>-1");
				    	 }
			        	
		        	 }else{
		        		 layer.open({
		        			    content: '选择了和之前相同的图片，需要重新选择没有选过的图片'
		        			    ,btn: '我知道了'
		        			  });
		        	 }
		    	  
		    	   hiddenModifyImgDiv();
		       }
		    },
		    fail:function(res){
		    	if(isAlertError){
		    		alert("选择图片失败"+JSON.stringify(res));
		    	}
		    	layer.open({
	    		    content: "选择图片失败，请重新选择"
	    		    ,btn: '确定'
	    		  }); 
		    }
		});
	 });
	//修改图片end
});

var $currentEditImg = null;
function showModifyImgDiv($imgCurrentEdit){
	$currentEditImg = $imgCurrentEdit;
	var src = $imgCurrentEdit.attr("src");
	$("#modify_img_div").find("img").attr("src",src);
	$("#modify_img_div").addClass("show").removeClass("hidden");
}
function hiddenModifyImgDiv(){
	$("#modify_img_div").addClass("hidden").removeClass("show");
}
//修改图片
var $imgEdit;
function modifyFileSelected(fileInput){
	var file = fileInput.files[0];
	if(file){
		var src = window.URL.createObjectURL(file);
		$(fileInput).parent().find("img").attr("src",src);
		var preImg = $imgEdit.parent().parent().find("img");
		preImg.attr("src",src);
		if(preImg.hasClass("noPreImg")){
			preImg.removeClass("noPreImg");
			have_num = have_num + 1;
			$("#batchFileBtn").html("添加图片("+have_num + "/" + MAX_PIC_NUM + ")");
		}
		var index = $imgEdit.parent().parent().find("input[name=img_index]").val();
		if(Number(index) >= 0){
			index_2_file_arr[index] = file;
		}else{
			console.log("error:index必须大于等于0");
		}
		hiddenModifyImgDiv();
	}
}

</script>


</body>
</html>
