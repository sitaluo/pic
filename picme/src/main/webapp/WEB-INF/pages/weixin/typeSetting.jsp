<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>影集排版</title>
<%@ include file="../common/GTIncludeHead.jsp"%>

<style type="text/css">
</style>
</head>
<body class="" id="body">

<input id="timestamp" type="hidden" value="${jsApiSign.get('timestamp')}" />
<input id="noncestr" type="hidden" value="${jsApiSign.get('nonceStr')}" />
<input id="signature" type="hidden" value="${jsApiSign.get('signature')}" />
<input id="url" type="hidden" value="${jsApiSign.get('url')}" />

<input type="hidden" name="albumId" id="albumId" value="${album.id }">
<input type="hidden" name="userId" id="userId" value="${current_user.id }">

<div class="" style="padding:10px;">
			<div class="col-xs-4 pull-left">上一步</div>
			<div class="col-xs-4">照片排版</div>
			<div class="col-xs-4 pull-right" id="next">下一步<input type="hidden" name="step" value="1"></div>
 			<input type="hidden" name="coverImg" id="coverImg" value="">
  </div>     
<div id="step1_div">
  
  <div class="row">
	  <div class="col-xs-12 col-sm-12 col-md-12">
	  	<p>亲，点击图片可以操作更换，拖动图片可以调整页面顺序</p>
	  	<p id="uploadingMsg" class="hidden">亲，图片上传ing，请勿关闭应用，且保持网络畅通</p>
	  	<p id="uploadCompleteMsg" class="hidden">亲，图片已经全部上传成功</p>
	  </div>
	
	</div>
	<hr>
	<div class="row">
	  <div class="col-xs-6 col-sm-6 col-md-6"><img src="${basePath }static/upload/sysImgs/1.jpg" class="img-responsive" alt=""></div>
	  <div class="col-xs-6 col-sm-6 col-md-6"><img src="${basePath }static/upload/sysImgs/${coverImg }.jpg" class="img-responsive" alt=""></div>
	  <div class="col-xs-12 col-sm-12 col-md-12"><span class="pull-left">封底</span><span class="pull-right">封面</span></div>
	</div>
	<hr>
	<div class="row" id="select_img_div">
		<div class="col-xs-6 col-sm-6 col-md-6" style="padding: 15px;0px;">
			<img name="preview1" src="${basePath }static/upload/sysImgs/noimg.png"
				class="img-responsive" alt="">
		</div>
		<div class="col-xs-6 col-sm-6 col-md-6" style="padding: 15px;0px;">
			<img name="preview2" src="${basePath }static/upload/sysImgs/noimg.png"
				class="img-responsive" alt="">
		</div>
		<div class="col-xs-6 col-sm-6 col-md-6" style="padding: 15px;0px;">
			<img name="preview3" src="${basePath }static/upload/sysImgs/noimg.png"
				class="img-responsive" alt="">
		</div>
		<div class="col-xs-6 col-sm-6 col-md-6" style="padding: 15px;0px;">
			<img  name="preview4" src="${basePath }static/upload/sysImgs/noimg.png"
				class="img-responsive" alt="">
		</div>
		<div class="col-xs-6 col-sm-6 col-md-6" style="padding: 15px;0px;">
			<img name="preview5"  src="${basePath }static/upload/sysImgs/noimg.png"
				class="img-responsive" alt="">
		</div>
		<div class="col-xs-6 col-sm-6 col-md-6" style="padding: 15px;0px;">
			<img  name="preview6" src="${basePath }static/upload/sysImgs/noimg.png"
				class="img-responsive" alt="">
		</div>
	</div>
</div>
	
