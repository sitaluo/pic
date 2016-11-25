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

function aaa(){
	wx.chooseImage({
	    count: 8, // 默认9
	    sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有
	    sourceType: ['album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有
	    success: function (res) {
	        var localIds = res.localIds; // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
	        console.log(localIds);
	        for(var i = 0; i< localIds.length; i ++ ){
	        	//$("#img"+(i+1)).attr("src",localIds[i]);
	        	weixinUpload(localIds[i]);
	        }
	        
	    }
	});
}

function weixinUpload(localId){
	wx.uploadImage({
	    localId: localId, // 需要上传的图片的本地ID，由chooseImage接口获得
	    isShowProgressTips: 1, // 默认为1，显示进度提示
	    success: function (res) {
	        var serverId = res.serverId; // 返回图片的服务器端ID
	        console.log(serverId);
	        alert(serverId);
	    }
	});
}
</script>
<script type="text/javascript">
	$(function(){
		$("#select_img_div img").click(function(){
			var order = $(this).attr("name").replace("preview","");
			console.log(order);
			$("input[name=file"+order+"]").trigger("click");
		});
		
		$("#next").click(function(){
			var step = $("input[name=step]").val();
			if(step == 1){
				$("input[name=step]").val(2);
				$("#step1_div").addClass("hidden").removeClass("show");
				$("#step2_div").addClass("show").removeClass("hidden");
				
				$("input[type=file]").each(function(){
					var file = $(this)[0].files[0];
					var order = $(this).attr("name").replace("file","");
					if(file && file.name != null){
						console.log("to upload file:"+file.name);
						uploadFile(file,order);
					}else{
					}
				});
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

      function fileSelected(obj) {
    	 var fileName = obj.name; 
    	 var order = fileName.replace("file", "");
    	 console.log("fileName:"+fileName + ",order:"+order);
    	  
        //var file = document.getElementById('fileToUpload').files[0];
        file = obj.files[0];
        console.log(file);
        var filePath = file.value;
        console.log("filePath:"+filePath);
	      
		var previewImg = document.getElementsByName('preview'+order);
			var reader = new FileReader();
			reader.onloadend = function() {
				//img1.src = reader.result;
				for (var i = 0; i < previewImg.length; i++) {
					previewImg[i].src = reader.result;
				}
			}
			if (file) {
				reader.readAsDataURL(file);
			} else {
				//preview.src = "";
			}
	
			if (file) {
				var fileSize = 0;
				if (file.size > 1024 * 1024)
					fileSize = (Math.round(file.size * 100 / (1024 * 1024)) / 100)
							.toString()
							+ 'MB';
			else
				fileSize = (Math.round(file.size * 100 / 1024) / 100)
						.toString()
						+ 'KB';

			/* document.getElementById('fileName').innerHTML = 'Name: '
					+ file.name;
			document.getElementById('fileSize').innerHTML = 'Size: ' + fileSize;
			document.getElementById('fileType').innerHTML = 'Type: '
					+ file.type; */
		}
	}

	function uploadFile(file,order) {
		if(file && file.name != null){
		}else{
			return;
		}
		var fd = new FormData();
		fd.append("id", 1);
		//fd.append("file", document.getElementById('fileToUpload').files[0]);
		fd.append("file", file);
		var xhr = new XMLHttpRequest();
		xhr.upload.addEventListener("progress", function(evt){
			console.log(evt);
			if (evt.lengthComputable) {
				var percentComplete = Math.round(evt.loaded * 100 / evt.total);
				//document.getElementById('progressNumber').innerHTML = percentComplete.toString()+ '%';
				var progressDiv = $("#progress"+order);
				progressDiv.children("div").attr("style","width:"+percentComplete.toString()+"%");
				progressDiv.children("div").children("span").html(percentComplete.toString()+"%");
				if(percentComplete.toString() == "100"){
					progressDiv.parent("div").next("div").children("span").addClass("show").removeClass("hidden");
				}
			} else {
				//document.getElementById('progressNumber').innerHTML = 'unable to compute';
			}
			
		}, false);
		xhr.addEventListener("load", uploadComplete, false);
		xhr.addEventListener("error", uploadFailed, false);
		xhr.addEventListener("abort", uploadCanceled, false);
		xhr.open("POST", "${basePath }file/upload2");
		xhr.send(fd);
	}

	function uploadProgress(evt) {
		console.log(evt);
		if (evt.lengthComputable) {
			var percentComplete = Math.round(evt.loaded * 100 / evt.total);
			document.getElementById('progressNumber').innerHTML = percentComplete
					.toString()
					+ '%';
		} else {
			document.getElementById('progressNumber').innerHTML = 'unable to compute';
		}
	}

	function uploadComplete(evt) {
		/* This event is raised when the server send back a response */
		//alert(evt.target.responseText);
		var restResult = evt.target.responseText;
		console.log(restResult);
	}

	function uploadFailed(evt) {
		alert("There was an error attempting to upload the file.");
	}

	function uploadCanceled(evt) {
		alert("The upload has been canceled by the user or the browser dropped the connection.");
	}
</script>

</body>
</html>
