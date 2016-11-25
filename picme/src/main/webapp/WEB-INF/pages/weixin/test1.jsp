<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ page language="java" import="java.net.URLEncoder" %>
<%@ page language="java" import="com.picme.common.WeiXinApiUtils" %>
<%@ page language="java" import="com.picme.common.SHA1Utils" %>
<%@ page language="java" import="java.util.UUID" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>影集制作</title>
<%@ include file="../common/GTIncludeHead.jsp"%>
</head>
<body class="col-xs-12">
<input id="timestamp" type="hidden" value="${jsApiSign.get('timestamp')}" />
    <input id="noncestr" type="hidden" value="${jsApiSign.get('nonceStr')}" />
    <input id="signature" type="hidden" value="${jsApiSign.get('signature')}" />
     <input id="url" type="hidden" value="${jsApiSign.get('url')}" />

<%
//String encode_url = java.net.URLEncoder.encode("http://beanbean.applinzi.com/weixin/code");
String encode_url = java.net.URLEncoder.encode("http://beanbean.tunnel.qydev.com/picme/weixin/code");
%>
<br>
${current_user.nickName }
<br>
<a href="${basePath }weixin/selectCover">选择相片</a>
<br>
<br>
<a href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx4ce2981befb8f07f&redirect_uri=<%=encode_url %>&response_type=code&scope=snsapi_userinfo&state=123#wechat_redirect">test</a>
index22aaa
${current_user.nickName }
<br>
<a href="${basePath }file/toUpload">图片上传测试</a>
<a href="${basePath }weixin/typeSetting2">照片排版test</a>


<div class="portlet light">
	<div class="portlet-body">	
		<form action="${basePath }file/upload" enctype="multipart/form-data" method="post">
			<div class="form-group">
				<label for="name" class="col-xs-12  control-label">图片上传：</label>
				<div class="col-xs-12 ">
					<input name="id" value="${current_user.id }">
					<input name="file" type="file" class="form-control">
					<input type="submit" value="上传">
				</div>
			</div>
		</form>	
		<br>
		
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
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript">

/*
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
	//aaa();
});

function aaa(){
	wx.chooseImage({
	    count: 8, // 默认9
	    sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有
	    sourceType: ['album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有
	    success: function (res) {
	        var localIds = res.localIds; // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
	        console.log(localIds);
	    }
	});
}
*/
</script>

</body>
</html>
