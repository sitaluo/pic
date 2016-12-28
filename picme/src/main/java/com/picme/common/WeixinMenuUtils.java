package com.picme.common;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.LinkedHashMap;

import org.apache.commons.io.FileUtils;

public class WeixinMenuUtils {
	/**
	 * 创建自定义菜单(每天限制1000次)
	 * */
	public static int createMenu(String jsonMenu) {
		int status = 0;
		//删除
		//https://api.weixin.qq.com/cgi-bin/menu/delete?access_token=ACCESS_TOKEN
		//创建菜单
		String path = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token="
				+ WeiXinApiUtils.getAccessToken();
		try {
			URL url = new URL(path);
			HttpURLConnection http = (HttpURLConnection) url.openConnection();
			http.setDoOutput(true);
			http.setDoInput(true);
			http.setRequestMethod("POST");
			http.setRequestProperty("Content-Type",
					"application/x-www-form-urlencoded");
			http.connect();
			OutputStream os = http.getOutputStream();
			os.write(jsonMenu.getBytes("UTF-8"));
			os.close();

			InputStream is = http.getInputStream();
			int size = is.available();
			byte[] bt = new byte[size];
			is.read(bt);
			String message = new String(bt, "UTF-8");
			LinkedHashMap<String, Object> jsonMsg = (LinkedHashMap<String, Object>) JsonUtil
					.readValue(message, Object.class);
			status =  (Integer) jsonMsg.get("errcode");
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return status;
	}
	
	public static void main(String[] args) {
		try {
			String jsonMenu;
			URL url = WeixinMenuUtils.class.getClassLoader().getResource("menuJson.txt");
			File file = FileUtils.toFile(url);
			jsonMenu = FileUtils.readFileToString(file);
			int status = createMenu(jsonMenu);
			System.out.println("status:"+status);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
}
