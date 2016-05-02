<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html style="height: 100%">
<header>
<title>welcome</title>
<link rel="shortcut icon" href="img/icon.png">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	setTimeout('window.location.href = "${pageContext.request.contextPath}/home.do";',800);
});
</script>
</header>
<body style="height: 100%;background: #c4c4c4; overflow: hidden;">
<div style="height: 100%;text-align: center;">
	<div style="margin-top: 15%"></div>	
</div>
</body>
</html>