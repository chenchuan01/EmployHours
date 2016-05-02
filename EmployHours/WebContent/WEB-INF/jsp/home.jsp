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
<title>LawRobot-Admin</title>
<link rel="shortcut icon" href="${ctx }/img/robot_space.png">
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
  <h3 ><a href="javascript:;" onclick="pageView('${ctx }/admin.do?view=questList')" style="color:#fff;">LawHelper<br/>Admin</a></h3>
</div>
<!--close-Header-part--> 
<!--top-Header-menu-->
<div id="user-nav" class="navbar navbar-inverse">
  <ul class="nav">
    <li  class="dropdown" id="profile-messages" ><a title="" href="javascript:;" data-toggle="dropdown" data-target="#profile-messages" class="dropdown-toggle"><i class="icon icon-user"></i>  <span class="text">欢迎，${sysuser.userName }</span><b class="caret"></b></a>
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
    <li ><a href="javascript:;" onclick="pageView('${ctx }/admin.do?view=questList')"><i class="icon icon-home"></i> <span>问题列表</span></a> </li>
    <li class="submenu"> <a href="javascript:;"><i class="icon icon-list"></i> <span>系统功能</span></a>
      <ul>
        <li><a href="javascript:;" onclick="pageView('${ctx }/admin.do?view=userList')">系统用户</a></li>
        <li><a href="javascript:;" onclick="pageView('${ctx }/admin.do?view=configList')">系统配置</a></li>
      </ul>
    </li>
  </ul>
</div>
<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="javascript:;" onclick="pageView('${ctx }/admin.do?view=questList')" title="LawRobot Admin" class="tip-bottom"><i class="icon-home"></i>法律小助手-后台管理</a></div>
  </div>
  <div  class="quick-actions_homepage">
    <ul class="quick-actions">
      <li class="bg_lb"> <a href="javascript:;" onclick="pageView('${ctx }/admin.do?view=questList')"> <i class="icon-list"></i>问题列表</a> </li>
      <li class="bg_lg"> <a href="javascript:;" onclick="pageView('${ctx }/admin.do?view=userList')"> <i class="icon-user"></i> 系统用户</a> </li>
      <li class="bg_ly"> <a href="javascript:;" onclick="pageView('${ctx }/admin.do?view=configList')"> <i class="icon-cog"></i> 系统配置</a> </li>
    </ul>
  </div>
  <div class="container-fluid">
    <div id="pageContent" class="row-fluid"></div>
  </div>
</div>
<!--Footer-part-->
<div class="row-fluid">
  <div id="footer" class="span12"> <p>Copyright&copy;2016 法律小助手 -xxxx专业-xxx级-xxx同学</p></div>
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
	var zone = '${sys:getStrVal("ZONE_INDEX")}';
	var filed = '${sys:getStrVal("FILED_INDEX")}';
	var zone_index={};
	var filed_index={}
	$(function(){
		initZoneIndex();
		initFiledIndex();
		pageView('${ctx }/admin.do?view=questList');
	});
	function initZoneIndex(){
		if(zone&&zone!=''){
			var zones = zone.split(';');
			for(var i=0;i<zones.length;i++){
				if(zones[i]&&zones[i]!=''){
					var items=zones[i].split(':');
					zone_index[items[0]]=items[1];
				}
			}
		}
	}
	function initFiledIndex(){
		if(filed&&filed!=''){
			var fileds = filed.split(';');
			for(var i=0;i<fileds.length;i++){
				if(fileds[i]&&fileds[i]!=''){
					var items=fileds[i].split(':');
					filed_index[items[0]]=items[1];
				}
			}
		}
	}
</script>
</body>
</html>
