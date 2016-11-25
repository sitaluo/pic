<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ include file="../../common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>快递信息</title>
<%@ include file="../../common/GTIncludeHead.jsp"%>

<style type="text/css">
</style>
</head>
<body class="" id="body">
<div id="container" class="container" >
	<div class="" style="padding:10px;">
			<div class="col-xs-4 "><span class="glyphicon glyphicon-chevron-left pull-left"></span></div>
			<div class="col-xs-4" style="text-align:center;">快递信息</div>
			<div class="col-xs-4"><span class="pull-right" id="next">下一步</span></div>
  </div>
  <hr class="col-xs-12 col-sm-12 col-md-12 ">
	<div class="row">
	  <div class="col-xs-12 col-sm-12 col-md-12">
	  	<p>亲，您还没有快递信息，赶快添加吧~</p>
	  </div>
	
	</div>
	<hr class="col-xs-12 col-sm-12 col-md-12 ">
	<div class="row">
		<c:forEach items="${addressList }" var="item">
			<div class="col-xs-12 col-sm-12 col-md-12 ">
			  	 <div class="col-xs-10 col-sm-10 col-md-10">
			  	 		<div class="col-xs-12 col-sm-12 col-md-12"><div class="col-xs-8 col-sm-8 col-md-8">${item.person } </div><div class="col-xs-4 col-sm-4 col-md-4">${item.phone } </div> </div>
			  	 		<div class="col-xs-12 col-sm-12 col-md-12"><div class="col-xs-12 col-sm-12 col-md-12">${item.region }${item.address }</div> </div>
			  	 		<div class="col-xs-12 col-sm-12 col-md-12">
			  	 			<input name="addressId" value="${item.id }" type="hidden">
			  	 			<button type="button" class="btn btn-link">编辑</button>
			  	 			<button type="button" class="btn btn-link">删除</button>
			  	 		</div>
			  	 </div>
			  	 <div class="col-xs-2 col-sm-2 col-md-2">
			  	 		<div class="checkbox"> <label><input type="radio" name="radio_address_id" value="${item.id }"></label></div>
			 		 </div>
			  </div>
			  <hr class="col-xs-12 col-sm-12 col-md-12 ">
		</c:forEach>
	  
	<!--   <div class="col-xs-12 col-sm-12 col-md-12">
	  	 <div class="col-xs-10 col-sm-10 col-md-10">
	  	 		<div class="col-xs-12 col-sm-12 col-md-12"><div class="col-xs-8 col-sm-8 col-md-8">张三丰 </div><div class="col-xs-4 col-sm-4 col-md-4">15622715952 </div> </div>
	  	 		<div class="col-xs-12 col-sm-12 col-md-12"><div class="col-xs-12 col-sm-12 col-md-12">广东省广州市海珠区革新路大阪仓1094创意园</div> </div>
	  	 		<div class="col-xs-12 col-sm-12 col-md-12"><button type="button" class="btn btn-link">编辑</button><button type="button" class="btn btn-link">删除</button> </div>
	  	 </div>
	  	 <div class="col-xs-2 col-sm-2 col-md-2">
	  	 		<div class="checkbox"> <label><input type="checkbox"></label></div>
	 		 </div>
	  </div> -->
	 </div> 
	<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12">
				<button id="addAddressBtn" type="button" class="btn btn-primary col-xs-12 col-sm-12 col-md-12">添加新地址</button>
			</div>
	</div>
	


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
				      <input type="checkbox">设为默认地址
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
	$("#addAddressBtn").click(function(){
		$("#myModal").modal("show");
		
	});
	$("#saveAddressBtn").click(function(){
		$(this).val("保存...");
		submitForm($(this));
	});
	$("#next").click(function(){
		var addressId = $(":radio[name=radio_address_id]:checked").val();
		if(addressId > 0){
			window.location.href = basePath + "weixin/order/payType?albumId=${albumId}" + "&addressId=" + addressId;
		}else{
			alert("请选择一个地址");
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