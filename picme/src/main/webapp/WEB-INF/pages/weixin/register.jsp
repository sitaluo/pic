<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ include file="../common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>影集制作</title>
<%@ include file="../common/GTIncludeHead.jsp"%>

<style type="text/css">
.margin0px{
	margin: 0px;
}

.margin0px div{
	margin: 0px;
	padding: 0px;
}
</style>
</head>
<body class="" id="body">
<div class="" style="padding:10px;">
	<img src="${basePath }static/upload/sysImgs/Rectangle.png" style="height:16px;"> 填写基本信息
 </div>
 <div class="col-xs-12 col-sm-12 col-md-12">
<form role="form" id="form">
  <div class="form-group">
    <label for="person">姓名</label>
    <input type="text" class="form-control" name="name" id="name" placeholder="">
  </div>
  <div class="form-group">
    <label for="phone">手机号</label>
    <input type="text" class="form-control" name="phone" id="phone" placeholder="">
  </div>
  <div class="form-group">
    <label for="region">微信号</label>
    <input type="text" class="form-control" name="weixinNum" id="weixinNum" placeholder="">
  </div>
</form>
	</div>		
<div class="col-xs-12 col-sm-12 col-md-12" style="height:50px;"></div>
<div class="col-xs-12 col-sm-12 col-md-12" style="position: fixed;top:auto; left: auto; right: auto;  bottom: 0px;padding: 0px;">
	<button class="btn btn-primary btn-lg col-xs-12 col-sm-12 col-md-12" id="next" style="border-radius:0px;"> 下一步  </button>	
</div>




<%@ include file="../common/MainJS.jsp"%>

<script type="text/javascript">
$(function(){
	$("#next").click(function(){
		var name = $("#name").val();
		var phone = $("#phone").val();
		var weixinNum = $("#weixinNum").val();
		if("" == name || "" == phone || "" == weixinNum){
			layer.open({
			    content: '请填写姓名,手机号和微信号'
			    ,btn: '确定'
			  });
			return;
		}
		var param = $("#form").serialize();
		$.ajax({
			type : "POST",
			data : param,
			dataType : "json",
			url : "${basePath}weixin/saveUser.json",
			success : function(resp, textStatus) {
				console.info(resp);
				if (1 == resp.ret_flag) {
					window.location.href = basePath + "weixin/selectCover";
				} else {
					
				}
			},
			error : function(request, textStatus, errorThrown) {
				layer.open({
				    content: '出错了'
				    ,skin: 'msg'
				    ,time: 1 //2秒后自动关闭
				  });
			}
		});
		
	});
	

});

//保存地址
function submitForm($btn) {
	console.log($("#addressForm").serialize());
	var param = $("#form").serialize();
	$.ajax({
		type : "POST",
		data : param,
		dataType : "json",
		url : "save.json",
		success : function(resp, textStatus) {
			console.info(resp);
			if (1 == resp.ret_flag) {
				$("#myModal").modal("hide");
				window.location.reload();
			} else {
				
			}
		},
		error : function(request, textStatus, errorThrown) {
			$("#myModal").modal("hide");
		}
	});
}
</script>

</body>
</html>