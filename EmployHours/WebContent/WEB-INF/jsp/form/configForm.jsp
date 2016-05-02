<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<div class="span5">
<form id="configForm" class="form-horizontal" action="sys/configModify.do" method="post">
  <div class="control-group">
    <label class="control-label" for="configName">配置名</label>
    <div class="controls">
      <input type="text" id="configName" name="key" placeholder="ConfigName" value="${config.key }">
      <input type="hidden" name="id" value="${config.id }">
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="configValue">配置值</label>
    <div class="controls">
      <textarea  id="configValue" rows="3" name="value" placeholder="ConfigValue">${config.value }</textarea>
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="configRemarks">备注</label>
    <div class="controls">
      <textarea  id="configRemarks" rows="3" name="remarks" placeholder="Remarks">${config.remarks }</textarea>
    </div>
  </div>
  <div class="control-group">
    <div class="controls">
      <button type="button" class="btn btn-primary" onclick="save('#configForm');">保存修改</button>
    </div>
  </div>
</form>	
</div>
    