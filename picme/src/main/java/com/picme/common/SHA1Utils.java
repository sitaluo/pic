package com.picme.common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SHA1Utils {
	/** 
	  * sha1 摘要转16进制 
	  * @param digest 
	  * @return 
	  */
	 private static String toHex(byte[] digest) { 
	  StringBuilder sb = new StringBuilder(); 
	  int len = digest.length; 
	    
	  String out = null; 
	  for (int i = 0; i < len; i++) { 
	//   out = Integer.toHexString(0xFF & digest[i] + 0xABCDEF); //加任意 salt 
	   out = Integer.toHexString(0xFF & digest[i]);//原始方法 
	   if (out.length() == 1) { 
	    sb.append("0");//如果为1位 前面补个0 
	   } 
	   sb.append(out); 
	  } 
	  return sb.toString(); 
	 } 
    public static String SHA1(String inStr) {
        MessageDigest md = null;
        String outStr = null;
        try {
            md = MessageDigest.getInstance("SHA-1");     //选择SHA-1，也可以选择MD5
            byte[] digest = md.digest(inStr.getBytes());       //返回的是byet[]，要转化为String存储比较方便
            outStr = toHex(digest);
        }
        catch (NoSuchAlgorithmException nsae) {
            nsae.printStackTrace();
        }
        return outStr;
    }
    
    public static void main(String[] args) {
    	/*1479355359332515174weixin

    	echostr:4548144074833522687
    	signature:4833f29c1f6a183f9a0d083ac156cfca86cd69a4
    	timestamp:1479355359
    	nonce:332515174*/ 
    	String s = "jsapi_ticket=kgt8ON7yVITDhtdwci0qedz3eadvH9gEVr8RurWSeY4C-apP6rqyzK-u33M5q8DJZsZrH0ldYAndsJUWek2wyg&noncestr=3bf0046b-a85e-4558-8fa9-3121d523ae99&timestamp=1479371192&url=http://beanbean.tunnel.qydev.com/picme/weixin/code";
    	System.out.println(SHA1Utils.SHA1(s));
	}
}