<div id="step2_div" class="hidden">
	<div class="row">
	  <div class="col-xs-12 col-sm-12 col-md-12">
	  	<p>亲，图片上传ing，请勿关闭应用，且保持网络畅通</p>
	  </div>
	
	</div>
	<div class="row" id="upload_img_div">
	  
	  <div class="col-xs-12 col-sm-12 col-md-12" style="padding:15px;0px;">
	  	<div class="col-xs-4 col-sm-4 col-md-4">
	  		<img name="preview1" src="${basePath }static/upload/sysImgs/noimg.png" class="img-responsive" alt="">
	  		<input type="file" multiple name="file1" onchange="fileSelected(this);" class="hidden">
	  	</div>
	  	<div class="col-xs-6 col-sm-6 col-md-6 col-xs-offset-4" style="position: absolute;top:40%;">
	  		<div class="progress" id="progress1">
				  <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
				    <span class="" style="min-width:20px;">0% </span>
				  </div>
				</div>
	  	</div>
	  	<div class="col-xs-2 col-sm-2 col-md-2 col-xs-offset-10" style="position: absolute;top:40%;"> 
	  		<span class="glyphicon glyphicon-ok hidden"></span>
	  	</div>
	  </div>
	  
	  <div class="col-xs-12 col-sm-12 col-md-12" style="padding:15px;0px;">
	  	<div class="col-xs-4 col-sm-4 col-md-4">
	  		<img name="preview2" src="${basePath }static/upload/sysImgs/noimg.png" class="img-responsive" alt="">
	  		<input type="file" multiple="multiple" name="file2" onchange="fileSelected(this);" class="hidden">
	  	</div>
	  	<div class="col-xs-6 col-sm-6 col-md-6 col-xs-offset-4" style="position: absolute;top:40%;">
	  		<div class="progress" id="progress2">
				  <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
				    <span class="" style="min-width:20px;">0% </span>
				  </div>
				</div>
	  	</div>
	  	<div class="col-xs-2 col-sm-2 col-md-2 col-xs-offset-10" style="position: absolute;top:40%;"> <span class="glyphicon glyphicon-ok hidden"></span></div>
	  </div>
	  <div class="col-xs-12 col-sm-12 col-md-12" style="padding:15px;0px;">
	  	<div class="col-xs-4 col-sm-4 col-md-4">
	  		<img name="preview3" src="${basePath }static/upload/sysImgs/noimg.png" class="img-responsive" alt="">
	  		<input type="file" name="file3" onchange="fileSelected(this);" class="hidden">
	  	</div>
	  	<div class="col-xs-6 col-sm-6 col-md-6 col-xs-offset-4" style="position: absolute;top:40%;">
	  		<div class="progress" id="progress3">
				  <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
				    <span class="" style="min-width:20px;">0% </span>
				  </div>
				</div>
	  	</div>
	  	<div class="col-xs-2 col-sm-2 col-md-2 col-xs-offset-10" style="position: absolute;top:40%;"> <span class="glyphicon glyphicon-ok hidden"></span></div>
	  </div>
	  <div class="col-xs-12 col-sm-12 col-md-12" style="padding:15px;0px;">
	  	<div class="col-xs-4 col-sm-4 col-md-4">
	  		<img name="preview4" src="${basePath }static/upload/sysImgs/noimg.png" class="img-responsive" alt="">
	  		<input type="file" name="file4" onchange="fileSelected(this);" class="hidden">
	  	</div>
	  	<div class="col-xs-6 col-sm-6 col-md-6 col-xs-offset-4" style="position: absolute;top:40%;">
	  		<div class="progress" id="progress4">
				  <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
				    <span class="" style="min-width:20px;">0% </span>
				  </div>
				</div>
	  	</div>
	  	<div class="col-xs-2 col-sm-2 col-md-2 col-xs-offset-10" style="position: absolute;top:40%;"> <span class="glyphicon glyphicon-ok hidden"></span></div>
	  </div>
	  <div class="col-xs-12 col-sm-12 col-md-12" style="padding:15px;0px;">
	  	<div class="col-xs-4 col-sm-4 col-md-4">
	  		<img name="preview5" src="${basePath }static/upload/sysImgs/noimg.png" class="img-responsive" alt="">
	  		<input type="file" name="file5" onchange="fileSelected(this);" class="hidden">
	  	</div>
	  	<div class="col-xs-6 col-sm-6 col-md-6 col-xs-offset-4" style="position: absolute;top:40%;">
	  		<div class="progress" id="progress5">
				  <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
				    <span class="" style="min-width:20px;">0% </span>
				  </div>
				</div>
	  	</div>
	  	<div class="col-xs-2 col-sm-2 col-md-2 col-xs-offset-10" style="position: absolute;top:40%;"> <span class="glyphicon glyphicon-ok hidden"></span></div>
	  </div>
	  <div class="col-xs-12 col-sm-12 col-md-12" style="padding:15px;0px;">
	  	<div class="col-xs-4 col-sm-4 col-md-4">
	  		<img name="preview6" src="${basePath }static/upload/sysImgs/noimg.png" class="img-responsive" alt="">
	  		<input type="file" name="file6" onchange="fileSelected(this);" class="hidden">
	  	</div>
	  	<div class="col-xs-6 col-sm-6 col-md-6 col-xs-offset-4" style="position: absolute;top:40%;">
	  		<div class="progress" id="progress6">
				  <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
				    <span class="" style="min-width:20px;">0% </span>
				  </div>
				</div>
	  	</div>
	  	<div class="col-xs-2 col-sm-2 col-md-2 col-xs-offset-10" style="position: absolute;top:40%;"> <span class="glyphicon glyphicon-ok hidden"></span></div>
	  </div>
	  
	</div>	  
	  
