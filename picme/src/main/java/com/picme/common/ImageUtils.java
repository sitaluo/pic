package com.picme.common;

import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.Transparency;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

public class ImageUtils {
	private static Logger logger = LoggerFactory.getLogger(ImageUtils.class);
	/**
	 * 默认生成最大宽度350或者最大高度350的图片
	 * @param imageFile
	 * @param newPath
	 * @throws IOException
	 */
	public static void thumbnail(File imageFile, String newPath) throws IOException {
	    thumbnail(imageFile, newPath, 350);
	}
	/**
	 * @param imageFile
	 * @param newPath
	 * @param maxWidthOrHeight 最大宽度或者高度
	 * @throws IOException
	 */
	   public static void thumbnail(File imageFile, String newPath, int maxWidthOrHeight) throws IOException {
	         if(!imageFile.canRead())
	             return;
	        BufferedImage bufferedImage = ImageIO.read(imageFile);
	        if (null == bufferedImage) 
	            return;
	        
	        int originalWidth = bufferedImage.getWidth();
	        int originalHeight = bufferedImage.getHeight();
	        int newHeight;
	        int newWidth;
	        if(originalWidth > originalHeight){
	        	newWidth = maxWidthOrHeight;
	        	newHeight = (int) (((double)newWidth / (double)originalWidth) * originalHeight);
	        }else{
	        	newHeight = maxWidthOrHeight;
	        	newWidth = (int) (((double)newHeight / (double)originalHeight) * originalWidth);
	        }
	        
	        zoomImageUtils(imageFile, newPath, bufferedImage, newWidth, newHeight);
	    }
	  /**
     * 按指定高度 等比例缩放图片
     * 
     * @param imageFile
     * @param newPath
     * @param newWidth 新图的宽度
     * @throws IOException
     */
    public static void zoomImageScale(File imageFile, String newPath, int newWidth) throws IOException {
         if(!imageFile.canRead())
             return;
        BufferedImage bufferedImage = ImageIO.read(imageFile);
        if (null == bufferedImage) 
            return;
        
        int originalWidth = bufferedImage.getWidth();
        int originalHeight = bufferedImage.getHeight();
        double scale = (double)originalWidth / (double)newWidth;    // 缩放的比例
        
        int newHeight =  (int)(originalHeight / scale);

        zoomImageUtils(imageFile, newPath, bufferedImage, newWidth, newHeight);
    }
    private static void zoomImageUtils(File imageFile, String newPath, BufferedImage bufferedImage, int width, int height)
            throws IOException{
        
         String suffix = StringUtils.getFilenameExtension(imageFile.getName());
        
         // 处理 png 背景变黑的问题
        if(suffix != null && (suffix.trim().toLowerCase().endsWith("png") || suffix.trim().toLowerCase().endsWith("gif"))){
            BufferedImage to= new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB); 
            Graphics2D g2d = to.createGraphics(); 
            to = g2d.getDeviceConfiguration().createCompatibleImage(width, height, Transparency.TRANSLUCENT); 
            g2d.dispose(); 
            
            g2d = to.createGraphics(); 
            Image from = bufferedImage.getScaledInstance(width, height, Image.SCALE_AREA_AVERAGING); 
            g2d.drawImage(from, 0, 0, null);
            g2d.dispose(); 
            
            ImageIO.write(to, suffix, new File(newPath));
        }else{
            // 高质量压缩，其实对清晰度而言没有太多的帮助
//            BufferedImage tag = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
//            tag.getGraphics().drawImage(bufferedImage, 0, 0, width, height, null);
//
//            FileOutputStream out = new FileOutputStream(newPath);    // 将图片写入 newPath
//            JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
//            JPEGEncodeParam jep = JPEGCodec.getDefaultJPEGEncodeParam(tag);
//            jep.setQuality(1f, true);    //压缩质量, 1 是最高值
//            encoder.encode(tag, jep);
//            out.close();
            
            BufferedImage newImage = new BufferedImage(width, height, bufferedImage.getType());
            Graphics g = newImage.getGraphics();
            g.drawImage(bufferedImage, 0, 0, width, height, null);
            g.dispose();
            ImageIO.write(newImage, suffix, new File(newPath));
        }
        logger.debug("生成缩略图："+newPath);
    }
}
