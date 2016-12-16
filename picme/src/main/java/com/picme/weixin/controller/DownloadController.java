package com.picme.weixin.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Update;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.picme.common.DownloadImgThread;
import com.picme.common.RestResult;
import com.picme.common.WeiXinApiUtils;
import com.picme.entity.Image;
import com.picme.service.ImageService;
import com.picme.weixin.vo.DownloadParam;

@Controller
@RequestMapping("/download")
public class DownloadController {

	Logger logger = LoggerFactory.getLogger(DownloadController.class);
	// 获取临时素材(视频不能使用https协议)
	public static final String GET_TMP_MATERIAL = "https://api.weixin.qq.com/cgi-bin/media/get?access_token=%s&media_id=%s";
	// 获取临时素材(视频)
	public static final String GET_TMP_MATERIAL_VIDEO = "http://api.weixin.qq.com/cgi-bin/media/get?access_token=%s&media_id=%s";

	@Autowired
	private ImageService imageService;

	/**
	 * 下载微信服务器文件并上传到自己的服务器
	 * @param param
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/tmpFile")
	public RestResult<Object> tmpFile(DownloadParam param,HttpServletRequest request) {
		RestResult<Object> result = new RestResult<Object>();
		if(param.getMediaId() == null || param.getAlbumId() == null || param.getUserId() == null){
			result.markAsfailed();
			result.setRet_msg("参数不正确");
			return result;
		}
		String path = request.getSession().getServletContext().getRealPath("static/upload/imgs/");
		Image image = imageService.saveAlbum("", param.getUserId(),param.getAlbumId(),param.getOrder());
		
		if(image == null){
			result.markAsfailed();
		}else{
			//开一个线程去从微信服务器下载图片
			new Thread(new DownloadImgThread(path, param.getMediaId(), image.getId(), imageService)).start();
		}
		return result;
	}
	
	private File fetchTmpImg(DownloadParam param,HttpServletRequest request){
		return fetchTmpFile(param.getMediaId(), "img", request, param.getUserId(), param.getAlbumId(),param.getOrder());
	}

	// 获取微信服务器中生成的媒体文件
	// 由于视频使用的是http协议，而图片、语音使用http协议，故此处需要传递media_id和type
	private File fetchTmpFile(String media_id, String type,HttpServletRequest request,Integer userId,Integer albumId,Integer order) {
			String path=request.getSession().getServletContext().getRealPath("static/upload/imgs/");
			String dbFileName = this.fetchTmpFile(media_id, path);
			//imageService.update(imgId, dbFileName);
			//imageService.saveAlbum(dbFileName, userId,albumId,order);
            logger.debug("微信图片下载并上传到服务器成功:"+ dbFileName); 
		return null;
	}

	private String fetchTmpFile(String media_id,String realPath) {
		String dbFileName = "";
		try {
			//request.getSession().getServletContext().getRealPath("static/upload/imgs/");
			String path = realPath;
			String token = WeiXinApiUtils.getAccessToken();
			String url = null;
			// 视频是http协议
			url = String.format(GET_TMP_MATERIAL, token, media_id);
			URL u = new URL(url);
			HttpURLConnection conn = (HttpURLConnection) u.openConnection();
			conn.setRequestMethod("GET");
			conn.connect();
			BufferedInputStream bis = new BufferedInputStream(
					conn.getInputStream());
			String content_disposition = conn
					.getHeaderField("content-disposition");
			// 微信服务器生成的文件名称
			String file_name = "";
			String[] content_arr = content_disposition.split(";");
			if (content_arr.length == 2) {
				String tmp = content_arr[1];
				int index = tmp.indexOf("\"");
				file_name = tmp.substring(index + 1, tmp.length() - 1);
			}
			// 生成不同文件名称
			dbFileName = "static/upload/imgs/"+file_name;
			File fileTempDir = new File(path);
			if(!fileTempDir.exists()){
				fileTempDir.mkdirs();
       	 	}
			File file = new File(path + file_name);
			
			BufferedOutputStream bos = new BufferedOutputStream(
					new FileOutputStream(file));
			byte[] buf = new byte[2048];
			int length = bis.read(buf);
			while (length != -1) {
				bos.write(buf, 0, length);
				length = bis.read(buf);
			}
			bos.close();
			bis.close();
			
            logger.debug("微信图片下载并上传到服务器成功:"+ dbFileName); 
		} catch (MalformedURLException e) {
			logger.debug("",e);
		} catch (IOException e) {
			logger.debug("",e);
		} catch (Exception e) {
			logger.debug("",e);
		}
		return dbFileName;
	}
	
}
