package com.picme.common;

import java.text.SimpleDateFormat;
import java.util.Date;

public class BusinessNoUtils {
  
	public static String getPhotoAlbumNo(){     
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		String no = format.format(new Date());
		String noTemp = "YJ" + no;
		return noTemp;   
	}             
	 
	public static String generateOrderNo(){ 
		return getPhotoAlbumNo();//目前订单号就是影集编号
	}
	
	public static String getCommonBusinessNo(){ 
		SimpleDateFormat format =  new SimpleDateFormat("yyyyMMddHHmmss.sss");
		String no = format.format(new Date() );  
		return no.replace(".", ""); 
	}
	
	public static void main(String[] args) {
		
		System.out.println(getPhotoAlbumNo());  
	}
}
