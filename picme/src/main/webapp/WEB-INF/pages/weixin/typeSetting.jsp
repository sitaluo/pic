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

</style>


</head>
<body class="" id="body">

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
	<div class="col-xs-12 col-sm-12 col-md-12 padding10px">
	  <div class="col-xs-6 col-sm-6 col-md-6 padding15px bd1"><img src="${basePath }static/upload/sysImgs/back_cover.jpg" class="img-responsive" style="border:1px dashed gray;"></div>
	  <div class="col-xs-6 col-sm-6 col-md-6 padding15px bd1"><img src="${basePath }static/upload/sysImgs/${coverImg }.jpg" class="img-responsive" style="border:1px dashed gray;"></div>
	  <div class="col-xs-12 col-sm-12 col-md-12"><span class="pull-left">封底</span><span class="pull-right">封面</span></div>
	</div>
	<hr>
	<div class="row col-xs-12 col-sm-12 col-md-12 select_img_div" id="select_img_div" style="margin: 0px 0px;padding:10px;">
		
		<c:forTokens items="1,2,3,4,5,6" delims="," var="item" varStatus="i">
		   <div class="tile col-xs-6 col-sm-6 col-md-6 marging15px " style="padding: 10px 10px;height:200px;">
				<div class="tile__name"><span class="glyphicon glyphicon-edit imgEdit"></span></div>
				<div class="tile__list" style="height:inherit;padding-bottom: 20px;display:table;vertical-align:middle;max-height:180px;width:100%;">
					<span style="display:table-cell;vertical-align:middle;height:180px;width:0px;padding-bottom: 20px;">
						<img name="preview1 " src="${basePath }static/upload/sysImgs/noimg.png"
						class="img-responsive  noPreImg" alt="">
					<input type="hidden" name="img_index" value="${i.index }"></span>
				</div>
			</div>
			<c:if test="${((i.index + 1)%2 eq 0) && (i.index gt 0) }">
				<div class="col-xs-12 col-sm-12 col-md-12 ignore pageNumDiv">
					<span class="pull-left">P0${i.index }</span><span class="pull-right">P0${i.index + 1}</span>
				</div>
			</c:if>
		</c:forTokens>
		
	</div>
</div>
	
