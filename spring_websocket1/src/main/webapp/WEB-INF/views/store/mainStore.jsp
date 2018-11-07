<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
#img {
	opacity: 0.5;
}

#img:hover {
	opacity: 1;
}
</style>

<div class="container-fluid" style="margin-bottom: 15px;">
	<p class="text-left" style="font-size: x-large;">아이콘</p>
</div>

<div class="container-fluid" style="margin-bottom: 15px;">
	<div class="btn-group btn-group">
		<button type="button" class="btn btn-primary"
			onclick='location.href="<c:url value='/list?sort=hit'/>"'>조회수</button>
		<button type="button" class="btn btn-primary"
			onclick='location.href="<c:url value='/list?sort=recomm'/>"'>추천수</button>
		<button type="button" class="btn btn-primary"
			onclick='location.href="<c:url value='/list?sort=comments'/>"'>코멘트수</button>
	</div>

	<form method="post" action="<c:url value='/list'/>"
		style="display: inline-flex; float: right;">
		<div class="input-group">
			<select class="form-control" name="field">
				<option value="title"
					<c:if test="${field == 'name' }">selected="selected"</c:if>>이름</option>
				<option value="writer"
					<c:if test="${field == 'type' }">selected="selected"</c:if>>속성</option>
				<option value="content"
					<c:if test="${field == 'num' }">selected="selected"</c:if>>번호</option>
			</select>
		</div>
		<div class="input-group">
			<input type="text" class="form-control" name="keyword"
				value="${keyword }">
			<div class="input-group-btn">
				<button type="submit" class="btn">
					<i class="fa fa-search"></i>
				</button>
			</div>
		</div>
	</form>
</div>

<div class="container-fluid text-center bg-info">
	<c:forEach var="vo" items="${list }" varStatus="status">
		<img src="<c:url value='/resources/img/'/>${vo.num }.png"
			style="width: 70px; cursor: pointer; margin: 20px;" id="img"
			title="${vo.name }" data-toggle="modal"
			data-target="#myModal${status.count }">

		<div id="myModal${status.count }" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">상세보기</h4>
					</div>
					<div class="modal-body">
						<img src="<c:url value='/resources/img/'/>${vo.num }_front.png" style="width: 100px;"> <strong>${vo.name }</strong>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>
		<c:choose>
			<c:when test="${status.count%4==0 }">
				<br>
			</c:when>
		</c:choose>
	</c:forEach>
</div>

<div class="text-center">
	<ul class="pagination">
		<c:choose>
			<c:when test="${pu.startPageNum > 5 }">
				<li><a
					href="<c:url value='/store?pageNum=${pu.startPageNum - 1 }&field=${field }&keyword=${keyword }&sort=${sort }'/>">
						<i class="fa fa-chevron-left"></i>
				</a></li>
			</c:when>
			<c:otherwise>
				<li class="disabled"><a href=""> <i
						class="fa fa-chevron-left"></i></a></li>
			</c:otherwise>
		</c:choose>

		<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
			<c:choose>
				<c:when test="${pu.pageNum == i }">
					<li class="active"><a
						href="<c:url value='/store?pageNum=${i }&field=${field }&keyword=${keyword }&sort=${sort }'/>">${i }</a></li>
				</c:when>
				<c:otherwise>
					<li><a
						href="<c:url value='/store?pageNum=${i }&field=${field }&keyword=${keyword }&sort=${sort }'/>">${i }</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<c:choose>
			<c:when test="${pu.endPageNum < pu.totalPageCount }">
				<li><a
					href="<c:url value='/store?pageNum=${pu.endPageNum + 1 }&field=${field }&keyword=${keyword }&sort=${sort }'/>">
						<i class="fa fa-chevron-right"></i>
				</a></li>
			</c:when>
			<c:otherwise>
				<li class="disabled"><a href=""> <i
						class="fa fa-chevron-right"></i></a></li>
			</c:otherwise>
		</c:choose>

	</ul>
</div>

