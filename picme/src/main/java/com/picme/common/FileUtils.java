package com.picme.common;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.http.HttpServletResponse;

public class FileUtils {

	 /** 
     *  
     * @param inputFileName 
     *            输入一个文件夹 
     * @param zipFileName 
     *            输出一个压缩文件夹，打包后文件名字 
     * @throws Exception 
     */  
    public static void zip(String inputFileName, String zipFileName) throws Exception {  
        zip(zipFileName, new File(inputFileName));  
    }  
  
    private static void zip(String zipFileName, File inputFile) throws Exception {  
        ZipOutputStream out = new ZipOutputStream(new FileOutputStream(zipFileName));  
        zip(out, inputFile, "");  
        out.close();  
    }  
  
    private static void zip(ZipOutputStream out, File f, String base) throws Exception {  
        if (f.isDirectory()) { // 判断是否为目录  
            File[] fl = f.listFiles();  
            out.putNextEntry(new ZipEntry(base + "/"));  
            base = base.length() == 0 ? "" : base + "/";  
            for (int i = 0; i < fl.length; i++) {  
                zip(out, fl[i], base + fl[i].getName());  
            }  
        } else { // 压缩目录中的所有文件  
            out.putNextEntry(new ZipEntry(base));  
            FileInputStream in = new FileInputStream(f);  
            int b;  
            while ((b = in.read()) != -1) {  
                out.write(b);  
            }  
            in.close();  
        }  
    }  
  
    /** 
     * 下载文件 
     *  
     * @param file 
     * @param response 
     */  
    public static void downloadFile(File file, HttpServletResponse response, boolean isDelete) {  
        try {  
            // 以流的形式下载文件。  
            BufferedInputStream fis = new BufferedInputStream(new FileInputStream(file.getPath()));  
            byte[] buffer = new byte[fis.available()];  
            fis.read(buffer);  
            fis.close();  
            // 清空response  
            response.reset();  
            OutputStream toClient = new BufferedOutputStream(response.getOutputStream());  
            response.setContentType("application/octet-stream");  
            response.setHeader("Content-Disposition",  
                    "attachment;filename=" + new String(file.getName().getBytes("UTF-8"), "ISO-8859-1"));  
            toClient.write(buffer);  
            toClient.flush();  
            toClient.close();  
            if (isDelete) {  
                file.delete(); // 是否将生成的服务器端文件删除  
            }  
        } catch (IOException ex) {  
            ex.printStackTrace();  
        }  
    }  
    
  //删除文件和目录
    public static void clearFiles(String workspaceRootPath){
         File file = new File(workspaceRootPath);
         if(file.exists()){
              deleteFile(file);
         }
    }
    
    public static void deleteFile(File file){
         if(file.isDirectory()){
              File[] files = file.listFiles();
              for(int i=0; i<files.length; i++){
                   deleteFile(files[i]);
              }
         }
         file.delete();
    }
    
    public static void deleteFileOfFloder(String floderPath){
    	File floder = new File(floderPath);
        if(floder.isDirectory()){
             File[] files = floder.listFiles();
             for(int i=0; i<files.length; i++){
                  files[i].delete();
             }
        }
   }
}
