<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript">
$(function(){
	page(1);
	loadPage();
	});
</script>
<div class="span12">
	<div class="span12 pull-right">
		<form id="search" class="form-inline pull-right" action="empHour/empHourPage.do">
		  <input type="text" class="input-middle" name="empno" value="" placeholder="查询员工工号"/>
		  <input type="text" class="input-middle" name="empname" value="" placeholder="查询员工姓名"/>
		  <input type="hidden" class="input-middle" name="empdep" value="${sysuser.dep }"/>
		  <input type="text" class="input-middle datepickerInput" name="workdate" value="" placeholder="查询日期"/>
		  <button type="button" class="btn btn-info search" onclick="page(1)" 
		  	data-toggle="tooltip" data-placement="top" title="查询">
		  <i class="icon icon-search"></i>
		  </button>
		  <button type="button" class="btn btn-info" onclick="refresh()"
		  data-toggle="tooltip" data-placement="top" title="刷新">
		  <i class="icon icon-refresh"></i>
		  </button>
		   
		</form>
	</div>
	<table class="table table-bordered" style="text-align: center; background: #fff;">
		<tr id="template" style="display: none;">
			<td item="index"></td>
			<td item="empno"></td>
			<td item="empname"></td>
			<td item="workdate"></td>
			<td item="planhour"></td>
			<td item="workedhour"></td>
			<td item="misshour"></td>
			<td item="status"></td>
		</tr>
		<thead>
			<tr>
				<th>#</th><th>工号</th><th>员工</th><th>日期</th><th>应出勤工时</th><th>已出勤工时</th><th>未出勤工时</th><th>状态</th>
			</tr>
		</thead>
		<tbody id="tableData"></tbody>
		<thead>
			<tr>
				<th colspan="20"><%@include file="../common/page.jspf" %></th>
			</tr>
		</thead>
		
	</table>
</div>
    