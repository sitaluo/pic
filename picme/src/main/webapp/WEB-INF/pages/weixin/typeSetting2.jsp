<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>影集排版</title>
<%@ include file="../common/GTIncludeHead.jsp"%>

<style type="text/css">
body{
	text-align: center;
}
ol, ul { 
    list-style: none; 
}
ul li{
 float:left;
 padding: 1px;
}
.pos_left
{
	position:relative;
	float: left;
}
.width25p{
	width:25%;
}
.width50p{
	width:50%;
}
.width100p{
	width:100%;
}
.padding1Px{
	padding: 1px;
}
</style>
</head>
<body class="" id="body">
<input id="timestamp" type="hidden" value="${jsApiSign.get('timestamp')}" />
<input id="noncestr" type="hidden" value="${jsApiSign.get('nonceStr')}" />
<input id="signature" type="hidden" value="${jsApiSign.get('signature')}" />
<input id="url" type="hidden" value="${jsApiSign.get('url')}" />
     
<div class="width100p" style="background-color:silver;">
			<div class="col-xs-4 ">上一步</div><div class="col-xs-4">照片排版</div><div class="col-xs-4"><span>下一步</span></div>
</div>
<div id="main" class="width100p" style="width:400px;height:400px;">
	<div class="width50p padding1Px">
		<img alt="封面" src="${basePath }static/upload/sysImgs/3.jpg" style="width:100px;height:100px;">
	</div>
	<div class="width50p padding1Px">
		<img alt="封底" src="${basePath }static/upload/sysImgs/4.jpg" style="width:100px;height:100px;">
	</div>
</div>
<div id="sub" class="width100p" >
	<ul class="">
		<li class="width50p"><img id="img1" src="${basePath }static/upload/sysImgs/1.jpg" style="width:100px;height:100px;" alt="" />
		</li>
		<li class="width50p"><img id="img2" src="${basePath }static/upload/sysImgs/3.jpg" style="width:100px;height:100px;" alt="" />
		</li>
		<li class="width50p"><img src="${basePath }static/upload/sysImgs/4.jpg" style="width:100px;height:100px;" alt="" />
		</li>
		<li class="width50p"><img src="${basePath }static/upload/sysImgs/6.jpg" style="width:100px;height:100px;" alt="" />
		</li>
		<li class="width50p"><img src="${basePath }static/upload/sysImgs/6.jpg" style="width:100px;height:100px;" alt="" />
		</li>
	</ul>
</div>
<!-- THE END OF THE BANNER EXMAPLE -->
<form id="form1" enctype="multipart/form-data" method="post"
				action="${basePath }file/upload2">
				<div id="preview" class="col-xs-10" >
				</div>
				<div class="row">
					<label for="fileToUpload">Select a File to Upload</label><br /> <input
						type="file" name="fileToUpload" id="fileToUpload"
						onchange="fileSelected();" />
				</div>
				<div id="fileName"></div>
				<div id="fileSize"></div>
				<div id="fileType"></div>
				<div class="row">
					<input type="button" onclick="uploadFile()" value="Upload" />
				</div>
				<div id="progressNumber"></div>
			</form>


<%@include file="../common/MainJS.jsp"%>
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>

<script type="text/javascript">

 var timestamp = $("#timestamp").val();//时间戳
 var nonceStr = $("#noncestr").val();//随机串
 var signature = $("#signature").val();//签名
 var url = $("#url").val();
wx.config({
    debug: true, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
    appId: 'wx4ce2981befb8f07f', // 必填，公众号的唯一标识
    timestamp: timestamp, // 必填，生成签名的时间戳
    nonceStr: nonceStr, // 必填，生成签名的随机串
    signature: signature, // 必填，签名，见附录1
    jsApiList: ['chooseImage' ,'previewImage' ] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
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
	        for(var i = 0; i< localIds.length; i ++ ){
	        	alert(localIds[i]);
	        	$("#img"+(i+1)).attr("src",localIds[i]);
	        }
	       // $("#fileToUpload").value(localIds[0]);
	       
	        var imgFile = document.createElement("input");
	        alert(1+imgFile);
	        imgFile.setAttribute("value",localIds[0]);
	        imgFile.setAttribute("type","file");
	        imgFile.setAttribute("id","fileToUpload");
	        document.getElementById('body').appendChild(imgFile);
	        alert(imgFile.value);
	        fileSelected();
	        uploadFile();
	    }
	});
}


</script>
<script type="text/javascript">
function test(){
	var fileTemp = document.getElementById('fileToUpload--').files[0];
	  var imgFile = document.createElement("input");
      alert(1+imgFile);
      var valueTemp ;
      var flag = 0;
      var reader2 = new FileReader();
        reader2.onloadend = function () {
      	  valueTemp = reader2.result;
      	  flag = 1;
	       }
	       if (fileTemp) {
	           reader2.readAsDataURL(fileTemp);
	           for(var i =0;i< 1000; i++){
		    	   
		       }
	      } 
	     
	       
      imgFile.setAttribute("value",valueTemp);
      imgFile.setAttribute("type","file");
      imgFile.setAttribute("id","fileToUpload");
      document.getElementById('body').appendChild(imgFile);
      alert(imgFile.value);
      
}
      function fileSelected() {
    	  
	        //==
        var file = document.getElementById('fileToUpload').files[0];
        
        var filePath = file.value;
        var priviewDiv = document.getElementById('preview');
        var img1=new Image();
        priviewDiv.appendChild(img1);
        
       // var file = document.querySelector('input[type=file]').files[0];
            var reader = new FileReader();
                reader.onloadend = function () {
                	img1.src = reader.result;
             }
             if (file) {
                 reader.readAsDataURL(file);
            } else {
                preview.src = "";
            }
             img1.width = 200;
             img1.height = 200;
             
        if (file) {
          var fileSize = 0;
          if (file.size > 1024 * 1024)
            fileSize = (Math.round(file.size * 100 / (1024 * 1024)) / 100).toString() + 'MB';
          else
            fileSize = (Math.round(file.size * 100 / 1024) / 100).toString() + 'KB';

          document.getElementById('fileName').innerHTML = 'Name: ' + file.name;
          document.getElementById('fileSize').innerHTML = 'Size: ' + fileSize;
          document.getElementById('fileType').innerHTML = 'Type: ' + file.type;
        }
      }

      function uploadFile() {
    	  alert(1.5);
        var fd = new FormData();
        fd.append("id",1);
        fd.append("file", document.getElementById('fileToUpload').files[0]);
        alert(2+document.getElementById('fileToUpload').files[0]);
        var xhr = new XMLHttpRequest();
        xhr.upload.addEventListener("progress", uploadProgress, false);
        xhr.addEventListener("load", uploadComplete, false);
        xhr.addEventListener("error", uploadFailed, false);
        xhr.addEventListener("abort", uploadCanceled, false);
        xhr.open("POST", "${basePath }file/upload2");
        xhr.send(fd);
        alert(3);
      }

      function uploadProgress(evt) {
        if (evt.lengthComputable) {
          var percentComplete = Math.round(evt.loaded * 100 / evt.total);
          document.getElementById('progressNumber').innerHTML = percentComplete.toString() + '%';
        }
        else {
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
