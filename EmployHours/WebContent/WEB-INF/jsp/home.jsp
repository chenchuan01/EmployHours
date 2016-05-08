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

<link rel="shortcut icon" href="${ctx }/img/icon.png" type="text/css">
<title>EmployHours</title><link rel="stylesheet" href="${ctx }/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ctx }/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="${ctx }/css/fullcalendar.css" />
<link rel="stylesheet" href="${ctx }/css/matrix-media.css" />
<link rel="stylesheet" href="${ctx }/css/matrix-style.css" />
<link rel="stylesheet" href="${ctx }/font-awesome/css/font-awesome.css" />
<link rel="stylesheet" href="${ctx }/css/style.css" />
<link rel="stylesheet" href="${ctx}/js/bootstrap-datepicker/css/datepicker-theme.css" type="text/css"/>
<script type="text/javascript">
var basePath='<%=basePath%>';
</script>
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
        <li><a href="javascript:;" onclick="autoWin('登录账户修改','${ctx}/sys/userForm.do?id=${sysuser.id }');"><i class="icon-check"></i> 个人信息修改</a></li>
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
    <li><a href="javascript:;" onclick="sysUserFirstPage()"><i class="icon icon-home"></i> <span>首页</span></a></li>
    <li><a href="javascript:;" onclick="autoWin('填报工时','${ctx }/empHour/empHourForm.do')">
    <i class="icon icon-pencil"></i> 填报工时</a>
    </li>
    <li><a href="javascript:;" onclick="pageView('${ctx }/home.do?view=myEmphours')">
    <i class="icon icon-time"></i> 我的工时</a>
    </li>
      <c:if test="${'rs' eq sysuser.dep}">
     <li class="submenu"><a href="javascript:;"><i class="icon icon-user"></i> <span>员工管理</span></a>
      <ul>
        <li><a href="javascript:;" onclick="pageView('${ctx }/home.do?view=userList')">员工列表</a></li>
        <li><a href="javascript:;" onclick="autoWin('添加新员工','${ctx }/sys/userForm.do')">新增员工</a></li>
      </ul>
    </li>
  
    <li class="submenu"><a href="javascript:;"><i class="icon icon-time"></i> <span>工时管理</span></a>
      <ul>
        <li><a href="javascript:;" onclick="pageView('${ctx }/home.do?view=hoursCheck')">工时审核</a></li>
        <li><a href="javascript:;" onclick="pageView('${ctx }/home.do?view=hoursList')">工时列表</a></li>
      </ul>
    </li>
    </c:if>
   <c:if test="${'2' eq sysuser.roles }">
   <li class="submenu"><a href="javascript:;"><i class="icon icon-th"></i> <span>部门管理</span></a>
      <ul>
        <li><a href="javascript:;" onclick="pageView('${ctx }/home.do?view=depUsers')">部门员工</a></li>
        <li><a href="javascript:;" onclick="pageView('${ctx }/home.do?view=depHoursList')">部门工时</a></li>
      </ul>
    </li>
    </c:if>
    <c:if test="${'2' eq sysuser.roles and 'rs' eq sysuser.dep}">
    <li><a href="javascript:;" onclick="pageView('${ctx }/home.do?view=configList')">
    <i class="icon icon-cog"></i>系统设置</a>
    </li>
    </c:if>
  </ul>
</div>
<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> 
    <a href="javascript:;" onclick="sysUserFirstPage()" title="EmployHours" class="tip-bottom">
    <i class="icon-home"></i>EmployHours</a></div>
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
<div class="modal fade" id="msgModal" tabindex="-1" role="dialog" aria-labelledby="msgModalLabel">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"></h4>
      </div>
      <div class="modal-body">
      </div>
      <div class="modal-footer"></div>
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
<script src="${ctx }/js/util/customValid.js"></script> 
<script src="${ctx }/js/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>	
<script src="${ctx }/js/bootstrap-datepicker/js/locales/bootstrap-datepicker.zh-CN.js"></script>

<script type="text/javascript">
	var sysUser = {
			userId:"${sysuser.id}",
			userName:"${sysuser.userName}",
			name:"${sysuser.name}",
			roles:"${sysuser.roles}"
	};
	var depName={
			xs:'销售部',
			rs:'人事部',
			js:'技术部'
	};
	var hourStatus={
			'0':'提交审核',
			'1':'审核通过',
			'2':'不通过'
	};
	$(function(){
		sysUserFirstPage();
	});
	function sysUserFirstPage(){
		var initMenu="";
		if(sysUser.roles=="0"){
			initMenu = "configList";
		}else if(sysUser.roles=="1"){
			initMenu="hoursCheck";
		}else if(sysUser.roles=="2"){
			initMenu="depUsers";
		}else if(sysUser.roles=="3"){
			initMenu="myEmphours";
		}
		pageView('${ctx }/home.do?view='+initMenu);
	}
</script>
</body>
</html>
