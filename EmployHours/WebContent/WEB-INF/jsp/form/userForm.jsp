<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../common/taglib.jspf"%>
<script type="text/javascript">
$(function(){
	loadPage();
});
</script>
<div class="span5">
	<form id="userForm" class="form-horizontal" action="sys/userModify.do"
		method="post">
		<div class="control-group">
			<label class="control-label" for="name">姓名</label>
			<div class="controls">
					<input id="name"
						type="text" name="name" value="${user.name }" placeholder="员工姓名" valid="required" />
			</div>
		</div>
		<br/>
		<div class="control-group">
			<label class="control-label" for="empno">工号</label>
			<div class="controls">
					<input id="empno"
						type="text" name="empno" value="${user.empno }" placeholder="员工工号" valid="required" />
			</div>
		</div>
		<br/>
		<div class="control-group">
			<label class="control-label" for="tel">性别</label>
			<div class="controls">
					<select id="sex"
						name="sex" placeholder="员工性别" valid="required">
						<option value="男" ${'男' eq user.sex?'selected':'' }>男</option>
						<option value="女" ${'女' eq user.sex?'selected':'' }>女</option>
					</select>
			</div>
		</div>
		<br/>
		<div class="control-group">
			<label class="control-label" for="address">电话</label>
			<div class="controls">
					<input id="tel"
						type="text" name="tel" value="${user.tel }" placeholder="联系电话" valid="tel" />
			</div>
		</div>
		<br/>
		<div class="control-group">
			<label class="control-label" for="address">证件号</label>
			<div class="controls">
					<input id="idno"
						type="text" name="idno" value="${user.idno }" placeholder="身份证号" valid="required" />
			</div>
		</div>
		<br/>
		<div class="control-group">
			<label class="control-label" for="address">住址</label>
			<div class="controls">
					<input id="address"
						type="text" name="address" value="${user.address }" placeholder="家庭住址" valid="required" />
			</div>
		</div>
		<br/>
		<div class="control-group">
			<label class="control-label" for="birth">出身日期</label>
			<div class="controls">
				<input id="birth"
					type="text" class="datepickerInput" 
					name="birth" value="${user.birth }" placeholder="出身日期" valid="day" />
			</div>
		</div>
		<br/>
		<div class="control-group">
			<label class="control-label" for="dep">部门</label>
			<div class="controls">
					<select id="dep"
						name="dep" placeholder="员工部门" valid="required" ${'1' eq sysuser.roles || 'rs' eq sysuser.dep?'':'disabled' }>
						<option value="xs" ${'xs' eq user.dep ? 'selected':'' }>销售部</option>
						<option value="rs" ${'rs' eq user.dep ? 'selected':'' }>人事部</option>
						<option value="js" ${'js' eq user.dep ? 'selected':'' }>技术部</option>
					</select>
			</div>
		</div>
		<br/>
		<div class="control-group">
			<label class="control-label" for="roles">角色</label>
			<div class="controls">
					<select id="roles" name="roles" placeholder="员工角色" valid="required" ${'1' eq sysuser.roles || 'rs' eq sysuser.dep||'2' eq sysuser.roles?'':'disabled' }>
						<option value="3" ${'3' eq user.roles ? 'selected':'' }>普通员工</option>
						<option value="2" ${'2' eq user.roles ? 'selected':'' }>部门主管</option>
						<c:if test="${'rs' eq sysuser.dep }">
						<option value="1" ${'1' eq user.roles ? 'selected':'' }>人事专员</option>
						</c:if>
					</select>
			</div>
		</div>
		<br/>
		<div class="control-group">
			<label class="control-label" for="userName">用户名</label>
			<div class="controls">
				<input type="text" id="userName" name="userName"
					placeholder="用户名与工号一致" value="${user.userName }" valid="required" ${'1' eq sysuser.roles || 'rs' eq sysuser.dep?'':'readonly' }> <input
					type="hidden" name="id" value="${user.id }" >
			</div>
		</div>
		<br/>
		<div class="control-group">
			<label class="control-label" for="password">密码</label>
			<div class="controls">
				<input type="password" id="password" name="password"
					placeholder="用户登录密码" value="${user.password }" valid="required">
			</div>
		</div>
		<br/>
		<div class="control-group">
			<div class="controls">
				<button type="button" class="btn btn-primary"
					onclick="valid('#userForm',save);">保存修改</button>
			</div>
		</div>
	</form>
</div>
