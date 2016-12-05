<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ include file="../../common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>影集制作</title>
<%@ include file="../../common/GTIncludeHead.jsp"%>

<style type="text/css">
.margin0px{
	margin: 0px;
}

.margin0px div{
	margin: 0px;
	padding: 0px;
}
</style>
</head>
<body class="" id="body">
<div class="" style="padding:10px;">
	<img src="${basePath }static/upload/sysImgs/Rectangle.png" style="height:16px;"> 快递信息
	<span class="pull-right" id="addAddressBtn">
		<img name="" src="${basePath }static/upload/sysImgs/ic_add_box.png" style="height:16px;width:16px;" 
		  		class="">
		添加新地址
	</span>
  </div>
<div id="container" class="container" >
  <hr class="col-xs-12 col-sm-12 col-md-12 ">
  <c:if test="${empty addressList }">
 	 <div class="row">
	  <div class="col-xs-12 col-sm-12 col-md-12">
	  	<p>亲，您还没有快递信息，赶快添加吧~</p>
	  </div>
	</div>
	<hr class="col-xs-12 col-sm-12 col-md-12 ">
  </c:if>
	
	<div class="row margin0px">
		<c:forEach items="${addressList }" var="item">
			<div class="col-xs-12 col-sm-12 col-md-12 ">
			  	 <div class="col-xs-10 col-sm-10 col-md-10" style="padding-right: 10px;border-right: 1px solid #D9D9D9;">
			  	 		<div class="col-xs-12 col-sm-12 col-md-12"><div class="col-xs-7 col-sm-7 col-md-7">${item.person } </div><div class="col-xs-5 col-sm-5 col-md-5">${item.phone } </div> </div>
			  	 		<div class="col-xs-12 col-sm-12 col-md-12"><div class="col-xs-12 col-sm-12 col-md-12">${item.region }${item.address }</div> </div>
			  	 		<div class="col-xs-12 col-sm-12 col-md-12">
			  	 			<input name="addressId" value="${item.id }" type="hidden">
			  	 			<input name="person" value="${item.person }" type="hidden">
			  	 			<input name="region" value="${item.region }" type="hidden">
			  	 			<input name="address" value="${item.address }" type="hidden">
			  	 			<input name="phone" value="${item.phone }" type="hidden">
			  	 			<button name="editBtn" type="button" class="btn btn-link">编辑</button>
			  	 			<button name="deleteBtn" type="button" class="btn btn-link">删除</button>
			  	 		</div>
			  	 </div>
			  	 <div class="col-xs-2 col-sm-2 col-md-2"><br>
		  	 		<div class="">
		  	 		 	<label>
		  	 		 	<img name="blue" class="hidden" src="${basePath }static/upload/sysImgs/ic_check_circle_blue.png" style="height:16px;width:16px;" >
		  	 		 	<img name="gray" src="${basePath }static/upload/sysImgs/ic_check_circle_gray.png" style="height:16px;width:16px;" >
		  	 		 	<input type="radio" name="radio_address_id" value="${item.id }" class="hidden"></label>
		  	 		 </div>
			 	 </div>
			  </div>
			  <hr class="col-xs-12 col-sm-12 col-md-12" style="margin: 10px 0px;">
		</c:forEach>
	 </div> 
	<!-- <div class="col-xs-12 col-sm-12 col-md-12" style="position: fixed;top:auto; left: auto; right: auto;  bottom: 0px;padding: 0px;">
		<button id="next" type="button" class="btn btn-primary col-xs-6 col-sm-6 col-md-6" style="border-radius:0px;">下一步</button>
	</div> -->
</div>

<div class="col-xs-12 col-sm-12 col-md-12" style="height:50px;"></div>
<div class="col-xs-12 col-sm-12 col-md-12" style="position: fixed;top:auto; left: auto; right: auto;  bottom: 0px;padding: 0px;">
	<button class="btn btn-primary btn-lg col-xs-12 col-sm-12 col-md-12" id="next" style="border-radius:0px;"> 下一步  </button>	
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
        <h4 class="modal-title" id="myModalLabel">新建地址</h4>
      </div>
      <div class="modal-body">
			<form role="form" id="addressForm">
				<input name="id" type="hidden" value="">
				<input name="userId" type="hidden" value="${current_user.id }">
			  <div class="form-group">
			    <label for="person">联系人</label>
			    <input type="text" class="form-control" name="person" id="person" placeholder="输入联系人">
			  </div>
			  <div class="form-group">
			    <label for="phone">联系电话</label>
			    <input type="text" class="form-control" name="phone" id="phone" placeholder="">
			  </div>
			  <div class="form-group">
			    <label for="region">所在地区</label>
			    <input type="text" class="form-control" name="region" id="region" placeholder="如：广东省广州市海珠区">
			    
			  </div>
			  <div class="form-group">
			    <label for="address">详细地址</label>
			    <input type="text" class="form-control" name="address" id="address" placeholder="如：海珠区革新路大阪仓1094创意园">
			    
			  </div>
			  <div class="form-group">
				   <div class="checkbox">
				    <label>
				      <input type="checkbox" id="isDefaultCheckBox">设为默认地址
				      <input name="isDefault" id="isDefault" value="0" type="hidden">
				    </label>
				  </div>
			  </div>
			</form>
			
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" id="saveAddressBtn">保存</button>
      </div>
    </div>
  </div>
