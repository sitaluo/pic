package com.picme.common;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.Map;

import org.apache.commons.httpclient.DefaultHttpMethodRetryHandler;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;

public class HttpClientUtils {
	
	public static String get(String url) {
		// 构造HttpClient的实例
		HttpClient httpClient = new HttpClient();
		// 创建GET方法的实例
		GetMethod getMethod = new GetMethod(url);
		// 使用系统提供的默认的恢复策略
		getMethod.getParams().setParameter(HttpMethodParams.RETRY_HANDLER,
				new DefaultHttpMethodRetryHandler());
		try {
			// 执行getMethod
			int statusCode = httpClient.executeMethod(getMethod);
			if (statusCode != HttpStatus.SC_OK) {
				System.err.println("Method failed: "
				+ getMethod.getStatusLine());
			}
			// 读取内容
			byte[] responseBody = getMethod.getResponseBody();
			// 处理内容
			String retStr = new String(responseBody); 
			System.out.println(retStr);
			return retStr;

		} catch (HttpException e) {
			// 发生致命的异常，可能是协议不对或者返回的内容有问题
			System.out.println("Please check your provided http address!");
			e.printStackTrace();
		} catch (IOException e) {
			// 发生网络异常
			e.printStackTrace();
		} finally {
			// 释放连接
			getMethod.releaseConnection();
		}
		return null;
	}

	public static String post(String url){
		HttpClient client = new HttpClient();
		//String url = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN";
		PostMethod method = new PostMethod(url);
		client.getParams().setContentCharset("UTF-8");
		method.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=UTF-8");

		NameValuePair[] data = {// 提交短信
		new NameValuePair("account", "xxx"),
				new NameValuePair("password", "xxx") };
		method.setRequestBody(data);
		try {
			client.executeMethod(method);
			String returnMsg = method.getResponseBodyAsString();
			System.out.println(returnMsg);
			return returnMsg;
		} catch (HttpException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void main(String[] args) {
		String access_tken = "iQaOVV6UFMoeoLmPGOHBVkGEvlmikOUVZOkwbV9QlNEVPUroLvMlRq3quatYxRbKsqCFjZfZ-LMOnBbJxWEXNv1IhfUCfGMvmEBm2w0ww-bLcN20WHhIyfMo45jX0SuvRUHfAEANQD";
		String url = "https://api.weixin.qq.com/cgi-bin/user/info?access_token="+access_tken+"&openid=OPENID&lang=zh_CN";
		WeiXinApiUtils.getAccessToken();
	}
}
