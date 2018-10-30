<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<%@ page pageEncoding="utf-8"%>
<div class="jumbotron">
	<h1>관리자 페이지</h1>
	<p>views/admin/index.jsp</p>
</div>
<table class="table table-striped">
	<thead>
		<tr>
			<th>User</th>
			<th>Roles</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="user" items="${ users }">
			<tr>
				<td>${ user.email }</td>
				<td>${ user.authority }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>