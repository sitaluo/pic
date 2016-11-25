package com.picme.common;

import java.text.SimpleDateFormat;
import java.util.Date;

public class BusinessNoUtils {

	public static String getPhotoAlbumNo(){
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss.sss");
		String no = format.format(new Date());
		return no.replace(".", "");
	}
	
	public static String getCommonBusinessNo(){
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss.sss");
		String no = format.format(new Date());
		return no.replace(".", "");
	}
	
	public static void main(String[] args) {
		System.out.println(getPhotoAlbumNo()); 
	}
}
