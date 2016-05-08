<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script type="text/javascript">
var basePath = '<%=basePath%>';
</script>
<title>EmployHours</title>
<link rel="shortcut icon" href="${ctx }/img/icon.png" type="text/css">
<link rel="stylesheet" href="${ctx}/css/bootstrap.min.css"  type="text/css"/>
<link rel="stylesheet" href="${ctx}/css/bootstrap-responsive.min.css"  type="text/css"/>
<link rel="stylesheet" href="${ctx}/css/matrix-login.css"  type="text/css"/>
<link rel="stylesheet" href="${ctx}/css/style.css"  type="text/css"/>
<link rel="stylesheet" href="${ctx}/font-awesome/css/font-awesome.css" type="text/css"/>
<link rel="stylesheet" href="${ctx}/js/bootstrap-datepicker/css/datepicker-theme.css" type="text/css"/>

<script src="${ctx}/js/jquery.min.js"></script> 
<script src="${ctx }/js/bootstrap.min.js"></script>
<script src="${ctx }/js/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>	
<script src="${ctx }/js/bootstrap-datepicker/js/locales/bootstrap-datepicker.zh-CN.js"></script>
<script src="${ctx }/js/util/ajax.js"></script> 
<script src="${ctx }/js/util/dialogHintWin.js"></script> 
<script src="${ctx }/js/util/loadPage.js"></script> 
<script src="${ctx }/js/util/customValid.js"></script> 
<script src="${ctx }/js/common.js"></script>

