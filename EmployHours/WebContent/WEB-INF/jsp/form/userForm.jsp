<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="../common/taglib.jspf" %>
<div class="span5">
<form id="userForm" class="form-horizontal" action="sys/userModify.do" method="post">
  <div class="control-group">
    <label class="control-label" for="userName">用户名</label>
    <div class="controls">
      <input type="text" id="userName" name="userName" placeholder="UserName" value="${user.userName }">
      <input type="hidden" name="id" value="${user.id }">
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="password">密码</label>
    <div class="controls">
      <input type="password" id="password" name="password" placeholder="Password" value="${user.password }">
    </div>
  </div>
  <div class="control-group">
    <div class="controls">
      <button type="button" class="btn btn-primary" onclick="save('#userForm');">保存修改</button>
    </div>
  </div>
</form>	
</div>
    