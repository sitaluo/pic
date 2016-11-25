package com.picme.servlet;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.picme.common.SHA1Utils;

public class WechatCallbackApi extends HttpServlet {
    // 自定义 token
    private String TOKEN = "weixin";

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

        String[] str = { TOKEN, timestamp, nonce };
        Arrays.sort(str); // 字典序排序
        String bigStr = str[0] + str[1] + str[2];
        // SHA1加密
        String digest = SHA1Utils.SHA1(bigStr);

        // 确认请求来至微信
        if (digest.equals(signature)) {
            response.getWriter().print(echostr);
        }
       // response.getWriter().print(echostr);
    }
}