<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript">
$(function(){page(1);});
</script>
<div class="span12">
	<div class="span12 pull-right">
		<form id="search" class="form-inline pull-right" action="empHour/empHourPage.do">
		<input type="hidden" class="input-middle" name="status" value="0">
		  <input type="text" class="input-middle" name="empno" value="" placeholder="查询员工工号"/>
		  <input type="text" class="input-middle" name="empname" value="" placeholder="查询员工姓名"/>
		  <select name="empdep"  placeholder="员工部门">
			<option value="">员工部门</option>
			<option value="xs">销售部</option>
			<option value="rs">人事部</option>
			<option value="js">技术部</option>
		  </select>
		  <input type="text" class="input-middle datepickerInput" name="workdate" value="" placeholder="查询日期"/>
		  <button type="button" class="btn btn-info search" onclick="page(1)" 
		  	data-toggle="tooltip" data-placement="top" title="查询">
		  <i class="icon icon-search"></i>
		  </button>
		  <button type="button" class="btn btn-success" onclick="hoursCheck('empHour/hoursCheck.do','batch','1')"
		  data-toggle="tooltip" data-placement="top" title="批量通过">
		  	通过
		  </button>
		  <button type="button" class="btn btn-danger" onclick="hoursCheck('empHour/hoursCheck.do','batch','2')"
		  data-toggle="tooltip" data-placement="top" title="批量否决">
		  	否决
		  </button>
		   
		</form>
	</div>
	<table class="table table-bordered" style="text-align: center; background: #fff;">
		<tr id="template" style="display: none;">
			<td item="checkBox" itemFiled="id">
				<input type="checkbox" title="选择"  class="choose" value="#itemId"/>
			</td>
			<td item="index"></td>
			<td item="empno"></td>
			<td item="empname"></td>
			<td item="empdep"></td>
			<td item="workdate"></td>
			<td item="planhour"></td>
			<td item="workedhour"></td>
			<td item="misshour"></td>
			<td item="status"></td>
			<td item="oprea" itemFiled="id">
				<a href="javascript:;" title="通过" onclick="hoursCheck('empHour/hoursCheck.do?id=','single','1')" class="btn btn-success btn-sm"><i class="icon icon-ok"></i></a>
				<a href="javascript:;" title="不通过" onclick="hoursCheck('empHour/hoursCheck.do?id=','single','2')" class="btn btn-danger btn-sm"><i class="icon icon-remove"></i></a>
			</td>
		</tr>
		<thead>
			<tr>
				<th></th><th>#</th><th>工号</th><th>员工</th><th>部门</th><th>日期</th><th>应出勤工时</th><th>已出勤工时</th><th>未出勤工时</th><th>状态</th><th>操作</th>
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
    