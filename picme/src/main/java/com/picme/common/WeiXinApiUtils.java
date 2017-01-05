package com.picme.common;

import java.util.LinkedHashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.picme.weixin.entity.WeiXinUser;

public class WeiXinApiUtils {
	
	static Logger logger = LoggerFactory.getLogger(WeiXinApiUtils.class);
	
	private static String APP_ID = ConfigUtils.getAppID();
	private static String APP_SECRET = ConfigUtils.getAppSecret();
	//private static String APP_ID = "wx4ce2981befb8f07f";
	//private static String APP_SECRET = "ba6ae35ed43f18f58a25ec820a6bef66";
	//AppID=wxfbac1520bb6bdf93
	//AppSecret=d8a4f3cdb10fc86fb5406b0d06f1a26a
	
	private static String ACCESS_TOKEN = null;
	private static Long LAST_GET_ACCESS_TOKEN_TIME = 0L;

	private static String JS_API_TICKET = null;
	private static Long LAST_GET_JS_API_TICKET_TIME = 0L;
	//https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=wxfbac1520bb6bdf93&secret=d8a4f3cdb10fc86fb5406b0d06f1a26a
	private static String GET_ACCESS_TOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=" + APP_ID + "&secret=" + APP_SECRET;

	//获取接口调用凭证
	public static synchronized String getAccessToken(){
		Long currentTimeSecond = System.currentTimeMillis();
		boolean  needRefresh = ((currentTimeSecond - LAST_GET_ACCESS_TOKEN_TIME) / 1000) - 7000 >= 0 ? true : false;
		System.out.println(needRefresh);
		if(ACCESS_TOKEN == null || needRefresh){
			String jsonStr = HttpClientUtils.get(GET_ACCESS_TOKEN_URL);
			LinkedHashMap<Object, Object> o = (LinkedHashMap<Object, Object>) JsonUtil.readValue(jsonStr, Object.class);
			String access_token = (String) o.get("access_token");
			ACCESS_TOKEN = access_token;
			LAST_GET_ACCESS_TOKEN_TIME = currentTimeSecond;
		}
		logger.debug("ACCESS_TOKEN:"+ACCESS_TOKEN);
		return ACCESS_TOKEN;
	}
	
	/**
	 * @param access_token全局
	 * @return
	 */
	public static String getJsapi_ticket(){
		String access_token = WeiXinApiUtils.getAccessToken();
		
		Long currentTimeSecond = System.currentTimeMillis();
		boolean  needRefresh = ((currentTimeSecond - LAST_GET_JS_API_TICKET_TIME) / 1000) - 7200 >= 0 ? true : false;
		if(JS_API_TICKET == null || needRefresh){
			String url = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token="+access_token+"&type=jsapi";
			String jsonStr = HttpClientUtils.get(url);
			LinkedHashMap<Object, Object> o = (LinkedHashMap<Object, Object>) JsonUtil.readValue(jsonStr, Object.class);
			String ticket = (String) o.get("ticket");
			JS_API_TICKET = ticket;
		}
		logger.debug("JS_API_TICKET:"+JS_API_TICKET);
		LAST_GET_JS_API_TICKET_TIME = currentTimeSecond;
		return JS_API_TICKET; 
	}
	/**
	 * {
		   "access_token":"ACCESS_TOKEN",
		   "expires_in":7200,
		   "refresh_token":"REFRESH_TOKEN",
		   "openid":"OPENID",
		   "scope":"SCOPE"
		}
	 * @param code
	 * @return
	 */
	@SuppressWarnings("unchecked")
	private static LinkedHashMap<Object, Object> getAccessTokenForUserInfo(String code){
		String url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid="+APP_ID+"&secret="+APP_SECRET+"&code="+code+"&grant_type=authorization_code";
		String jsonStr = HttpClientUtils.get(url);
		LinkedHashMap<Object, Object> o = (LinkedHashMap<Object, Object>) JsonUtil.readValue(jsonStr, Object.class);
		//System.out.println(o.get("access_token"));
		return o;
	}
	
	//拉取用户信息(需scope为 snsapi_userinfo)
	private static WeiXinUser getWeiXinUserInfo(String accessToken, String openId){
		String url = "https://api.weixin.qq.com/sns/userinfo?access_token="+accessToken+"&openid="+openId+"&lang=zh_CN";
		String jsonUser = HttpClientUtils.get(url);
		WeiXinUser weiXinUser = JsonUtil.readValue(jsonUser, WeiXinUser.class);
		return weiXinUser;
	}
	
	//拉取用户信息(需scope为 snsapi_userinfo)
	public static WeiXinUser getWeiXinUserInfo(String code){
		if(code == null){
			return null;
		}
		LinkedHashMap<Object, Object> map = getAccessTokenForUserInfo(code);
		WeiXinUser u = getWeiXinUserInfo((String)map.get("access_token"), (String)map.get("openid"));
		return u;
	}
	
	
	
	
	public static void main(String[] args) {
		String access_tken = "iQaOVV6UFMoeoLmPGOHBVkGEvlmikOUVZOkwbV9QlNEVPUroLvMlRq3quatYxRbKsqCFjZfZ-LMOnBbJxWEXNv1IhfUCfGMvmEBm2w0ww-bLcN20WHhIyfMo45jX0SuvRUHfAEANQD";
		String url = "https://api.weixin.qq.com/cgi-bin/user/info?access_token="+access_tken+"&openid=OPENID&lang=zh_CN";
		System.out.println(getAccessToken());
		//ZCZfrBt9CRRvxRZTz6Yi5FoAg-MydaaI1fPSRHpN77c1gu9uhxrSF9_qrWmGFKSlioMH5jJZQlMdcTmG9Y_dcnUmZ4M7sRqG3yn-f6BMm4kKYQiABATHZ
	 
		//https://open.weixin.qq.com/connect/oauth2/authorize?appid=APPID&redirect_uri=REDIRECT_URI&response_type=code&scope=SCOPE&state=STATE#wechat_redirect
		String encode_url = java.net.URLEncoder.encode("");
	}
}