<div id="step2_div" class="hidden">
	<div class="" id="upload_img_div">
	  
	  <div id="upImgDiv1" class="col-xs-12 col-sm-12 col-md-12" style="padding:15px 0px;">
	  	<div class="col-xs-4 col-sm-4 col-md-4">
	  		<img name="up_preview1" src="${basePath }static/upload/sysImgs/noimg.png" class="img-responsive noPreImg" alt="">
	  		<input type="file" multiple name="file1" onchange="fileSelected(this);" class="hidden">
	  	</div>
	  	<div class="col-xs-6 col-sm-6 col-md-6 col-xs-offset-4" style="position: absolute;top:40%;">
	  			<div class="progress" id="progress1">
				  <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
				    <span class="" style="min-width:20px;">0% </span>
				  </div>
				</div>
				<div class="fileSize col-xs-2 col-sm-2 col-md-2"></div>
	  	</div>
	  	<div class="col-xs-2 col-sm-2 col-md-2 col-xs-offset-10" style="position: absolute;top:40%;"> 
	  		<span class="glyphicon glyphicon-ok hidden"></span>
	  		<input type="hidden" name="fileIndexOfArr" value="">
	  		<input type="hidden" name="order" value="">
	  		<span  class="btn btn-danger hidden reUpload" >重新上传</span>
	  	</div>
	  </div>
	  
	  <div  id="upImgDiv2" class="col-xs-12 col-sm-12 col-md-12" style="padding:15px 0px;">
	  	<div class="col-xs-4 col-sm-4 col-md-4">
	  		<img name="up_preview2" src="${basePath }static/upload/sysImgs/noimg.png" class="img-responsive noPreImg" alt="">
	  		<input type="file" multiple="multiple" name="file2" onchange="fileSelected(this);" class="hidden">
	  	</div>
	  	<div class="col-xs-6 col-sm-6 col-md-6 col-xs-offset-4" style="position: absolute;top:40%;">
	  			<div class="progress" id="progress2">
				  <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
				    <span class="" style="min-width:20px;">0% </span>
				  </div>
				</div>
				<div class="fileSize col-xs-12 col-sm-12 col-md-12"></div>
	  	</div>
	  	<div class="col-xs-2 col-sm-2 col-md-2 col-xs-offset-10" style="position: absolute;top:40%;"> 
	  		<span class="glyphicon glyphicon-ok-circle hidden"></span>
	  		<input type="hidden" name="fileIndexOfArr" value="">
	  		<input type="hidden" name="order" value="">
	  		<span  class="btn btn-danger hidden reUpload" >重新上传</span>
	  	</div>
	  </div>
	  <div id="upImgDiv3" class="col-xs-12 col-sm-12 col-md-12" style="padding:15px 0px;">
	  	<div class="col-xs-4 col-sm-4 col-md-4">
	  		<img name="up_preview3" src="${basePath }static/upload/sysImgs/noimg.png" class="img-responsive noPreImg" alt="">
	  		<input type="file" name="file3" onchange="fileSelected(this);" class="hidden">
	  	</div>
	  	<div class="col-xs-6 col-sm-6 col-md-6 col-xs-offset-4" style="position: absolute;top:40%;">
	  			<div class="progress" id="progress3">
				  <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
				    <span class="" style="min-width:20px;">0% </span>
				  </div>
				</div>
				<div class="fileSize col-xs-2 col-sm-2 col-md-2"></div>
	  	</div>
	  	<div class="col-xs-2 col-sm-2 col-md-2 col-xs-offset-10" style="position: absolute;top:40%;"> 
	  		<span class="glyphicon glyphicon-ok-circle hidden"></span>
	  		<input type="hidden" name="fileIndexOfArr" value="">
	  		<input type="hidden" name="order" value="">
	  		<span  class="btn btn-danger hidden reUpload" >重新上传</span>
	  	</div>
	  </div>
	  <div id="upImgDiv4" class="col-xs-12 col-sm-12 col-md-12" style="padding:15px 0px;">
	  	<div class="col-xs-4 col-sm-4 col-md-4">
	  		<img name="up_preview4" src="${basePath }static/upload/sysImgs/noimg.png" class="img-responsive noPreImg" alt="">
	  		<input type="file" name="file4" onchange="fileSelected(this);" class="hidden">
	  	</div>
	  	<div class="col-xs-6 col-sm-6 col-md-6 col-xs-offset-4" style="position: absolute;top:40%;">
	  		<div class="progress" id="progress4">
				  <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
				    <span class="" style="min-width:20px;">0% </span>
				  </div>
				</div>
				<div class="fileSize col-xs-2 col-sm-2 col-md-2"></div>
	  	</div>
	  	<div class="col-xs-2 col-sm-2 col-md-2 col-xs-offset-10" style="position: absolute;top:40%;"> 
	  		<span class="glyphicon glyphicon-ok-circle hidden"></span>
	  		<input type="hidden" name="fileIndexOfArr" value="">
	  		<input type="hidden" name="order" value="">
	  		<span  class="btn btn-danger hidden reUpload" >重新上传</span>
	  	</div>
	  </div>
	  <div id="upImgDiv5" class="col-xs-12 col-sm-12 col-md-12" style="padding:15px 0px;">
	  	<div class="col-xs-4 col-sm-4 col-md-4">
	  		<img name="up_preview5" src="${basePath }static/upload/sysImgs/noimg.png" class="img-responsive noPreImg" alt="">
	  		<input type="file" name="file5" onchange="fileSelected(this);" class="hidden">
	  	</div>
	  	<div class="col-xs-6 col-sm-6 col-md-6 col-xs-offset-4" style="position: absolute;top:40%;">
	  		<div class="progress" id="progress5">
				  <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
				    <span class="" style="min-width:20px;">0% </span>
				  </div>
				</div><div class="col-xs-2 col-sm-2 col-md-2">
					<span class="fileSize"></span>&nbsp;
					<span class="btn btn-danger btn-xs hidden reUpload" >重新上传</span>
				</div>
	  	</div>
	  	<div class="col-xs-2 col-sm-2 col-md-2 col-xs-offset-10" style="position: absolute;top:40%;"> 
	  		<span class="glyphicon glyphicon-ok-circle hidden"></span>
	  		<input type="hidden" name="fileIndexOfArr" value="">
	  		<input type="hidden" name="order" value="">
	  	</div>
	  </div>
	  <div id="upImgDiv6" class="col-xs-12 col-sm-12 col-md-12" style="padding:15px 0px;">
	  	<div class="col-xs-4 col-sm-4 col-md-4">
	  		<img name="up_preview6" src="${basePath }static/upload/sysImgs/noimg.png" class="img-responsive noPreImg" alt="">
	  		<input type="file" name="file6" onchange="fileSelected(this);" class="hidden">
	  	</div>
	  	<div class="col-xs-6 col-sm-6 col-md-6 col-xs-offset-4" style="position: absolute;top:40%;">
	  		<div class="progress" id="progress6">
				  <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
				    <span class="" style="min-width:20px;">0% </span>
				  </div>
			</div>
			<div class="fileSize col-xs-2 col-sm-2 col-md-2"></div>
	  	</div>
	  	<div class="col-xs-2 col-sm-2 col-md-2 col-xs-offset-10" style="position: absolute;top:40%;"> 
	  		<span class="glyphicon glyphicon-ok-circle hidden"></span>
	  		<input type="hidden" name="fileIndexOfArr" value="">
	  		<input type="hidden" name="order" value="">
	  		<span  class="btn btn-danger hidden reUpload" >重新上传</span>
	  	</div>
	  </div>
	  
	</div>	  
	  