</div>


<%@ include file="../../common/MainJS.jsp"%>
<script src="${staticPath }/bootstrap-3.3.0/modal.js"></script>

<script type="text/javascript">
$(function(){
	$("#isDefaultCheckBox").click(function(){
		var isChecked = $(this).prop("checked");
		console.log(isChecked);
		if(isChecked){
			$("#isDefault").val(1);
		}
	});
	$("#addAddressBtn").click(function(){
		var showDiv = $("#myModal");
		showDiv.find("input[name=addressId]").val("");
		showDiv.find("input[name=person]").val("");
		showDiv.find("input[name=region]").val("");
		showDiv.find("input[name=phone]").val("");
		showDiv.modal("show");
	});
	$("#saveAddressBtn").click(function(){
		$(this).val("保存...");
		submitForm($(this));
	});
	
	$("button[name=deleteBtn]").click(function(){
		var thisBtn = $(this);
		var addressId = $(this).parent("div").children("input[name=addressId]").val();
		 layer.open({
		    content: '您确定要删除吗？'
		    ,btn: ['删除', '取消']
		    ,yes: function(index2){
		    	var index = layer.open({type: 2});
				var param = "addressId=" + addressId;
				$.ajax({
					type : "POST",
					data : param,
					dataType : "json",
					url : "${basePath }/weixin/address/delete",
					success : function(resp, textStatus) {
						layer.close(index2);
						if (1 == resp.ret_flag) {
							//window.location.reload();
							var parentTrDiv = thisBtn.parent().parent().parent();
							parentTrDiv.next("hr").remove();
							parentTrDiv.remove();
							layer.close(index);
							 layer.open({
								    content: '删除成功'
								    ,skin: 'msg'
								    ,time: 2 //2秒后自动关闭
								  });
						} else {
							layer.close(index);
							layer.alert(resp.ret_msg);
						}
					},
					error : function(request, textStatus, errorThrown) {
						layer.close(index);
						layer.close(index2);
						
					}
				});
		    }
		  });
		
		
	});
	
	$("button[name=editBtn]").click(function(){
		var thisBtn = $(this);
		var parentDiv = thisBtn.parent("div");
		var addressId = parentDiv.children("input[name=addressId]").val();
		var person = parentDiv.children("input[name=person]").val();
		var region = parentDiv.children("input[name=region]").val();
		var address = parentDiv.children("input[name=address]").val();
		var phone = parentDiv.children("input[name=phone]").val();
		var showDiv = $("#myModal");
		showDiv.find("input[name=addressId]").val(addressId);
		showDiv.find("input[name=person]").val(person);
		showDiv.find("input[name=region]").val(region);
		showDiv.find("input[name=phone]").val(phone);
		showDiv.modal("show");
		
	});
	$("#next").click(function(){
		var addressId = $(":radio[name=radio_address_id]:checked").val();
		if(addressId > 0){
			window.location.href = basePath + "weixin/order/payType?albumId=${albumId}" + "&addressId=" + addressId;
		}else{
			alert("请选择一个地址");
		}
	});
	
	$("input[name=radio_address_id]").click(function(){
		var checked = $(this).prop("checked");	
		if(checked == true){
			$("img[name=blue]").addClass("hidden").removeClass("show");
			$("img[name=gray]").addClass("show").removeClass("hidden");
			$(this).parent().children("img[name=blue]").addClass("show").removeClass("hidden");
			$(this).parent().children("img[name=gray]").addClass("hidden").removeClass("show");
		}
		
	});
	
});

//保存地址
function submitForm($btn) {
	console.log($("#addressForm").serialize());
	var param = $("#addressForm").serialize();
	$.ajax({
		type : "POST",
		data : param,
		dataType : "json",
		url : "save.json",
		success : function(resp, textStatus) {
			console.info(resp);
			if (1 == resp.ret_flag) {
				$btn.val("保存");
				$("#myModal").modal("hide");
				window.location.reload();
			} else {
				
			}
		},
		error : function(request, textStatus, errorThrown) {
			$("#myModal").modal("hide");
		}
	});
}
</script>

</body>
</html>