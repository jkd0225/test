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
			<th></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="user" items="${ users }">
			<tr>
				<td>${ user.email }</td>
				<td><c:forEach var="authority" items="${ user.authorities }">
                        ${ authority.authority }
                    </c:forEach></td>
				<td>
					<p>
						<c:url var="changeRolePath" value="/admin/role/${ user.id }" />
						<a href="${ changeRolePath }/admin"
							class="btn btn-default <c:if test="${ user.hasRole('ADMIN') }">btn-primary</c:if>">관리자</a>
						<a href="${ changeRolePath }/manager"
							class="btn btn-default <c:if test="${ user.hasRole('MANAGER') }">btn-primary</c:if>">매니저</a>
						<a href="${ changeRolePath }/user"
							class="btn btn-default <c:if test="${ user.hasRole('USER') }">btn-primary</c:if>">사용자</a>
					</p>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>