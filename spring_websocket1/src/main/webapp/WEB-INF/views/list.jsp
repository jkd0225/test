<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://www.springframework.org/security/tags"%>

<div class="container-fluid" style="margin-bottom: 15px;">
	<p class="text-left" style="font-size: x-large;">게시판</p>
	<button type="button" class="btn btn-primary" style="float: right;"
		onclick="location='<c:url value='/t_board'/>'">글쓰기</button>
</div>

<div class="container-fluid" style="margin-bottom: 15px;">
	<div class="btn-group btn-group">
		<button type="button" class="btn btn-primary"
		onclick='location.href="<c:url value='/list?sort=content'/>"'>Apple</button>
		<button type="button" class="btn btn-primary">Samsung</button>
		<button type="button" class="btn btn-primary">Sony</button>
	</div>

	<form method="post" action="<c:url value='/list'/>"
		style="display: inline-flex; float: right;">
		<div class="input-group">
			<select class="form-control" name="field">
				<option value="title"
					<c:if test="${field == 'title' }">selected="selected"</c:if>>글제목</option>
				<option value="writer"
					<c:if test="${field == 'writer' }">selected="selected"</c:if>>작성자</option>
				<option value="content"
					<c:if test="${field == 'content' }">selected="selected"</c:if>>내용</option>
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
<div class="container-fluid">


	<div class="table-responsive">
		<table class="table table-bordered table-striped table-hover">
			<thead>
				<tr>
					<th>#</th>
					<th>title</th>
					<th>코멘트</th>
					<th>추천수</th>
					<th>조회수</th>
					<th>작성자</th>
					<th>date</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${list }">
					<tr>
						<td>${vo.num }</td>
						<td><a href="<c:url value='/detail?num=${vo.num }'/>">${vo.title }</a></td>
						<td>${vo.getComm }</td>
						<td>${vo.recomm }</td>
						<td>${vo.hit }</td>
						<td>${vo.writer }</td>
						<td>${vo.regdate }</td>
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
					<li><a
						href="<c:url value='/list?pageNum=1&field=${field }&keyword=${keyword }&sort=${sort }'/>">1</a></li>
					<li class="disabled"><a href="">...</a></li>
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
					<li class="disabled"><a href="">...</a></li>
					<li><a
						href="<c:url value='/list?pageNum=${pu.totalPageCount }&field=${field }&keyword=${keyword }&sort=${sort }'/>">${pu.totalPageCount }</a></li>
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
