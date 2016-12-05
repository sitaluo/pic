<%@ page contentType="text/html;charset=UTF-8"%>
<%-- <%@ include file="../common/taglibs.jsp"%> --%>
<% 
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName() +":"+request.getServerPort()+path+"/"; 
pageContext.setAttribute("basePath",basePath); 
pageContext.setAttribute("staticPath",basePath+"static"); 
%> 
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">


<script type="text/javascript">
    var basePath = '${basePath}';
</script>

