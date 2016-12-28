package com.picme.common;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.Transparency;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.imageio.ImageReadParam;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;

import org.springframework.util.StringUtils;

public class ImageUtils {
	//private static Logger logger = LoggerFactory.getLogger(ImageUtils.class);
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
        //logger.debug("生成缩略图："+newPath);
    }
    //4960 X 2480
    public static int merge_img_width = 4960;
    public static int merge_img_height = 2480;
    public static int inner_square_width = 2000;
    
    public static int verticalWidth = 296;
    public static int verticalHeight = 620;
    public static int transverseWidth = 532;
    public static int transverseHeight = 296;
    public static int squareWidth = 296;
    public static int gapWidth = 65;
    
    /**
     * 两张图片合成一张jpg图片
     * @param file1
     * @param file2
     * @param path
     * @param newFileName 如：3.jpg
     * @throws IOException
     */
    public static void mergeImage(File file1, File file2,String path,String newFileName) throws IOException {        
        BufferedImage image1 = ImageIO.read(file1);  
        BufferedImage image2 = ImageIO.read(file2);  
        
        BufferedImage combined = new BufferedImage(merge_img_width, merge_img_height, BufferedImage.TYPE_INT_RGB);  
        // paint both images, preserving the alpha channels  
        int width1 = image1.getWidth();
        int height1 = image1.getHeight();
        int width2 = image2.getWidth();
        int height2 = image2.getHeight();
        int startX1 = merge_img_width/2/2 - width1/2;
        int startY1 = merge_img_height/2 - height1/2;
        int startX2 = merge_img_width/2/2 - width2/2 + merge_img_width/2;
        int startY2 = merge_img_height/2 - height2/2;
        Graphics g = combined.getGraphics();
        g.setColor(Color.white);//这里设置背景颜色
        g.fillRect(0, 0, merge_img_width, merge_img_height);//这里填充背景颜色
        g.drawImage(image1, startX1, startY1, null);  
        g.drawImage(image2, startX2, startY2, null);
        // Save as new image  
        ImageIO.write(combined, "JPG", new File(path, newFileName));  
    } 
    
    /**
     *  把8张图片合成一张 logo形的图片
     * @param sourceImages 4张竖着的图片，2张横着的图片，2张正方形的图片
     * @param path  合成图片的存放文件夹
     * @param newFileName 合成图片的文件名
     * @param cutImgTempPath 生成剪切图片的临时目录
     * @throws Exception
     */
    public static void merge8Image(List<File> sourceImages,String path,String newFileName,String cutImgTempPath) throws Exception {        
        if(sourceImages == null || sourceImages.size() < 8){
        	throw new Exception("图片文件参数不正确");
        }
       
        List<File> images_t = choose8Image(sourceImages);
        List<File> images  = ImageUtils.cut8Image(images_t,cutImgTempPath);
        int allWidth = 1190;
        int allHeight = 1600;
        //中间组合图片左上角相对外框 2480x2480的坐标
        int origin_startX = merge_img_height/2 - allWidth/2;
        int origin_startY = merge_img_height/2 - allHeight/2;
        
        int vertical_point_img1[] = {origin_startX,origin_startY,verticalWidth,verticalHeight};
        int vertical_point_img2[] = {origin_startX,origin_startY + verticalHeight,verticalWidth,verticalHeight};
        int vertical_point_img3[] = {origin_startX + verticalWidth + transverseWidth + gapWidth,origin_startY + squareWidth + gapWidth,verticalWidth,verticalHeight};
        int vertical_point_img4[] = {origin_startX + verticalWidth + transverseWidth + gapWidth,origin_startY + squareWidth + gapWidth + verticalHeight,verticalWidth,verticalHeight};
       
        int transverse_point1_img5[] = {origin_startX + verticalWidth,origin_startY,transverseWidth,transverseHeight};
        int transverse_point2_img6[] = {origin_startX + verticalWidth + gapWidth,origin_startY + verticalHeight*2 + gapWidth,transverseWidth,transverseHeight};
        
        int square_potin1_img7[] = {origin_startX + verticalWidth + transverseWidth + gapWidth,origin_startY,squareWidth,squareWidth};
        int square_potin2_img8[] = {origin_startX,origin_startY + verticalHeight*2 + gapWidth,squareWidth,squareWidth};
        
        int[] image8Points[] = {vertical_point_img1,vertical_point_img2,vertical_point_img3,vertical_point_img4,
        		transverse_point1_img5,transverse_point2_img6,square_potin1_img7,square_potin2_img8};
        
        BufferedImage combined = new BufferedImage(merge_img_height, merge_img_height, BufferedImage.TYPE_INT_RGB);  
        // paint both images, preserving the alpha channels  
        Graphics g = combined.getGraphics();
        g.setColor(Color.white);//这里设置背景颜色
        g.fillRect(0, 0, merge_img_width, merge_img_height);//这里填充背景颜色
        for (int i = 0; i < images.size(); i++) {
        	BufferedImage img = ImageIO.read(images.get(i));
        	g.drawImage(img, image8Points[i][0], image8Points[i][1],image8Points[i][2],image8Points[i][3], null);  
		}
        // Save as new image  
        ImageIO.write(combined, "JPG", new File(path, newFileName)); 
    }  
    
    public static List<File> cut8Image(List<File> _8images,String cutImgTempPath) throws IOException{
    	//String path = "D:/work/picme/doc/testImgs/temp/";  
    	String path = cutImgTempPath;
    	int tempWidth = 0;
    	int tempHeight = 0;
    	for (int i = 0; i < _8images.size(); i++) {
    		File file1 = new File(path, "cover_cut_"+(i+1)+".jpg"); 
    		/*if(!file1.exists()){
    			file1.mkdirs();
    		}*/
    		OutputStream output = new FileOutputStream(file1);
    		if(i < 4){
    			tempWidth = verticalWidth;
    			tempHeight = verticalHeight;
    		}else if(i < 6){
    			tempWidth = transverseWidth;
    			tempHeight = transverseHeight;
    		}else if(i < 8){
    			tempWidth = squareWidth;
    			tempHeight = squareWidth;
    		}
    		System.out.println("imgae:"+i);
			//if(i < 4){
				File sourceImage = _8images.get(i);
				BufferedImage image1 = ImageIO.read(sourceImage);  
				int src_height = image1.getHeight();
				int src_width = image1.getWidth();
				if(tempWidth * src_height > tempHeight * src_width){
					//以目标图片的宽为标准 剪切和目标图片相同缩放比的图片
					int cut_width = src_width;
					int cut_height =  (int) (cut_width * tempHeight*1.0 / tempWidth);
					int cutStartY = (src_height - cut_height) /2;
					//System.out.println("cut_width:"+cut_width + ",cut_height:"+cut_height);
					cutImage(sourceImage, output, 0, cutStartY, cut_width, cut_height);
				}else{
					//以目标图片的高为标准
					int cut_height =  src_height;
					int cut_width = (int) (cut_height * tempWidth * 1.0 / tempHeight);
					int cutStartX = (src_width - cut_width) /2;
					//System.out.println("cut_width:"+cut_width + ",cut_height:"+cut_height);
					cutImage(sourceImage, output, cutStartX, 0, cut_width, cut_height);
				}
			//}else if(i < 6){
				
			//}else if(i < 8){
				
			//}
		}
    	
    	List<File> imgs = new ArrayList<File>();
    	for (int i = 0; i < _8images.size(); i++) {
    		File file1 = new File(path, "cover_cut_"+(i+1)+".jpg"); 
    		imgs.add(file1);
    	}
    	
		return imgs;
    	
    }
    /**
     * 
     * @param images 待选择过滤的图片
     * @return 返回筛选过后的合适比例8张图片
     * @throws IOException
     */
    private static List<File> choose8Image(List<File> images) throws IOException{
    	Map<Integer,Double> widthHeightScalesMap= new HashMap<Integer, Double>();
    	for (int i = 0; i < images.size(); i++) {
    		BufferedImage img = ImageIO.read(images.get(i));
    		widthHeightScalesMap.put(i, img.getWidth()*1.0/img.getHeight());
		}
    	double squareScale = 1.0;
    	double verticalScale = verticalWidth * 1.0 / verticalHeight;//<1.0
    	double transverseScale = transverseWidth * 1.0 / transverseHeight;//>1.0
    	
    	//找出最接近正方形的两张图片
    	Integer squareImageKey1 = null;
    	Integer squareImageKey2 = null;
    	double minDiff1 = 100.0;//最小
    	double minDiff2 = 101.0;//倒数第二
    	for(Map.Entry<Integer, Double> entry: widthHeightScalesMap.entrySet()){
    		double temp = Math.abs(squareScale - entry.getValue());
    		if(temp < minDiff1){
    			minDiff2 = minDiff1;
    			squareImageKey2 = squareImageKey1;
    			minDiff1 = entry.getValue();
    			squareImageKey1 = entry.getKey();
    		}else if(temp < minDiff2){
    			minDiff2 = entry.getValue();
    			squareImageKey2 = entry.getKey();
    		}
    	}
    	List<Integer> squareImageKeylist = new ArrayList<Integer>();
    	squareImageKeylist.add(squareImageKey1);
    	squareImageKeylist.add(squareImageKey2);
    	
    	//
    	Integer verticalImageKey1 = null;
    	Integer verticalImageKey2 = null;
    	Integer verticalImageKey3 = null;
    	Integer verticalImageKey4 = null;
    	double verticalDiff1 = 100.0;
    	double verticalDiff2 = 101.0;
    	double verticalDiff3 = 102.0;
    	double verticalDiff4 = 103.0;
    	//
    	Integer transverseImageKey1 = null;
    	Integer transverseImageKey2 = null;
    	double transverseDiff1 = 100.0;
    	double transverseDiff2 = 101.0;
    	
    	for(Map.Entry<Integer, Double> entry: widthHeightScalesMap.entrySet()){
    		if(!entry.getKey().equals(squareImageKey1) && !entry.getKey().equals(squareImageKey2)){
    			if(entry.getValue() < 1.0  ){
    				double temp = Math.abs(verticalScale - entry.getValue());
    				if(temp < verticalDiff1){
    					verticalDiff4 = verticalDiff3;
    					verticalDiff3 = verticalDiff2;
    					verticalDiff2 = verticalDiff1;
    					verticalDiff1 = temp;
    					verticalImageKey4 = verticalImageKey3;
    					verticalImageKey3 = verticalImageKey2;
    					verticalImageKey2 = verticalImageKey1;
    					verticalImageKey1 = entry.getKey();
    				}else if(temp < verticalDiff2){
    					verticalDiff4 = verticalDiff3;
    					verticalDiff3 = verticalDiff2;
    					verticalDiff2 = temp;
    					verticalImageKey4 = verticalImageKey3;
    					verticalImageKey3 = verticalImageKey2;
    					verticalImageKey2 = entry.getKey();
    				}else if(temp < verticalDiff3){
    					verticalDiff4 = verticalDiff3;
    					verticalDiff3 = temp;
    					verticalImageKey4 = verticalImageKey3;
    					verticalImageKey3 = entry.getKey();
    				}else if(temp < verticalDiff4){
    					verticalDiff4 = temp;
    					verticalImageKey4 = entry.getKey();
    				}
    			}else{
    				double temp = Math.abs(transverseScale - entry.getValue());
    				if(temp < transverseDiff1){
    					transverseDiff2 = transverseDiff1;
    					transverseDiff1 = temp;
    					transverseImageKey2 = transverseImageKey1;
    					transverseImageKey1 = entry.getKey();
    				}else if(temp < transverseDiff2){
    					transverseDiff2 = temp;
    					transverseImageKey2 = entry.getKey();
    				}
    			}
    		}
    		
    	}
    	List<Integer> verticalImageKeyList = new ArrayList<Integer>();
    	if(verticalImageKey1 != null){
    		verticalImageKeyList.add(verticalImageKey1);
    	}
    	if(verticalImageKey2 != null){
    		verticalImageKeyList.add(verticalImageKey2);
    	}
    	if(verticalImageKey3 != null){
    		verticalImageKeyList.add(verticalImageKey3);
    	}
    	if(verticalImageKey4 != null){
    		verticalImageKeyList.add(verticalImageKey4);
    	}
    	List<Integer> transverseImageKeyList = new ArrayList<Integer>();
    	if(transverseImageKey1 != null){
    		transverseImageKeyList.add(transverseImageKey1);
    	}
    	if(transverseImageKey2 != null){
    		transverseImageKeyList.add(transverseImageKey2);
    	}
    	
    	List<Integer> returnKeyList = new ArrayList<Integer>();
    	returnKeyList.addAll(squareImageKeylist);
    	returnKeyList.addAll(verticalImageKeyList);
    	returnKeyList.addAll(transverseImageKeyList);
    	
    	//处理全部是 竖着类型图片或者全部是 横着类型 的情况 start
    	if(verticalImageKeyList.size() < 4 || transverseImageKeyList.size() < 2){
    		//剩下未被选中的图片
    		List<Integer> notChooseImageKeyList = new ArrayList<Integer>();
        	for (Integer i = 0; i < images.size(); i++) {
    			if(!returnKeyList.contains(i)){
    				notChooseImageKeyList.add(i);
    			}
    		}
        	int tempSize;
        	if( (tempSize = verticalImageKeyList.size()) < 4){
        		int needSize = 4 - tempSize;
        		for (int i = 0; i < needSize; i++) {
        			verticalImageKeyList.add(notChooseImageKeyList.get(i));
    			}
        	}else if((tempSize = transverseImageKeyList.size()) < 2){
        		int needSize = 2 - tempSize;
        		for (int i = 0; i < needSize; i++) {
        			transverseImageKeyList.add(notChooseImageKeyList.get(i));
    			}
        	}
    	}
    	//处理全部是 竖着类型图片或者全部是 横着类型 的情况 end
    	
    	List<Integer> returnKeyList2 = new ArrayList<Integer>();
    	returnKeyList2.addAll(verticalImageKeyList);
    	returnKeyList2.addAll(transverseImageKeyList);
    	returnKeyList2.addAll(squareImageKeylist);
    	System.out.println("choose8Image:");
    	for (Integer i : returnKeyList2) {
    		System.out.println(images.get(i));
			
		}
    	List<File> retImageList = new ArrayList<File>();
    	for (Integer i : returnKeyList2) {
    		retImageList.add(images.get(i));
		}
		return retImageList;
    	
    }
    
    public static boolean isVerticalImage(File imageFile) throws IOException{
    	BufferedImage img = ImageIO.read(imageFile); 
    	return img.getHeight() > img.getHeight();
    }
    
    public static boolean isTransverseImage(File imageFile) throws IOException{
    	BufferedImage img = ImageIO.read(imageFile);
    	return img.getHeight() < img.getHeight();
    }
    
    public static boolean isSquareImage(File imageFile) throws IOException{
    	BufferedImage img = ImageIO.read(imageFile); 
    	return img.getHeight() == img.getHeight();
    }
    
    public static boolean isSimilarSquareImage(File imageFile) throws IOException{
    	BufferedImage img = ImageIO.read(imageFile); 
    	return Math.abs(img.getHeight()*1.0/ img.getHeight()) > 0.8 && Math.abs(img.getHeight()*1.0/ img.getHeight()) < 1.2;
    }
    
    /**
     * <p>Description:  根据原图与裁切size截取局部图片</p>
     * @param srcImg    源图片
     * @param output    图片输出流
     * @param rect        需要截取部分的坐标和大小
     * @throws IOException 
     */
    @SuppressWarnings({ "resource", "finally" })
	public static void cutImage(File srcImg, OutputStream output, java.awt.Rectangle rect) throws IOException{
            java.io.FileInputStream fis = null;
            ImageInputStream iis = null;
            try {
                fis = new FileInputStream(srcImg);
                // ImageIO 支持的图片类型 : [BMP, bmp, jpg, JPG, wbmp, jpeg, png, PNG, JPEG, WBMP, GIF, gif]
                String types = Arrays.toString(ImageIO.getReaderFormatNames()).replace("]", ",");
                String suffix = null;
                // 获取图片后缀
                if(srcImg.getName().indexOf(".") > -1) {
                    suffix = srcImg.getName().substring(srcImg.getName().lastIndexOf(".") + 1);
                }// 类型和图片后缀全部小写，然后判断后缀是否合法
                if(suffix == null || types.toLowerCase().indexOf(suffix.toLowerCase()+",") < 0){
                    //log.error("Sorry, the image suffix is illegal. the standard image suffix is {}." + types);
                    throw new IOException("图片后缀名不正确");
                }
                // 将FileInputStream 转换为ImageInputStream
                iis = ImageIO.createImageInputStream(fis);
                // 根据图片类型获取该种类型的ImageReader
                ImageReader reader = ImageIO.getImageReadersBySuffix(suffix).next();
                reader.setInput(iis,true);
                ImageReadParam param = reader.getDefaultReadParam();
                param.setSourceRegion(rect);
                BufferedImage bi = reader.read(0, param);
                ImageIO.write(bi, suffix, output);
            } catch (FileNotFoundException e) {
                e.printStackTrace();
                throw new IOException("剪切图片出错");
            } catch (IOException e) {
                e.printStackTrace();
                throw new IOException("剪切图片出错");
            } finally {
                try {
                    if(fis != null) fis.close();
                    if(iis != null) iis.close();
                } catch (IOException e) {
                    e.printStackTrace();
                    throw new IOException("剪切图片出错");
                }
            }
    }
    
    public static void cutImage(File srcImg, OutputStream output, int x, int y, int width, int height) throws IOException{
        cutImage(srcImg, output, new java.awt.Rectangle(x, y, width, height));
    }
    
    
    
    
    
}
