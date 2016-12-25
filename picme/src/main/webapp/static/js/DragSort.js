/**
 * @author kevinwu
 */
var startTouchImg = null;
var lastTouchImg = null;
var prevTouchImg = null;
var ghostEl = null;
var dragEl;
var rootEl = document.getElementById("select_img_div");
var tapEvt;
var isFirstTapEvt = true;

var isTapHold = false;
var isTap = false;

function load (){  
	//$(document).on("pagecreate","#select_img_div",function(){
	  $(".touchImg").on("taphold",function(event){
		  isTapHold = true;
		  //alert("taphold");
		  console.log("isDefaultPrevented:"+event.isDefaultPrevented());
		  event.preventDefault(); 
		  event.stopPropagation(); 
		  console.log("isDefaultPrevented:"+event.isDefaultPrevented());
          //oInp.innerHTML = "Touch started (" + event.touches[0].clientX + "," + event.touches[0].clientY + ")";  
          console.log("start");
          //var target = document.elementFromPoint(event.clientX, event.clientY);
          var target = event.target;
          console.log(target);
          console.log(event);
          var $target = $(target);
          if($target.hasClass("touchImg")){
          	$target.addClass("dashBorder");
          	startTouchImg = target;
              lastTouchImg = target;
              
             // $imgEdit =  $(target);//当前click时间的图片
              
               tapEvt = { clientX: event.clientX
							, clientY: event.clientY
						};
               //console.log("tapEvt:");
               //console.log("tapEvt:" + tapEvt.clientX + "-" + tapEvt.clientY);
              dragEl = target;
              var
				  rect = dragEl.getBoundingClientRect()
				, css = _css(dragEl)
				, ghostRect
				;
              ghostEl = target.cloneNode(true);
              _css(ghostEl, 'top', rect.top - parseInt(css.marginTop, 0));
				_css(ghostEl, 'left', rect.left - parseInt(css.marginLeft, 0));
				_css(ghostEl, 'width', rect.width);
				_css(ghostEl, 'height', rect.height);
				_css(ghostEl, 'opacity', '0.8');
				_css(ghostEl, 'position', 'fixed');
				_css(ghostEl, 'zIndex', '100000');

				rootEl.appendChild(ghostEl);
				// Fixing dimensions.
				ghostRect = ghostEl.getBoundingClientRect();
				_css(ghostEl, 'width', rect.width*2 - ghostRect.width);
				_css(ghostEl, 'height', rect.height*2 - ghostRect.height);
				
          }
	  });   
		$(".touchImg").on("tap",function(event){
	     //alert("tap");
			$(this).parent().children(".defaultImg").addClass("hidden");
			event.preventDefault();
			if(isTapHold){
				return;
			}
			isTap = true;
		console.log(event);
	     $imgEdit =  $(event.target);//当前click时间的图片
	     showModifyImgDiv();
	  });  
//	});
	
  //var touchDiv = document.getElementById("select_img_div");
  var touchSpans = document.getElementsByClassName("touchImg"); //touchImg
   /*  document.addEventListener('touchstart',touch, false);  
    document.addEventListener('touchmove',touch, false);  
    document.addEventListener('touchend',touch, false);   */
   //console.log(touchSpans);
    for(var i = 0; i < touchSpans.length; i ++ ){
    	touchSpans[i].addEventListener('touchstart',touch, false);  
    	touchSpans[i].addEventListener('touchmove',touch, false);  
    	touchSpans[i].addEventListener('touchend',touch, false); 
    	//touchSpans[i].addEventListener('click',function(){alert("click2");}, false);
    }
    
    function touch (event){  
        var event = event || window.event;  
          
        var oInp = document.getElementById("inp");  
  
        switch(event.type){  
            case "touchstart":  
            	event.preventDefault(); 
                //oInp.innerHTML = "Touch started (" + event.touches[0].clientX + "," + event.touches[0].clientY + ")";  
                //console.log("start");
                return;
                var target = document.elementFromPoint(event.touches[0].clientX, event.touches[0].clientY);
                //console.log(target);
                //console.log(event);
                var $target = $(target);
                if($target.hasClass("touchImg")){
                	$target.addClass("dashBorder");
                	startTouchImg = target;
	                lastTouchImg = target;
	                
	               // $imgEdit =  $(target);//当前click时间的图片
	                
	                 tapEvt = { clientX: event.touches[0].clientX
								, clientY: event.touches[0].clientY
							};
	                 
	                dragEl = target;
	                var
					  rect = dragEl.getBoundingClientRect()
					, css = _css(dragEl)
					, ghostRect
					;
	                ghostEl = target.cloneNode(true);
	                _css(ghostEl, 'top', rect.top - parseInt(css.marginTop, 0));
					_css(ghostEl, 'left', rect.left - parseInt(css.marginLeft, 0));
					_css(ghostEl, 'width', rect.width);
					_css(ghostEl, 'height', rect.height);
					_css(ghostEl, 'opacity', '0.8');
					_css(ghostEl, 'position', 'fixed');
					_css(ghostEl, 'zIndex', '100000');

					rootEl.appendChild(ghostEl);
					// Fixing dimensions.
					ghostRect = ghostEl.getBoundingClientRect();
					_css(ghostEl, 'width', rect.width*2 - ghostRect.width);
					_css(ghostEl, 'height', rect.height*2 - ghostRect.height);
					
                }
                break;  
            case "touchmove":  
            	console.log("move:");
            	var clientY = event.touches[0].clientY;
                console.log(event.touches[0].clientX + "-" +event.touches[0].clientY);
                //console.log("屏幕宽高为："+screen.width+"*"+screen.height);
                //console.log(document.body.clientHeight);
                //console.log(document.body.offsetHeight);
                //console.log(document.body.scrollHeight);
                console.log(window.screen.availHeight);
                var availHeight = window.screen.availHeight;
                var top = $(document).scrollTop();
                console.log("top:"+top);
                if(clientY < 20 && top > 300){
                	top = top - 250;
            		$('html,body').animate({scrollTop: top+'px'}, 100);
                }else{
                	var flag = clientY > (availHeight - 120) ? true : false;
                	console.log("clientY:"+clientY + ";availHeight:"+availHeight+";flag:"+flag);
                	if(flag){
                		top = top + 250;
                		$('html,body').animate({scrollTop: top+'px'}, 300);
                	}
                }
                console.log("====");
            	if(!isTapHold){
            		return;
            	}else{
            		event.preventDefault(); 
            		if(isFirstTapEvt){
            			tapEvt = { clientX: event.touches[0].clientX
            					, clientY: event.touches[0].clientY
            			};
            		}
            		isFirstTapEvt = false;
            	}
            	/*if(isTap){
            		return;
            	}*/
            	_css(ghostEl, 'display', 'none');
                //oInp.innerHTML = "<br/>Touch moved (" + event.touches[0].clientX + "," + event.touches[0].clientY + ")";  
                var target = document.elementFromPoint(event.touches[0].clientX, event.touches[0].clientY);
                //console.log(target);
                //console.log(event);
                var $target = $(target);
                if($target.hasClass("touchImg")){
                	lastTouchImg = target;
                	if(prevTouchImg != null && !(prevTouchImg === startTouchImg)){
                		$(prevTouchImg).removeClass("dashBorder");
                	}
                	$target.addClass("dashBorder");
                	prevTouchImg = target;
                	
                }
                //
                var
				  touch = event.touches[0]
						, dx = touch.clientX - tapEvt.clientX
						, dy = touch.clientY - tapEvt.clientY
						, translate3d = 'translate3d(' + dx + 'px,' + dy + 'px,0)'
					;
		
					_css(ghostEl, 'webkitTransform', translate3d);
					_css(ghostEl, 'mozTransform', translate3d);
					_css(ghostEl, 'msTransform', translate3d);
					_css(ghostEl, 'transform', translate3d);
			
			    //event.preventDefault();  
			    _css(ghostEl, 'display', '');
			    sleep(1);
                break;  
            case "touchend":  
            	console.log("end");
            	if(!isTapHold){
            		return;
            	}else{
            		isFirstTapEvt = true;
            	}
            	/*isTapHold = false;
            	console.log("isTap:"+isTap);
            	if(isTap){
            		return;
            	}
            	isTap = false;*/
            	if( ghostEl ){
					ghostEl.parentNode.removeChild(ghostEl);
				}
            	ghostEl = null;
                //oInp.innerHTML = "<br/>Touch end (" + event.changedTouches[0].clientX + "," + event.changedTouches[0].clientY + ")";  
                
                console.log(event);
                var $srctarget = $(event.target);
                $srctarget.removeClass("dashBorder");

                console.log("startTouchImg");
                console.log(startTouchImg);
                console.log("lastTouchImg");
                console.log(lastTouchImg);
                /* if(lastTouchImg === startTouchImg){
                	//相当click时间
                	console.log("click");
                }else{ */
                	if(prevTouchImg != null){
                		$(prevTouchImg).removeClass("dashBorder");
                	}
                	
                	var startimgSpan = $(startTouchImg).parent();
                	var endimgSpan = $(lastTouchImg).parent();
                	var startImgOrder = startimgSpan.parent().children("input[name=img_index]").val();
                	var endImgOrder = endimgSpan.parent().children("input[name=img_index]").val();
                	 console.log("startimgSpan");
                	console.log(startimgSpan);
                	 console.log("endimgSpan");
                	console.log(endimgSpan);
                	if(startImgOrder == endImgOrder){
                		//click
                		//showModifyImgDiv();
                	}else if(startImgOrder < endImgOrder){
                		var startTopDiv = startimgSpan.parent().parent();
                		var $startImg = startTopDiv.find("img.touchImg");
                		var endTopDiv = endimgSpan.parent().parent();
                		var preTopDiv = startTopDiv;
                		var nextTopDiv = startTopDiv.next().hasClass("pageNumDiv") ? startTopDiv.next().next() : startTopDiv.next();
                		while(nextTopDiv.length > 0 && !nextTopDiv.hasClass("pageNumDiv") && !(nextTopDiv[0] === endTopDiv[0])){
                			preTopDiv.find("span").append(nextTopDiv.find("img.touchImg"));
                			preTopDiv = nextTopDiv;
                			nextTopDiv = nextTopDiv.next().hasClass("pageNumDiv") ? nextTopDiv.next().next() : nextTopDiv.next();
                		}
                		preTopDiv.find("span").append(nextTopDiv.find("img.touchImg"));
                		nextTopDiv.find("span").append($startImg);
                	}else{
                		//startImgOrder > endImgOrder
                		var endTopDiv = startimgSpan.parent().parent();
                		var startTopDiv = endimgSpan.parent().parent();
                		var $startImg = startTopDiv.find("img.touchImg");
                		var $endImg = endTopDiv.find("img.touchImg");
                		var afterTopDiv = endTopDiv;
                		var prevTopDiv = afterTopDiv.prev().hasClass("pageNumDiv") ? afterTopDiv.prev().prev() : afterTopDiv.prev();
                		while(prevTopDiv.length > 0 && !prevTopDiv.hasClass("pageNumDiv") && !(prevTopDiv[0] === startTopDiv[0])){
                			afterTopDiv.find("span").append(prevTopDiv.find("img.touchImg"));
                			afterTopDiv = prevTopDiv;
                			prevTopDiv = prevTopDiv.prev().hasClass("pageNumDiv") ? prevTopDiv.prev().prev() : prevTopDiv.prev();
                		}
                		afterTopDiv.find("span").append(prevTopDiv.find("img.touchImg"));
                		prevTopDiv.find("span").append($endImg);
                		
                	}
                	
                	//startimgSpan.append(lastTouchImg);
                	//endimgSpan.append(startTouchImg);
                	
                //}
                console.log("end2");
                isTapHold = false;
                break;  
           
        }  
          
    }  
}  

function _css(el, prop, val){
	if( el && el.style ){
		if( val === void 0 ){
			if( document.defaultView && document.defaultView.getComputedStyle ){
				val = document.defaultView.getComputedStyle(el, '');
			}
			else if( el.currentStyle ){
				val	= el.currentStyle;
			}
			return	prop === void 0 ? val : val[prop];
		} else {
			el.style[prop] = val + (typeof val === 'string' ? '' : 'px');
		}
	}
}

window.addEventListener('load',load, false);  

function   sleep(n)   
{   
    var  start=new Date().getTime();   
    while(true) if(new Date().getTime()-start>n)  break;   
}
