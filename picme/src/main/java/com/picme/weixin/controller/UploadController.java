package com.picme.weixin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.picme.common.RestResult;
import com.picme.service.ImageService;
import com.picme.weixin.vo.UploadParam;

@Controller  
@RequestMapping("/file")  
public class UploadController {   
	
	Logger logger = LoggerFactory.getLogger(UploadController.class);
	
	@Autowired
    private ImageService imageService;  
      
    @RequestMapping("/upload")
    public String upload(@RequestParam("file") CommonsMultipartFile[] files,UploadParam param,HttpServletRequest request){  
          
        for(int i = 0;i<files.length;i++){  
            System.out.println("fileName---------->" + files[i].getOriginalFilename());  
          
            if(!files[i].isEmpty()){  
                int pre = (int) System.currentTimeMillis();  
                try {  
                	 String path=request.getSession().getServletContext().getRealPath("static/upload/imgs/");
                    //拿到输出流，同时重命名上传的文件  
                   // FileOutputStream os = new FileOutputStream("D:\\work\\temp\\testImgs\\" + new Date().getTime() + files[i].getOriginalFilename());  
                	 String fileType=files[i].getOriginalFilename().substring(files[i].getOriginalFilename().lastIndexOf(".")+1);
                	 String fileName =  new Date().getTime() + "." + fileType;
                	 File temp = new File(path);
                	 if(!temp.exists()){
                		 temp.mkdirs();
                	 }
                	 logger.debug("upFile:"+path + fileName);
                	 FileOutputStream os = new FileOutputStream(path + fileName);  
                     //拿到上传文件的输入流  
                    InputStream in = files[i].getInputStream();
                    //以写字节的方式写文件  
                    int b = 0;  
                    while((b=in.read()) != -1){  
                        os.write(b);  
                    }  
                    os.flush();  
                    os.close();  
                    in.close();  
                    int finaltime = (int) System.currentTimeMillis();  
                    System.out.println(finaltime - pre);  
                    
                    //imageService.add(fileName, param.getId());
                    logger.debug("上传成功:"+path + fileName); 
                } catch (Exception e) {  
                    e.printStackTrace();  
                    System.out.println("上传出错");  
                }  
        }  
        }  
        return "weixin/code";  
    }  
      
    @ResponseBody
    @RequestMapping("/upload2")
    public RestResult<Object> upload2(@RequestParam("file") CommonsMultipartFile[] files,UploadParam param,HttpServletRequest request){  
    	RestResult<Object> reset = new RestResult<Object>();
       
    	for(int i = 0;i<files.length;i++){  
            System.out.println("fileName---------->" + files[i].getOriginalFilename());  
          
            if(!files[i].isEmpty()){  
                int pre = (int) System.currentTimeMillis();  
                try {  
                	 String path=request.getSession().getServletContext().getRealPath("static/upload/imgs/");
                    //拿到输出流，同时重命名上传的文件  
                   // FileOutputStream os = new FileOutputStream("D:\\work\\temp\\testImgs\\" + new Date().getTime() + files[i].getOriginalFilename());  
                	 String fileType=files[i].getOriginalFilename().substring(files[i].getOriginalFilename().lastIndexOf(".")+1);
                	 String fileName =  new Date().getTime() + "." + fileType;
                	 String dbFileName = "static/upload/imgs/"+fileName;
                	 File temp = new File(path);
                	 if(!temp.exists()){
                		 temp.mkdirs();
                	 }
                	 logger.debug("upFile:"+path + fileName);
                	 FileOutputStream os = new FileOutputStream(path + fileName);  
                     //拿到上传文件的输入流  
                    InputStream in = files[i].getInputStream();
                    //以写字节的方式写文件  
                    int b = 0;  
                    while((b=in.read()) != -1){  
                        os.write(b);  
                    }  
                    os.flush();  
                    os.close();  
                    in.close();  
                    int finaltime = (int) System.currentTimeMillis();  
                    System.out.println(finaltime - pre);  
                    
                    imageService.addAlbum(dbFileName, param.getUserId(),param.getAlbumId(),param.getOrder());
                    logger.debug("上传成功:"+path + fileName); 
                } catch (Exception e) {  
                	reset.markAsfailed();
                    //e.printStackTrace();  
                    logger.debug("上传出错:",e);
                    System.out.println("上传出错");  
                }  
        }  
        }  
        return reset;  
    }  
    
    @RequestMapping("/toUpload" )   
    public String toUpload() {  
        return "weixin/uploadImg";  
    }  
      
}  
