<html>
<head>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../res/lecheng/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/theme.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.validate.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.treeview.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.ui.css" rel="stylesheet" type="text/css"/>

<!-- <script src="/thirdparty/ckeditor/ckeditor.js" type="text/javascript"></script> -->
<!-- <script src="/thirdparty/My97DatePicker/WdatePicker.js" type="text/javascript"></script> -->
<script type="text/javascript" src="../res/fckeditor/fckeditor.js"></script>
<script src="../res/common/js/jquery.js" type="text/javascript"></script>
<script src="../res/common/js/jquery.ext.js" type="text/javascript"></script>
<script src="../res/common/js/jquery.form.js" type="text/javascript"></script>
<script src="../res/common/js/lecheng.js" type="text/javascript"></script>
<script src="../res/lecheng/js/admin.js" type="text/javascript"></script>

<link rel="stylesheet" href="../res/css/style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>用户列表</title>

</head>
<body>

<div class="box-positon">
	<div class="rpos">当前位置: 用户管理 - 列表</div>
	<form class="ropt">
		<input class="add" type="button" value="添加" onClick="javascript:window.location.href='add.do'"/>
	</form>
	<div class="clear"></div>
</div>
<div class="body-box">

<form action="list.do" method="post" style="padding-top:5px;">
登录名: <input type="text" name="loginname" value="${QUERY.loginname}"/>
	<select  name="isenabled">
		<!--选择有效-->
		<c:if test="${QUERY.isenabled==1}">
			<option value="0">请选择</option>
			<option value="1" selected="selected">有效</option>
		    <option value="2">无效</option>	
		</c:if>
		<!--初始化-->
		<c:if test="${QUERY.isenabled==0}">
			<option value="0" selected="selected">请选择</option>
			<option value="1" >有效</option>
		    <option value="2">无效</option>	
		</c:if>
		<!--选择无效-->
		<c:if test="${QUERY.isenabled==2}">
			<option value="0" >请选择</option>
			<option value="1" >有效</option>
		    <option value="2" selected="selected">无效</option>	
		</c:if>
	</select>
	<input type="submit" class="query" value="查询"/>
</form>
<table cellspacing="1" cellpadding="0" border="0" width="100%" class="pn-ltable">
	<thead class="pn-lthead">
		<tr>
			<th width="20"><input type="checkbox" onClick="checkBox('ids',this.checked)"/></th>
			<th>用户ID</th>
			<th>登录名</th>
			<th>真实姓名</th>
			<th>性别</th>			
			<th>出生日期</th>
			<th>邮箱</th>
			<th>部门</th>
			<th>是否可用</th>
			<th>头像</th>
			<th>操作选项</th>
		</tr>
	</thead>
	<tbody class="pn-ltbody">
<form action="deletes.do" method="post">	
<c:forEach items="${LIST}" var="user" >
		<tr bgcolor="#ffffff" onMouseOut="this.bgColor='#ffffff'" onMouseOver="this.bgColor='#eeeeee'">
			<td><input type="checkbox" value="${user.id}" name="ids"/></td>
			<td align="center">${user.id }</td>
			<td align="center">${user.loginname }</td>
			<td align="center">${user.realname }</td>
			<td align="center">${user.sex }</td>
			<td align="center">${user.birthdayTxt }</td>
			<td align="center">${user.email }</td>
			<td align="center">${user.dept.name }</td>
			<td align="center">${user.isenabledTxt }</td>
			<td align="center"><img src="../upload/${user.picurl }" width="50px" height="50px"/></td>
			<td align="center">
			<a class="pn-opt" href="get.do?id=${user.id} ">修改</a> | <a class="pn-opt"   onClick="if(!confirm('是否删除数据?')){return false;}" href="delete.do?id=${user.id}">删除</a>
			</td>
		</tr>
</c:forEach>		
</form>	
	</tbody>
</table>
<div style="margin-top:15px;">
	<input class="del-button" type="submit" value="删除" />
</div>

	<div style="float:right">
	<a href="list.do?page=1&loginname=${QUERY.loginname}&isenabled=${QUERY.isenabled}">首页</a>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="list.do?page=${(PAGE-1)<=0?1:(PAGE-1)}&loginname=${QUERY.loginname}
	&isenabled=${QUERY.isenabled}">上一页</a>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="list.do?page=${PAGE+1>COUNT?PAGECONT:PAGE+1}&loginname=${QUERY.loginname}
	&isenabled=${QUERY.isenabled}">下一页</a>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="list.do?page=${COUNT}&loginname=${QUERY.loginname}&isenabled=${QUERY.isenabled}">
	尾页</a>
	
	&nbsp;&nbsp;&nbsp;&nbsp;当前第${PAGE}页 /共${COUNT}页</div>
	
</div>
</body>
</html>