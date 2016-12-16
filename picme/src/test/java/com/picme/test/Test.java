package com.picme.test;

import java.io.File;
import java.io.IOException;

import com.picme.common.ImageUtils;

public class Test {

	public static void main(String[] args) throws IOException {
		/*String encode_url = java.net.URLEncoder.encode("http://picme.tunnel.qydev.com/picme/weixin/code");
		String appId= "wx4ce2981befb8f07f";  
		System.out.println(encode_url);  
		String utlwithtoken = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="+appId+"&redirect_uri="+encode_url+"&response_type=code&scope=snsapi_userinfo&state=123#wechat_redirect";
		System.out.println(utlwithtoken);*/
		//https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx4ce2981befb8f07f&redirect_uri=http%3A%2F%2Fpicme.tunnel.qydev.com%2Fpicme%2Fweixin%2Fcode&response_type=code&scope=snsapi_userinfo&state=123#wechat_redirect
		
		String path = "D:\\work\\picme\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\picme\\static\\upload\\imgs\\f02P9WVp-5nF4h9CfbrKu6EfImbUWQ-fWpLeT0vpkmsfiJmERR-vddOn49Zdlgnm.jpg";
		ImageUtils.thumbnail(new File(path), "D:/atest.jpg");
	}
}
