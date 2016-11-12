<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page language="java" import="java.net.URLEncoder" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>影集制作</title>
</head>
<body style="width:100%;">
<%
String encode_url = java.net.URLEncoder.encode("http://beanbean.applinzi.com/weixin/code");
%>
<a href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx4ce2981befb8f07f&redirect_uri=<%=encode_url %>&response_type=code&scope=snsapi_userinfo&state=123#wechat_redirect">test</a>
index
==
${weiXinUser }
</body>
</html>
