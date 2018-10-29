<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<table>
<c:forEach var="vo" items="${list }">
	<tr>
		<td>${vo.room_num }</td>
		<td>${vo.user_id }</td>
		<td>${vo.tutor_id }</td>
		<td><a href="<c:url value='/chat?room=${vo.room_num }'/>">채팅</a></td>
	</tr>
</c:forEach>
</table>
