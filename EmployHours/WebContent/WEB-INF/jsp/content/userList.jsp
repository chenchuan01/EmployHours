<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript">
$(function(){page(1);});
</script>
<div class="span12">
	<div class="span4 pull-right">
		<form id="search" class="form-inline pull-right" action="sys/userPage.do">
		  <input type="text" class="input-middle" name="userName" placeholder="查询系统用户">
		  <button type="button" class="btn btn-info search" onclick="page(1)" 
		  	data-toggle="tooltip" data-placement="top" title="查询">
		  <i class="icon icon-search"></i>
		  </button>
		  <button type="button" class="btn btn-success" onclick="refresh()"
		  data-toggle="tooltip" data-placement="top" title="刷新">
		  <i class="icon icon-refresh"></i>
		  </button>
		  <button type="button" class="btn btn-primary" onclick="autoWin('后台用户新增','sys/userForm.do')"  
		  data-toggle="tooltip" data-placement="top" title="新增">
		  <i class="icon icon-plus"></i>
		  </button>
		</form>
	</div>
	<table class="table table-bordered" style="text-align: center; background: #fff;">
		<tr id="template" style="display: none;">
			<td item="index"></td>
			<td item="userName"></td>
			<td item="oprea" itemFiled="id">
				<a href="javascript:;" title="修改信息" onclick="autoWin('后台用户修改','sys/userForm.do?id=')" class="btn btn-warning btn-sm"><i class="icon icon-edit"></i></a>
				<a href="javascript:;" title="删除信息" onclick="deleteItem('sys/userDelete.do?id=')" class="btn btn-danger btn-sm"><i class="icon icon-trash"></i></a>
			</td>
		</tr>
		<thead>
			<tr>
				<th>#</th><th>登录用户名</th><th>操作</th>
			</tr>
		</thead>
		<tbody id="tableData"></tbody>
		<thead>
			<tr>
				<th colspan="4"><%@include file="../common/page.jspf" %></th>
			</tr>
		</thead>
		
	</table>
</div>
    