<script type="text/javascript">
$(function(){
	$(".datepickerInput").datepicker(
			{ 
			language: 'zh-CN',
	        autoclose: true,
	        todayHighlight: true,
	        format: 'yyyy-mm-dd'
	       });
		
});
function checkLoginForm(){
	if($('input[name="userName"]').val()==''){
		alert('请输入用户名');
		return false;
	}else if($('input[name="password"]').val()==''){
		alert('请输入密码');
		return false;
	}
	return true;
}
function showRigist(){
	$('#regist').toggle();
	$('#loginbox').toggle();
}
function showForget(){
	$('#loginbox').toggle();
	$('#forget').toggle();
}
function submitReight(){
	$('#registform').submit();
}
function submitForget(formId){
	var param = getParams(formId);
	var url = getUrl(formId);
	ajaxData(url, param, function(){
		cfm("密码重置成功！", function(){
			showForget();
			closeInfo();
		}, null);
	});
}
</script>
</head>
    <body>
        <div id="loginbox">            
            <form id="loginform" class="form-vertical" action="${ctx }/login/verify.do" onsubmit="return checkLoginForm();" method="post">
				 <div class="control-group normal_text"> <h3>登录</h3></div>
				 <c:if test="${exp != null }">
					<div class="control-group">
	                    <div class="controls">
	                        <div class="main_input_box" style="font-size: 16px;color: #ffffff;">
							${exp.msg }
							</div>
	                    </div>
	                </div>
	        	</c:if>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_lg"><i class="icon-user"></i></span><input type="text" name="userName" placeholder="员工工号" />
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_ly"><i class="icon-lock"></i></span><input type="password" name="password" placeholder="密码" />
                        </div>
                    </div>
                </div>
                <div class="control-group" >
                	 <div class="controls" >
                        <div class="main_input_box" >
                    		<input type="submit" style="width: 85%;margin: 0 auto;" class="btn btn-success btn-block" value="登录系统"/>
                    	</div>
                    </div>
                </div>
                <div class="form-actions"></div>
                <a href="javascript:;" onclick="showRigist()">还没有系统账号？点击这里注册...</a>
                <a href="javascript:;" onclick="showForget()" style="float: right;">忘记密码？</a>
            </form>
        </div>
        <div id="regist" style="display: none;">            
            <form id="registform" class="form-vertical" action="${ctx }/login/regist.do" method="post">
				<div class="control-group normal_text"> <h3>注册</h3></div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_lg"><i class="icon-user"></i></span><input type="text" name="name" placeholder="员工姓名" valid="required"/>
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_lg"><i class="icon-font"></i></span><input type="text" name="empno" placeholder="员工工号" valid="required"/>
                        </div>
                    </div>
                </div>
               <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_lg"><i class="icon-bookmark"></i></span>
                            <select  name="sex" placeholder="员工性别" valid="required">
                            	<option value="男">男</option>
                            	<option value="女">女</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_lg"><i class="icon-tag"></i></span><input type="text" name="tel" placeholder="联系电话" valid="tel"/>
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_lg"><i class="icon-check"></i></span><input type="text" name="idno" placeholder="身份证号" valid="required"/>
                        </div>
                    </div>
                </div>
                 <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_lg"><i class=" icon-map-marker"></i></span><input type="text" name="address" placeholder="家庭住址" valid="required"/>
                        </div>
                    </div>
                </div>
                 <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_lg">
                            <i class="icon-calendar"></i></span>
                            <input type="text" class="datepickerInput" style="margin-left: -6px;" name="birth" placeholder="出身日期" valid="day"/>
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_lg"><i class="icon-list"></i></span>
                            <select  name="dep" placeholder="员工部门" valid="required">
                            	<option value="xs">销售部</option>
                            	<option value="rs">人事部</option>
                            	<option value="js">技术部</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_lg"><i class="icon-list"></i></span>
                            <select  name="roles" placeholder="员工角色" valid="required">
                            	<option value="3">普通员工</option>
                            	<option value="2">部门主管</option>
                            	<option value="1">人事专员</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_lg"><i class=" icon-eye-open"></i></span><input type="text" name="password" placeholder="登录密码" valid="required"/>
                        </div>
                    </div>
                </div>
                <div class="control-group" >
                	 <div class="controls" >
                        <div class="main_input_box" >
                    		<input type="button" style="width: 85%;margin: 0 auto;" class="btn btn-info btn-block" value="提交注册" onclick="valid('#registform',submitReight)"/>
                    	</div>
                    </div>
                </div>
                <div class="form-actions"></div>
                <a href="javascript:;" onclick="showRigist()">已有系统账号？点击这里登录...</a>
            </form>
        </div>
        <div id="forget" style="display: none;">            
            <form id="forgetform" class="form-vertical" action="${ctx }/login/forget.do" method="post">
				<div class="control-group normal_text"><h3>密码找回</h3><br/><h5>请填认真写以下信息，用于密码找回验证</h5></div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_ly"><i class="icon-user"></i></span><input type="text" name="name" placeholder="员工姓名" valid="required"/>
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_ly"><i class="icon-font"></i></span><input type="text" name="empno" placeholder="员工工号" valid="required"/>
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_ly"><i class="icon-tag"></i></span><input type="text" name="tel" placeholder="联系电话" valid="tel"/>
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_ly"><i class="icon-check"></i></span><input type="text" name="idno" placeholder="身份证号" valid="required"/>
                        </div>
                    </div>
                </div>
                 <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_ly">
                            <i class="icon-calendar"></i></span>
                            <input type="text" class="datepickerInput" style="margin-left: -6px;" name="birth" placeholder="出身日期" valid="day"/>
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_ly"><i class="icon-list"></i></span>
                            <select  name="dep" placeholder="员工部门" valid="required">
                            	<option value="xs">销售部</option>
                            	<option value="rs">人事部</option>
                            	<option value="js">技术部</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_ly"><i class=" icon-eye-open"></i></span><input type="text" name="password" placeholder="新密码" valid="required"/>
                        </div>
                    </div>
                </div>
                <div class="control-group" >
                	 <div class="controls" >
                        <div class="main_input_box" >
                    		<input type="button" style="width: 85%;margin: 0 auto;" class="btn btn-danger btn-block" value="申请重置" onclick="valid('#forgetform',submitForget)"/>
                    	</div>
                    </div>
                </div>
                <div class="form-actions"></div>
                <a href="javascript:;" onclick="showForget()">返回登录</a>
            </form>
        </div>
        <%@include file="../common/modal.jspf" %>
    </body>
</html>