package com.picme.weixin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.picme.common.ConfigUtils;
import com.picme.common.SHA1Utils;
import com.picme.weixin.service.WeixinMessageCoreService;

/**
 * 微信接口入口
 * @author kevinwu
 */
@Controller
@RequestMapping("token")
public class WeiXinCoreController {
	
    @Autowired
    private WeixinMessageCoreService weixinMessageCoreService;
	/**
	 * 确认请求来自微信服务器
	 */
    @RequestMapping(method = RequestMethod.GET)
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	// 随机字符串x
    	String echostr = request.getParameter("echostr");
        // 微信加密签名
        String signature = request.getParameter("signature");
        // 时间戳
        String timestamp = request.getParameter("timestamp");
        // 随机数
        String nonce = request.getParameter("nonce");
        
        System.out.println("echostr:"+echostr);
        System.out.println("signature:"+signature);
        System.out.println("timestamp:"+timestamp);
        System.out.println("nonce:"+nonce);

        String[] str = { ConfigUtils.getWeiXinToken(), timestamp, nonce };
        Arrays.sort(str); // 字典序排序
        String bigStr = str[0] + str[1] + str[2];
        // SHA1加密
        String digest = SHA1Utils.SHA1(bigStr);

        // 确认请求来至微信
        if (digest.equals(signature)) {
            response.getWriter().print(echostr);
        }
        
    }
    
    /**
   	 * 处理微信服务器发来的消息
   	 */
    @RequestMapping(method = RequestMethod.POST)
   	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   		// 将请求、响应的编码均设置为UTF-8（防止中文乱码）
   		request.setCharacterEncoding("UTF-8");
   		response.setCharacterEncoding("UTF-8");
   		// 调用核心业务类接收消息、处理消息
   		String respMessage = weixinMessageCoreService.processRequest(request);
   		// 响应消息
   		PrintWriter out = response.getWriter();
   		out.print(respMessage);
   		
   		out.close();
   	}
}
