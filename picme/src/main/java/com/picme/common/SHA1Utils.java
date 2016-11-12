package com.picme.common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SHA1Utils {
    public static String SHA1(String inStr) {
        MessageDigest md = null;
        String outStr = null;
        try {
            md = MessageDigest.getInstance("SHA-1");     //选择SHA-1，也可以选择MD5
            byte[] digest = md.digest(inStr.getBytes());       //返回的是byet[]，要转化为String存储比较方便
            outStr = new String(digest);
        }
        catch (NoSuchAlgorithmException nsae) {
            nsae.printStackTrace();
        }
        return outStr;
    }
    
    
}