</div>
<div class="col-xs-12 col-sm-12 col-md-12" style="height:50px;"></div>

<div class="col-xs-12 col-sm-12 col-md-12" style="position: fixed;top:auto; left: auto; right: auto;  bottom: 0px;padding: 0px;">
	<button class="btn btn-primary btn-lg col-xs-12 col-sm-12 col-md-12" id="batchFileBtn" style="border-radius:0px;"> 添加图片(0/6)  </button>	
 	<input id="batchFile" type="file" multiple name="file" onchange="fileBatchSelected(this);" class="hidden">
 	<input type="hidden" name="step" value="0">
</div>
<!-- 修改图片 -->
 <div id="modify_img_div" class="hidden" style="position: fixed;top:0px;height:100%;width:100;background-color: white;">
		<div style="padding: 20px;border: 1px solid grey;">
			<div style="border: 1px solid grey;">
				<img  id="modify_img" src="${basePath }static/upload/sysImgs/6.jpg"
				class="img-responsive" alt="">
			</div>
		</div>
		<div>
			<button id="modify_img_btn" class="modify_img_btn btn btn-link">更换图片</button>
			<button id="modify_img_cancel_btn" class="modify_img_cancel_btn btn btn-link">取消</button>
		</div>
		<input type="file" id="modify_img_file" onchange="modifyFileSelected(this);" class="hidden">
	</div> 

<%@include file="../common/MainJS.jsp"%>
<script type="text/javascript">
var MAX_PIC_NUM = 6;
var have_num = 0;
var index_2_file_arr = new Array();

var previewIndex = 0;
var upload_complete_num = 0;

function fileBatchSelected(fileInput){
	var files = fileInput.files;
	if((files.length + have_num) > MAX_PIC_NUM){
		layer.open({
		    content: "最大可选"+MAX_PIC_NUM+"张，超出的部分将会忽略"
		    ,btn: '我知道了'
		  });
	}
	//
	var needNum = MAX_PIC_NUM - have_num;
	var num = files.length > needNum ? needNum : files.length;
	console.log("files.length:" + files.length);
	console.log("have_num:"+have_num);
	console.log("num:"+num);
	for(var i=0; i < num; i++){
		var file = files[i];
		index_2_file_arr[have_num  + i] = file;
		
		var reader = new FileReader();
		var i2 = i;
		previewIndex = have_num + i2 + 1 ;
		var src = window.URL.createObjectURL(file);
		/* if (window.navigator.userAgent.indexOf("Chrome") >= 1 || window.navigator.userAgent.indexOf("Safari") >= 1) { 
			src = window.webkitURL.createObjectURL(file); 
		}else { 
			src = window.URL.createObjectURL(file); 
		} */
		var imgTemp = $("img[name^=preview].noPreImg").first();
        imgTemp.prop("src",src);
        imgTemp.removeClass("noPreImg");
      
	}
	
	have_num = have_num + num;
	$("#batchFileBtn").html("添加图片("+have_num + "/" + MAX_PIC_NUM + ")");
	if(have_num >= MAX_PIC_NUM){
		$("#batchFileBtn").html("立即上传");
		$("#batchFileBtn").parent("div").children("input[name=step]").val(1);
	}
}