</div>
	

<%@include file="../common/MainJS.jsp"%>
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript">
var timestamp = $("#timestamp").val();//时间戳
var nonceStr = $("#noncestr").val();//随机串
var signature = $("#signature").val();//签名
var url = $("#url").val();

wx.config({
   debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
   appId: 'wx4ce2981befb8f07f', // 必填，公众号的唯一标识
   timestamp: timestamp, // 必填，生成签名的时间戳
   nonceStr: nonceStr, // 必填，生成签名的随机串
   signature: signature, // 必填，签名，见附录1
   jsApiList: ['chooseImage' ,'previewImage','uploadImage','downloadImage'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
});

wx.ready(function(){
	console.log("配置信息检验完成");
	aaa();
});

var localIdArr = null;

function aaa(){
	localIdArr = null;
	
	wx.chooseImage({
	    count: 24, // 默认9
	    sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有
	    sourceType: ['album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有
	    success: function (res) {
	        var localIds = res.localIds; // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
	        console.log("选择图片："+localIds);
	        localIdArr = localIds;
	        for(var i = 0; i< localIds.length; i ++ ){
	        	$("img[name=preview"+(i+1)+"]").attr("src",localIds[i]);
	        }
	    }
	});
}

var serverIdArr = new Array();
var uploadImgCompletedNum = 0;

function weixinUpload(localId){
	wx.uploadImage({
	    localId: localId, // 需要上传的图片的本地ID，由chooseImage接口获得
	    isShowProgressTips: 1, // 默认为1，显示进度提示
	    success: function (res) {
	        var serverId = res.serverId; // 返回图片的服务器端ID
	        console.log("上传到微信服务器："+serverId);
	        //alert("上传到微信服务器："+serverId);
	        serverIdArr.push(serverId);
	        downloadAndUploadImg(serverId);
	    }
	});
}

/**
 * 上传一个文件到自己的服务器
 */
function downloadAndUploadImg(serverId){
	var albumId = $("#albumId").val();
	var userId = $("#userId").val();
	if(userId > 0 && albumId > 0){
	}else{
		console.log("userId，albumId不能为空");	
	}
	var dataStr = "mediaId="+serverId + "&userId=" + userId + "&albumId=" + albumId;
	
	$.ajax({
		type : "POST",
		data : dataStr,
		dataType : "json",
		url : "${basePath }download/tmpFile.json",
		success : function(resp, textStatus) {
			//console.info(resp);
			if (1 == resp.ret_flag) {
				console.log("上传到服务器");
				
				uploadImgCompletedNum = uploadImgCompletedNum + 1;
				if(uploadImgCompletedNum == serverIdArr.length){
					//上传完成
					$("#uploadingMsg").addClass("hidden").removeClass("show");
					$("#uploadCompleteMsg").addClass("show").removeClass("hidden");
				}
				//alert("上传到服务器");
			} else {
				console.log("上传到服务器失败了");
			}
		},
		error : function(request, textStatus, errorThrown) {
			console.log("网络连接失败");
		}
	});
}

$(function(){
	$("#next").click(function(){
		var step = $("input[name=step]").val();
		if(step == 1){
			$("input[name=step]").val(2);
			if(confirm("亲，图片即将上传，影集返回将根据当前排版制作，确定要上传吗？")){
				//alert("localIdArr:"+localIdArr.length + "="+localIdArr + "---" + localIdArr[0]);
				$("#uploadingMsg").addClass("show").removeClass("hidden");
				for( var i = 0; i< localIdArr.length; i++){
					weixinUpload(localIdArr[i]);
				}
			}
		}else{
			var albumId =$("#albumId").val();
			if(albumId > 0){
				window.location.href="${basePath}weixin/address/list?albumId="+albumId;
			}else{
				alert("出错了，请刷新页面重试");
			}
		}
		
	});
});

</script>

</body>
</html>
