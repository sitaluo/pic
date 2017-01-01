package com.picme.common;

import java.util.Map;
/**
 * 获得配置文件信息
 * @author kevinwu
 */
public class ConfigUtils {
	
	private static Map<String,String> props;
	static{
		props = PropsUtil.loadPropsToMap("config.properties");
	}

	public static String getAppID() {
		return props.get("appID");
	}
	
	public static String getAppSecret(){
		return props.get("appSecret");
	}
	
	public static String getWeiXinToken(){
		return props.get("weiXinToken");
	}
	
	public static void main(String[] args) {
		System.out.println(getAppID());
	}

}
