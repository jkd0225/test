<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="<c:url value='/'/>">Logo</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="<c:url value='/room?user_id=aaa'/>">채팅방</a></li>
				<li><a href="<c:url value='/list'/>">게시판</a></li>
				<li><a href="<c:url value='/naverLogin'/>">로그인</a></li>
				<!-- 로그인 버튼 -->
				<sec:authorize access="isAnonymous()">
					<c:url var="loginUrl" value="/login" />
					<li><a href="${ loginUrl }">로그인</a></li>
				</sec:authorize>
				<!-- 로그아웃 버튼 -->
				<sec:authorize access="isAuthenticated()">
					<c:url var="logoutUrl" value="/logout" />
					<form action="${logoutUrl}" method="post"
						class="navbar-form navbar-right">
						<button type="submit" class="btn btn-default">로그아웃</button>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
					</form>
				</sec:authorize>
				<!-- 관리자 페이지 버튼 -->
				<sec:authorize access="hasRole('ADMIN')">
					<li><a href="<c:url value='/admin'/>">관리</a></li>
				</sec:authorize>
				<li><a href="#contact">CONTACT</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">MORE <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">Merchandise</a></li>
						<li><a href="#">Extras</a></li>
						<li><a href="#">Media</a></li>
					</ul></li>
				<li><a href="#"><span class="glyphicon glyphicon-search"></span></a></li>
			</ul>
		</div>
	</div>
</nav>