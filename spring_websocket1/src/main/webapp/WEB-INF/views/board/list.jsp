<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://www.springframework.org/security/tags" %>

<div class="container-fluid" style="margin-bottom: 15px;">
	<p class="text-left" style="font-size: x-large;">계층형 게시판</p>
	<button type="button" class="btn" style="float: right;"
		onclick="location='<c:url value='/tboardInsert'/>'">글쓰기</button>
</div>

<div class="container-fluid">
	<div class="table-responsive">
		<table class="table table-bordered table-striped table-hover">
			<thead>
				<tr>
					<th>#</th>
					<th>writer</th>
					<th>title</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${list }">
					<tr>
						<td>${vo.num }</td>
						<td>${vo.writer }</td>
						<td>
						<c:if test="${vo.lev>0 }">
							<c:forEach var="i" begin="1" end="${vo.lev }">
								&nbsp;&nbsp;
							</c:forEach>
							[re]
						</c:if>
						<a href="<c:url value='/tboardDetail?num=${vo.num }'/>">${vo.title }</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	

	<div class="text-center">
		<ul class="pagination">
			<c:choose>
				<c:when test="${pu.startPageNum > 5 }">
					<li><a
						href="<c:url value='/list?pageNum=${pu.startPageNum - 1 }&field=${field }&keyword=${keyword }&sort=${sort }'/>">
							<i class="fa fa-chevron-left"></i>
					</a></li>
				</c:when>
				<c:otherwise>
					<li class="disabled"><a href=""> <i
							class="fa fa-chevron-left"></i></a></li>
				</c:otherwise>
			</c:choose>

			<c:forEach var="i" begin="${pu.startPageNum }"
				end="${pu.endPageNum }">
				<c:choose>
					<c:when test="${pu.pageNum == i }">
						<li class="active"><a
							href="<c:url value='/list?pageNum=${i }&field=${field }&keyword=${keyword }&sort=${sort }'/>">${i }</a></li>
					</c:when>
					<c:otherwise>
						<li><a
							href="<c:url value='/list?pageNum=${i }&field=${field }&keyword=${keyword }&sort=${sort }'/>">${i }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<c:choose>
				<c:when test="${pu.endPageNum < pu.totalPageCount }">
					<li><a
						href="<c:url value='/list?pageNum=${pu.endPageNum + 1 }&field=${field }&keyword=${keyword }&sort=${sort }'/>">
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
</div>
