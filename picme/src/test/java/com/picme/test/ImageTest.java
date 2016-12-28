package com.picme.test;

import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;

import com.picme.common.ImageUtils;
  
public class ImageTest {  
    public static String path = "D:/work/picme/doc/testImgs/";      
  
    public static void main(String[] args) throws Exception {  
        File file1 = new File(path, "001.jpg");  
        File file2 = new File(path, "002.jpg");  
        //mergeImage(file1, file2);  
        //ImageUtils.mergeImage(file1, file2, path, "test.jpg");
        File file3 = new File(path, "003.jpg");  
        File file4 = new File(path, "004.jpg"); 
        File file5 = new File(path, "005.jpg");  
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

        ImageUtils.merge8Image(images, path, "test2.jpg",path +"temp/");
        System.out.println("complete");
        
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