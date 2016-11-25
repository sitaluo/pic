<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ page language="java" import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<title>影集制作</title>
<%@ include file="../common/GTIncludeHead.jsp"%>


</head>
<body class="col-xs-12">
<%
//String encode_url = java.net.URLEncoder.encode("http://beanbean.applinzi.com/weixin/code");
String encode_url = java.net.URLEncoder.encode("http://beanbean.tunnel.qydev.com/picme/weixin/code");
%>
${current_user.nickName }
<div class="portlet light">
	<div class="portlet-body">	
		<div class="row menu xol-xs-12 bg-grey" style="background-color:silver;">
			<div class="col-xs-4">上一步</div><div class="col-xs-4">选择封面</div><div class="col-xs-4">下一步</div>
		</div>
		
		<%-- <form action="${basePath }file/upload" enctype="multipart/form-data" method="post">
		</form>	 --%>
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
			
			<div class="form-group">
				<label for="name" class="col-xs-12  control-label">图片上传：</label>
				<div class="col-xs-12 ">
					<input name="id" value="${current_user.id }">
					<input name="file" type="file" class="form-control">
					<input type="submit" value="上传">
				</div>
			</div>
		
			<%-- <img alt="" src="${basePath }static/upload/imgs/1479199096067.jpg"> --%>
			
			<div class="form-group">
				<label for="name" class="col-xs-12  control-label">头像：</label>
				<div class="col-xs-12 ">
					<input name="img" class="form-control">
					<div class="errorDiv"></div>
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-xs-12   control-label">昵称：</label>
				<div class="col-xs-12 ">
					<input name="nickName" class="form-control">
					<div class="errorDiv"></div>
				</div>
			</div>
			<div class="form-group">
			    <label for="type" class="col-xs-12   control-label">姓名：</label>
			    <div class="col-xs-12 ">
			   	 <input name="name" class="form-control">
		   		 </div>
		   		 <div class="errorDiv"></div>
			  </div>
			
</div>
</div>
	<%@include file="../common/MainJS.jsp"%>
 <script type="text/javascript">
      function fileSelected() {
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
        var fd = new FormData();
        fd.append("id",1);
        fd.append("file", document.getElementById('fileToUpload').files[0]);
        var xhr = new XMLHttpRequest();
        xhr.upload.addEventListener("progress", uploadProgress, false);
        xhr.addEventListener("load", uploadComplete, false);
        xhr.addEventListener("error", uploadFailed, false);
        xhr.addEventListener("abort", uploadCanceled, false);
        xhr.open("POST", "${basePath }file/upload2");
        xhr.send(fd);
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
