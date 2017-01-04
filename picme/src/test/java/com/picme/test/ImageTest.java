package com.picme.test;

import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.imageio.ImageIO;

import com.drew.imaging.jpeg.JpegMetadataReader;
import com.drew.metadata.Directory;
import com.drew.metadata.Metadata;
import com.drew.metadata.Tag;
import com.drew.metadata.exif.ExifDirectoryBase;
import com.drew.metadata.exif.ExifSubIFDDirectory;
import com.picme.common.ImageUtils;
  
public class ImageTest {  
    public static String path = "D:/work/picme/doc/testImgs/";      
  
    public static void main(String[] args) throws Exception {  
    	
    	
        File file1 = new File(path, "001.jpg");  
        File file2 = new File(path, "002.jpg");  
        
        File file3 = new File(path, "003.jpg");  
        File file4 = new File(path, "004.jpg"); 
        File file5 = new File(path, "101121694756096880d.jpg");  
        File file6 = new File(path, "006.jpg"); 
        File file7 = new File(path, "007.jpg");  
        File file8 = new File(path, "008.jpg"); 
        List<File> images = new ArrayList<File>();
        images.add(file1);
        images.add(file2);
        images.add(file3);
        images.add(file4);
        images.add(file5);
        images.add(file6);
        images.add(file7);
        images.add(file8);

      //mergeImage(file1, file2);  
       // ImageUtils.mergeImage(file5, file6, path, "test.jpg");
       // ImageUtils.merge8Image(images, path, "test2.jpg",path +"temp/");
        System.out.println("complete");
        File filet = new File(path, "171843186601871548d.jpg"); 
       Integer degree = ImageUtils.getRotateDegree(file5);
       String newName = "file5_2_r.jpg";
       ImageUtils.rotate(degree, file5, path, newName);
       File file5_2_r = new File(path,newName);
       ImageUtils.mergeImage(file5_2_r, filet, path, "test2.jpg");
        
        Metadata metadata = JpegMetadataReader.readMetadata(filet);
        ExifDirectoryBase directory
        = metadata.getFirstDirectoryOfType(ExifDirectoryBase.class);
    	Integer orientation = directory.getInteger(ExifDirectoryBase.TAG_ORIENTATION);
    	System.out.println(orientation);
    	Integer turn = 0;
		if (orientation == 3) {
			turn = 180;
		} else if (orientation == 6) {
			turn = 90;
		} else if (orientation == 8) {
			turn = 270;
		}
    	
    }  
    public static void mergeImage(File file1, File file2) throws IOException {        
        BufferedImage image1 = ImageIO.read(file1);  
        BufferedImage image2 = ImageIO.read(file2);  
  
        BufferedImage combined = new BufferedImage(image1.getWidth() * 2, image1.getHeight(), BufferedImage.TYPE_INT_RGB);  
  
        // paint both images, preserving the alpha channels  
        Graphics g = combined.getGraphics();  
        g.drawImage(image1, 0, 0, null);  
        g.drawImage(image2, image1.getWidth(), 0, null);  
          
        // Save as new image  
        ImageIO.write(combined, "JPG", new File(path, "3.jpg"));  
    }  
  
}  