function startUpload(){
	var imgIdxArr = new Array();
	var img_indexs = $("input[name=img_index]");
	var i = 0;
	img_indexs.each(function(){
		var t = $(this).val();//下标
		imgIdxArr[t] = i ++;//i 对应的order
	});
	console.log("imgIdxArr:");
	console.log(imgIdxArr);
	//index_2_file_arr
	for(var i=0; i< index_2_file_arr.length; i++){
		var divId = "upImgDiv"+ (i+1);
		var upImgDiv = $("#upImgDiv"+ (i+1));
		uploadFile(index_2_file_arr[i],upImgDiv,imgIdxArr[i],i);
	}
	
	
}

function uploadFile(file,upImgDiv,order,fileIndexOfArr) {
	
	if (file) {
        var fileSize = 0;
        if (file.size > 1024 * 1024)
          fileSize = (Math.round(file.size * 100 / (1024 * 1024)) / 100).toString() + 'MB';
        else
          fileSize = (Math.round(file.size * 100 / 1024) / 100).toString() + 'KB';
        upImgDiv.find(".fileSize").html(fileSize);
        //文件大小
	}
	
	//显示预览图
	var previewSrc = window.URL.createObjectURL(file)
	upImgDiv.find("img").prop("src",previewSrc);
	
	//上传
  var fd = new FormData();
  var userId = $("#userId").val();
  fd.append("userId",userId);
  var albumId = $("#albumId").val();
  if(!(albumId > 0)){
	  console.log("albumId不能为空");
	  return;
  }
  fd.append("albumId",albumId);
  fd.append("order",order);
  
  //fd.append("file", document.getElementById('fileToUpload').files[0]);
  fd.append("file", file);
  var xhr = new XMLHttpRequest();
  xhr.upload.addEventListener("progress", function(evt){
	  //上传进度
	  if (evt.lengthComputable) {
	      var percentComplete = Math.round(evt.loaded * 100 / evt.total);
	      //document.getElementById('progressNumber').innerHTML = percentComplete.toString() + '%';
	      var divPro = upImgDiv.find(".progress-bar");
	      divPro.attr("style","width:"+percentComplete.toString() + '%');
	      divPro.children("span").html(percentComplete.toString() + '%');
	      
	      if("100" == percentComplete.toString()){
	    	  //上传完成
	    	  upImgDiv.find(".glyphicon").addClass("glyphicon-ok-circle").removeClass("glyphicon-remove-circle").addClass("show").removeClass("hidden");
	    	  upImgDiv.find(".reUpload").addClass("hidden").removeClass("show");
	    	  upload_complete_num ++;
	    	  if(upload_complete_num >= MAX_PIC_NUM){
	    		  layer.open({
	    			    content: '全部上传成功'
	    			    ,skin: 'msg'
	    			    ,time: 2 //2秒后自动关闭
	    			  });
	    		  $("input[name=step]").val(3);
	    		  $("#batchFileBtn").html("下一步");
	    	  }
	    	  
	      }
	      
	    }
	    else {
	      //document.getElementById('progressNumber').innerHTML = 'unable to compute';
	    }
  }, false);
  xhr.addEventListener("load", function(evt){
	  //上传完成
	  var restResult = evt.target.responseText;
  }, false);
  xhr.addEventListener("error", function(evt){
	  console.log("error:");
	  console.log(evt);
	  //上传失败
	  // alert("There was an error attempting to upload the file.");
	  upImgDiv.find(".glyphicon").addClass("glyphicon-remove-circle").removeClass("glyphicon-ok-circle").addClass("show").removeClass("hidden");
	  upImgDiv.find(".reUpload").addClass("show").removeClass("hidden");
  }, false);
  xhr.addEventListener("abort", function(evt){
	  //上传被取消了
	  console.log("abort:");
	  console.log(evt);
	  //alert("The upload has been canceled by the user or the browser dropped the connection.");
	  upImgDiv.find(".glyphicon").addClass("glyphicon-remove-circle").removeClass("glyphicon-ok-circle").addClass("show").removeClass("hidden");
	  upImgDiv.find(".reUpload").addClass("show").removeClass("hidden");
  }, false);
  xhr.open("POST", "${basePath }file/upload2");
  xhr.send(fd);
}

