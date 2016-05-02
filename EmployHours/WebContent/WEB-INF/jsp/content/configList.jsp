<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript">
$(function(){page(1);});
</script>
<div class="span12">
	<div class="span6 pull-right">
		<form id="search" class="form-inline pull-right" action="sys/configPage.do">
		  <input type="text" class="input-middle" name="key" placeholder="配置名称">
		  <input type="text" class="input-middle" name="value" placeholder="配置值">
		  <button type="button" class="btn btn-info search" onclick="page(1)" 
		  	data-toggle="tooltip" data-placement="top" title="查询">
		  <i class="icon icon-search"></i>
		  </button>
		  <button type="button" class="btn btn-success" onclick="refresh()"
		  data-toggle="tooltip" data-placement="top" title="刷新">
		  <i class="icon icon-refresh"></i>
		  </button>
		</form>
	</div>
	<table class="table table-bordered" style="text-align: center; background: #fff;">
		<tr id="template" style="display: none;">
			<td item="index"></td>
			<td item="key"></td>
			<td item="value"></td>
			<td item="remarks"></td>
			<td item="oprea" itemFiled="id">
				<a href="javascript:;" title="修改信息" onclick="autoWin('后台配置修改','sys/configForm.do?id=')" class="btn btn-warning btn-sm"><i class="icon icon-edit"></i></a>
			</td>
		</tr>
		<thead>
			<tr>
				<th>#</th><th>配置名</th><th>配置值</th><th>备注</th><th>操作</th>
			</tr>
		</thead>
		<tbody id="tableData"></tbody>
		<thead>
			<tr>
				<th colspan="5"><%@include file="../common/page.jspf" %></th>
			</tr>
		</thead>
		
	</table>
</div>
    