<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="common/taglib.jspf" %>
<!DOCTYPE html>
<html>
<head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);
	response.addHeader("pragma", "no-cache");
	response.addHeader("cache-control", "no-cache");
	response.addHeader("expires", "0");
%>
<base href="<%=basePath%>"/>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<title>EmployHours</title>
<link rel="shortcut icon" href="${ctx }/img/icon.png" type="text/css">
<link rel="stylesheet" href="${ctx }/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ctx }/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="${ctx }/css/fullcalendar.css" />
<link rel="stylesheet" href="${ctx }/css/matrix-media.css" />
<link rel="stylesheet" href="${ctx }/css/matrix-style.css" />
<link rel="stylesheet" href="${ctx }/font-awesome/css/font-awesome.css" />
<link rel="stylesheet" href="${ctx }/css/style.css" />
</head>
<body>
<!--Header-part-->
<div id="header">
  <h4 >
  
  <a href="javascript:;" style="line-height: 45px;color:#c4c4c4;font-family: 'Open Sans', sans-serif;">
  	<i class="icon-time" style="font-size: 25px;color: #fff"></i>员工工时管理系统
  </a>
  </h4>
</div>
<!--close-Header-part--> 
<!--top-Header-menu-->
<div id="user-nav" class="navbar navbar-inverse">
  <ul class="nav">
    <li  class="dropdown" id="profile-messages" >
    <a title="" href="javascript:;" data-toggle="dropdown" data-target="#profile-messages" class="dropdown-toggle">
    <i class="icon icon-user"></i>  <span class="text">欢迎，${sysuser.name }(${sysuser.userName})</span><b class="caret"></b>
    </a>
      <ul class="dropdown-menu">
        <li class="divider"></li>
        <li><a href="javascript:;" onclick="autoWin('登录账户修改','${ctx}/sys/userForm.do?id=${sysuser.id }');"><i class="icon-check"></i> 修改密码</a></li>
      </ul>
    </li>
    <li class="">
    	<a title="" href="${ctx }/login/logout.do"><i class="icon icon-share-alt"></i> <span class="text">退出登录</span></a>
    </li>
  </ul>
</div>
<!--close-top-serch--> 
<!--sidebar-menu-->
<div id="sidebar">
<a href="#" class="visible-phone"><i class="icon icon-home"></i></a>
  <ul>
    <li ><a href="javascript:;" onclick="sysUserFirstPage()"><i class="icon icon-home"></i> <span>首页</span></a> </li>
    <li class="submenu"> <a href="javascript:;"><i class="icon icon-list"></i> <span>系统功能</span></a>
      <ul>
        <li><a href="javascript:;" onclick="pageView('${ctx }/home.do?view=userList')">系统用户</a></li>
        <li><a href="javascript:;" onclick="pageView('${ctx }/home.do?view=configList')">系统配置</a></li>
      </ul>
    </li>
  </ul>
</div>
<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> 
    <a href="javascript:;" onclick="pageView('${ctx }/home.do?view=questList')" title="EmployHours" class="tip-bottom">
    <i class="icon-home"></i>首页</a></div>
  </div>
  <div  class="quick-actions_homepage">
    <ul class="quick-actions">
      <li class="bg_lb"> <a href="javascript:;" onclick="pageView('${ctx }/home.do?view=questList')"> <i class="icon-list"></i>首页</a> </li>
      <li class="bg_lg"> <a href="javascript:;" onclick="pageView('${ctx }/home.do?view=userList')"> <i class="icon-user"></i> 系统用户</a> </li>
      <li class="bg_ly"> <a href="javascript:;" onclick="pageView('${ctx }/home.do?view=configList')"> <i class="icon-cog"></i> 系统配置</a> </li>
    </ul>
  </div>
  <div class="container-fluid">
    <div id="pageContent" class="row-fluid"></div>
  </div>
</div>
<!--Footer-part-->
<div class="row-fluid">
  <div id="footer" class="span12"> <p>Copyright&copy;2016 员工工时管理系统 -xxxx专业-xxx级-xxx同学</p></div>
</div>
<!--end-Footer-part-->
<div id="load">
	<div id="load_bg"></div>
	<div id="load_show"><img alt="loading" src="${ctx }/img/spinner.gif"/></div>	
</div>
<div class="modal fade" id="formModal" tabindex="-1" role="dialog" aria-labelledby="formModalLabel">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"></h4>
      </div>
      <div class="modal-body">
      </div>
    </div>
  </div>
</div>
<script src="${ctx }/js/jquery.min.js"></script> 
<script src="${ctx }/js/jquery.ui.custom.js"></script> 
<script src="${ctx }/js/bootstrap.min.js"></script> 
<script src="${ctx }/js/jquery.flot.min.js"></script> 
<script src="${ctx }/js/jquery.flot.resize.min.js"></script> 
<script src="${ctx }/js/jquery.peity.min.js"></script> 
<script src="${ctx }/js/matrix.js"></script> 
<script src="${ctx }/js/bak/bak.js"></script> 
<script src="${ctx }/js/util/ajax.js"></script> 
<script src="${ctx }/js/util/dialogHintWin.js"></script> 
<script src="${ctx }/js/util/loadPage.js"></script> 
<script type="text/javascript">
	var sysUser = {
			userId:"${sysuser.id}",
			userName:"${sysuser.userName}",
			name:"${sysuser.name}",
			roles:"${sysuser.roles}"
	};
	
	$(function(){
		
	});
	function sysUserFirstPage(){
		var initMenu="";
		if(sysUser.roles=="0"){
			initMenu = "configList";
		}else if(sysUser.roles=="1"){
			initMenu="";
		}
	}
</script>
</body>
</html>