var $imgEdit = null;

function showModifyImgDiv(){
	$("#modify_img_div").addClass("show").removeClass("hidden");
}
function hiddenModifyImgDiv(){
	$("#modify_img_div").addClass("hidden").removeClass("show");
}

$(function(){
	$("#modifyBtnTest").click(function(){
		$("#modify_img_div").addClass("show").removeClass("hidden");
	});
	
	//修改图片start
	
	$(".imgEdit").click(function(){
		$imgEdit =  $(this);
		showModifyImgDiv();
	});
	$(".modify_img_cancel_btn").click(function(){
		hiddenModifyImgDiv();
	 });
	$(".modify_img_btn").click(function(){
		$(this).parent().next().trigger("click");
	 });
	//修改图片end
	
	$("#batchFileBtn").click(function(){
		var step = $("input[name=step]").val();
		if(step == 0){
			//添加图片
			$("#batchFile").trigger("click");
		}
		if(step == 1){
			//准备上传
			 layer.open({
				    content: '亲，图片即将上传，影集返回将根据当前排版制作，确定要上传吗？'
				    ,btn: ['确定', '取消']
				    ,yes: function(index){
				    	startUpload();
				    	$("#batchFileBtn").html("上传中,请耐心等待...");
						$("#uploadingMsg").addClass("show").removeClass("hidden");
						$("#dragOrder").addClass("show").removeClass("hidden");
						$("#step1_div").addClass("hidden").removeClass("show");
						$("#step2_div").addClass("show").removeClass("hidden");
				      layer.close(index);
				      $("input[name=step]").val(2);
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
	
	$(".reUpload").click(function(){
		//重新上传
		var fileIndexOfArr = $(this).parent("div").children("input[name=fileIndexOfArr]").val();
		var order = $(this).parent("div").children("input[name=order]").val();
		var upImgDiv = $(this).parent("div").parent("div");
		if(Number(fileIndexOfArr) > 0 && Number(order) >= 0){
			uploadFile(index_2_file_arr[fileIndexOfArr],upImgDiv,order,fileIndexOfArr);
		}
	});
	
	//var el = document.getElementById('select_img_div');
	//new Sortable(el);
	//var e2 = document.getElementById('select_img_div');
	var sortable = new Sortable(select_img_div, {
		draggable: '.tile',
		handle: '.tile__list'
	});
	
});

//修改图片
function modifyFileSelected(fileInput){
	var file = fileInput.files[0];
	if(file){
		var src = window.URL.createObjectURL(file);
		$(fileInput).parent().find("img").attr("src",src);
		$imgEdit.parent().parent().find("img").attr("src",src);
		var index = $imgEdit.parent().parent().find("input[name=img_index]").val();
		if(Number(index) >= 0){
			index_2_file_arr[index] = file;
		}else{
			console.log("error:index必须大于等于0");
		}
		hiddenModifyImgDiv();
	}
}

function refreshPageNumDiv(){
	var pageNumDivs = $("#select_img_div").find(".pageNumDiv");
	var tirleDivs = $("#select_img_div").find(".tile");
	tirleDivs.each(function(i){
		var tirleDiv = $(this);
		if( (i +1) % 2 == 0){
			pageNumDivs.eq(((i+1)/2)-1).insertAfter(tirleDiv);
		}
	});
}
</script>
<script type="text/javascript" src="${basePath }static/js/Sortable.js"></script>
</body>
</html>
