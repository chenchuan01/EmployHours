<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../common/taglib.jspf"%>
<script type="text/javascript">
$(function(){
	loadPage();
});
</script>
<div class="span4">
	<form id="empHourForm" class="form-horizontal" action="empHour/empHourModify.do"
		method="post">
		<div class="control-group">
			<label class="control-label" for="empno">工号</label>
			<div class="controls">
					<input id="empno"
						type="text" name="empno" value="${sysuser.empno }" placeholder="员工工号" valid="required" readonly="readonly"/>
			</div>
		</div>
		<br/>
		<div class="control-group">
			<label class="control-label" for="workdate">报工日期</label>
			<div class="controls">
				<input id="birth"
					type="text" class="datepickerInput" 
					name="workdate" value="${empHour.workdate }" placeholder="报工日期" valid="day" />
			</div>
		</div>
		<br/>
		<div class="control-group">
			<label class="control-label" for="planhour">应出勤工时</label>
			<div class="controls">
					<input id="planhour"
						type="text" name="planhour" value="${empty empHour.planhour?0:empHour.planhour }" placeholder="应出勤工时" valid="digits" />
			</div>
		</div>
		<br/>
		<div class="control-group">
			<label class="control-label" for="workedhour">已出勤工时</label>
			<div class="controls">
					<input id="workedhour"
						type="text" name="workedhour" value="${empty empHour.workedhour?0:empHour.workedhour }" placeholder="已出勤工时" valid="digits" />
			</div>
		</div>
		<br/>
		<div class="control-group">
			<label class="control-label" for="misshour">未出勤工时</label>
			<div class="controls">
					<input id="misshour"
						type="text" name="misshour" value="${empty empHour.misshour?0:empHour.misshour }" placeholder="未出勤工时" valid="digits" />
			</div>
		</div>
		<br/>
		<div class="control-group">
			<div class="controls">
				<button type="button" class="btn btn-primary"
					onclick="valid('#empHourForm',save);">提交审核</button>
			</div>
		</div>
	</form>
</div>
