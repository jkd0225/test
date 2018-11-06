<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container-fluid" style="margin-bottom: 15px;">
	<p class="text-left" style="font-size: x-large;">채팅</p>
	<button type="button" class="btn btn-primary" style="float: right;"
		onclick="location='<c:url value='/t_board'/>'">방만들기</button>
</div>

<c:forEach var="vo" items="${list }">
	<div class="container-fluid">
		<div class="panel panel-primary">
			<div class="panel-heading">${vo.room_num }</div>
			<div class="panel-body">
				<a href="<c:url value='/chat?room=${vo.room_num }'/>" class="pull-right">입장</a>
			</div>
		</div>
	</div>
</c:forEach>




