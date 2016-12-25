var WeixinJsApi = new Object();
WeixinJsApi.config = function (appId,timestamp,nonceStr,signature){
		wx.config({
			   debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
			   appId: appId, // 必填，公众号的唯一标识
			   timestamp: timestamp, // 必填，生成签名的时间戳
			   nonceStr: nonceStr, // 必填，生成签名的随机串
			   signature: signature, // 必填，签名，见附录1
			   jsApiList: ['chooseImage' ,'previewImage','uploadImage','downloadImage'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
		});
		wx.ready(function(){
			console.log("配置信息检验完成");
		});
		wx.error(function(res){
			alert(JSON.stringify(res));
		});
	}
	
	function chooseImg(count){
		var _localIds
		var _count = 8;
		if(count){
			_count = count;
		}
		wx.chooseImage({
		    count: _count, // 默认9
		    sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有
		    sourceType: ['album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有
		    success: function (res) {
		        //var localIds = res.localIds; // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
		        _localIds = res.localIds;
		    }
		});
		return _localIds;
	}
	
	
	
