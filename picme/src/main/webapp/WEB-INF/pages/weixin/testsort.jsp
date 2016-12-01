<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>排序测试</title>
<%@ include file="../common/GTIncludeHead.jsp"%>
<style type="text/css">
.select_img_div div{
	border: 1px solid gray;
}
</style>
<script type="text/javascript" src="${basePath }static/js/Sortable.js"></script>
</head>
<body>
<ul id="items">
    <li>item 1</li>
    <li>item 2</li>
    <li>item 3</li>
</ul>
<div class="row select_img_div" id="select_img_div">
		<div class="col-xs-6 col-sm-6 col-md-6 1" style="padding: 15px;0px;height:180px;">
			<img name="preview1" src="${basePath }static/upload/sysImgs/1.jpg"
				class="img-responsive my-handle" alt="">
		</div>
		<div class="col-xs-6 col-sm-6 col-md-6 2" style="padding: 15px;0px;height:180px;">
			<img name="preview2" src="${basePath }static/upload/sysImgs/noimg.png"
				class="img-responsive my-handle" alt="">
		</div>
		<div class="col-xs-6 col-sm-6 col-md-6" style="padding: 15px;0px;height:180px;">
			<img name="preview3" src="${basePath }static/upload/sysImgs/3.jpg"
				class="img-responsive my-handle" alt="">
		</div>
		<div class="col-xs-6 col-sm-6 col-md-6" style="padding: 15px;0px;height:180px;">
			<img  name="preview4" src="${basePath }static/upload/sysImgs/4.jpg"
				class="img-responsive my-handle" alt="">
		</div>
		<div class="col-xs-6 col-sm-6 col-md-6" style="padding: 15px;0px;height:180px;">
			<img name="preview5"  src="${basePath }static/upload/sysImgs/5.jpg"
				class="img-responsive my-handle" alt="">
		</div>
		<div class="col-xs-6 col-sm-6 col-md-6" style="padding: 15px;0px;height:180px;">
			<img  name="preview6" src="${basePath }static/upload/sysImgs/6.jpg"
				class="img-responsive my-handle" alt="">
		</div>
	</div>
</body>
<%@include file="../common/MainJS.jsp"%>
<script type="text/javascript">
$(function(){
	var el = document.getElementById('items');
	new Sortable(el);
	var e2 = document.getElementById('select_img_div');
	var sortable = new Sortable(e2,{
		group: "name",
	    store: null, // @see Store
	    handle: ".my-handle", // 点击目标元素约束开始
	   // draggable: ".item",   // 指定那些选项需要排序
	    ghostClass: "sortable-ghost",
		onStart: function (/**Event*/evt) { // 拖拽
	        var itemEl = evt.item;
			console.log("onStart");
			console.log(itemEl);
	    },
	 
	    onEnd: function (/**Event*/evt) { // 拖拽
	        var itemEl = evt.item;
	        console.log("onEnd");
	        console.log(itemEl);
	        var order = sortable.toArray();
	    	console.log(order);
	    },
	 
	    onAdd: function (/**Event*/evt){
	        var itemEl = evt.item;
	        console.log("onAdd");
	        console.log(itemEl);
	    },
	 
	    onUpdate: function (/**Event*/evt){
	        var itemEl = evt.item; // 当前拖拽的html元素
	        console.log("onUpdate");
	        console.log(itemEl);
	    },
	 
	    onRemove: function (/**Event*/evt){
	        var itemEl = evt.item;
	        console.log("onRemove");
	        console.log(itemEl);
	    }
	});
	var order = sortable.toArray();
	console.log(order);
});
</script>

</html>