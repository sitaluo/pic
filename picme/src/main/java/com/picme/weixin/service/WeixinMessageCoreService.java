package com.picme.weixin.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.picme.weixin.entity.message.resp.Article;
import com.picme.weixin.entity.message.resp.Image;
import com.picme.weixin.entity.message.resp.ImageMessage;
import com.picme.weixin.entity.message.resp.NewsMessage;
import com.picme.weixin.utils.MessageUtil;

/**
 * 核心服务类
 * 
 */
public class WeixinMessageCoreService {
	
	//private static Logger log = LoggerFactory.getLogger(CoreService.class);
	
	/**
	 * 处理微信发来的请求
	 * @param request
	 * @return
	 */
	public static String processRequest(HttpServletRequest request) {
		String respMessage = null;
		try {
			// xml请求解析
			Map<String, String> requestMap = MessageUtil.parseXml(request);

			// 发送方帐号（open_id）
			String fromUserName = requestMap.get("FromUserName");
			// 公众帐号
			String toUserName = requestMap.get("ToUserName");
			// 消息类型
			String msgType = requestMap.get("MsgType");
			/*System.out.println("");
			System.out.println("msgType:"+msgType);
			System.out.println("fromUserName:"+fromUserName);
			System.out.println("toUserName:"+toUserName);

			// 默认回复此文本消息
			TextMessage textMessage = new TextMessage();
			textMessage.setToUserName(fromUserName);
			textMessage.setFromUserName(toUserName);
			textMessage.setCreateTime(new Date().getTime());
			textMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);
			textMessage.setFuncFlag(0);
			// 由于href属性值必须用双引号引起，这与字符串本身的双引号冲突，所以要转义			
			StringBuffer contentMsg = new StringBuffer(); 
			
			contentMsg.append("PicmeClub").append("\n");
			contentMsg.append("遇见最对味的摄影师 ").append("\n");
			contentMsg.append("记录并发现更好的你 ").append("\n");
            contentMsg.append("").append("\n");
			contentMsg.append("更多约拍投稿").append("\n");
			contentMsg.append("详情联系客服 picmek").append("\n");
			
			textMessage.setContent(contentMsg.toString());
			// 将文本消息对象转换成xml字符串
			respMessage = MessageUtil.textMessageToXml(textMessage);*/
			
			/*
			 * 
    "type": "image", 
    "media_id": "HxwkevlU8-qPS0lmMuO6oY0d2Ji8orCR9wXmy7F0gcfnCA8OOCb0Xm9RI82fFL7L", 
    "created_at": 1482484381
    ///
     * 
			 */
			// 创建图文消息
			NewsMessage newsMessage = new NewsMessage();
			newsMessage.setToUserName(fromUserName);
			newsMessage.setFromUserName(toUserName);
			newsMessage.setCreateTime(new Date().getTime());
			newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
			newsMessage.setFuncFlag(0);
			// 单图文消息
			List<Article> articleList = new ArrayList<Article>();
			Article article = new Article();
			article.setTitle("威锋十年 | “寻找最美的你“美女锋友征集令");
			article.setDescription("十周年之际，是时候晒出论坛里的美女了");
			article.setPicUrl("http://mmbiz.qpic.cn/mmbiz_jpg/4yxVdszlIsaRBL4l2A7PXvZ3l8CbcsdYka7ubibNe3Gjiba51hcibn7UHTzxdricqRWD7FVcef5heeic2g899JFCQiaw/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1");
			article.setUrl("http://mp.weixin.qq.com/s?__biz=MzIzODU4ODgzMw==&mid=2247484907&idx=1&sn=6a40ccc1b54c38f9578a675be12912cf&chksm=e9364325de41ca33e00dd34b5bd45d941acc75869047f000775110d54a70ede6dedc0da27347#rd");
			articleList.add(article);  
			// 设置图文消息个数
			newsMessage.setArticleCount(articleList.size());
			// 设置图文消息包含的图文集合
			newsMessage.setArticles(articleList);
			// 将图文消息对象转换成xml字符串
			respMessage = MessageUtil.newsMessageToXml(newsMessage);
			
			// 文本消息
			if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_TEXT)) {
				String content = requestMap.get("Content");
				// 单图文消息
				//回复关键字“威锋十周年”、“威锋10周年”“威锋”、“十周年”、“10周年”、“抽奖”
				if ("威锋十周年".equals(content) || "威锋10周年".equals(content) 
						|| "威锋".equals(content) || "十周年".equals(content)
						|| "10周年".equals(content) || "抽奖".equals(content)) {
					ImageMessage imageMessage = new ImageMessage();
					imageMessage.setToUserName(fromUserName);
					imageMessage.setFromUserName(toUserName);
					imageMessage.setCreateTime(new Date().getTime());
					imageMessage.setMsgType(MessageUtil.REQ_MESSAGE_TYPE_IMAGE);
					imageMessage.setFuncFlag(0);
					Image image = new Image();
					image.setMediaId("VKHTfUJFVMJFU7OCV2FAJ6jahEu3kNRqnpbyNVDjXwkMRkZcY9wSZqIHrbTjN-of");
					//image.setMediaId("4dDNVUL-pr1ol6UKUPnGe2GeORy8TSa1O57AwiTNCc8s0gbpRc-gW0axNniypeFC");
					imageMessage.setImage(image);
					respMessage = MessageUtil.imageMessageToXml(imageMessage);
				System.out.println(respMessage);
					
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return respMessage;
	}

	/**
	 * emoji表情转换(hex -> utf-16)
	 * 
	 * @param hexEmoji
	 * @return
	 */
	public static String emoji(int hexEmoji) {
		return String.valueOf(Character.toChars(hexEmoji));
	}
}