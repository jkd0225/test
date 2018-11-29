<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://www.springframework.org/security/tags"%>

<div class="container-fluid" style="margin-bottom: 15px;">
	<p class="text-left" style="font-size: x-large;">게시판</p>
	<button type="button" class="btn btn-default" style="float: right;"
		onclick="location='<c:url value='/t_board'/>'">글쓰기</button>
</div>

<div class="container-fluid" style="margin-bottom: 15px;">
	<div class="btn-group btn-group">
		<button type="button" class="btn btn-default"
			onclick='location.href="<c:url value='/list?sort=hit'/>"'>조회수</button>
		<button type="button" class="btn btn-default"
			onclick='location.href="<c:url value='/list?sort=recomm'/>"'>추천수</button>
		<button type="button" class="btn btn-default"
			onclick='location.href="<c:url value='/list?sort=comments'/>"'>코멘트수</button>
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
				<button type="submit" class="btn btn-default">
					<i class="fa fa-search"></i>
				</button>
			</div>
		</div>
	</form>
</div>
<div class="container-fluid">

	<div class="table-responsive">
		<table class="table table-striped table-hover">
			<tbody>
				<c:forEach var="vo" items="${list }">
					<c:choose>
						<c:when test="${vo.comments != 0 }">
							<tr style="border-left: 5px solid #fff">
						</c:when>
						<c:otherwise>
							<tr style="border-left: 5px solid #333">
						</c:otherwise>
					</c:choose>
					<td style="width: 5%">${vo.num }</td>
					<td style="width: 44%"><a
						href="<c:url value='/detail?num=${vo.num }'/>">${vo.title }</a></td>
					<td style="width: 7%"><i class='fas fa-comment'></i>
						${vo.comments }</td>
					<td style="width: 7%"><i class='fas fa-thumbs-up'></i>
						${vo.recomm }</td>
					<td style="width: 7%"><i class='fas fa-eye'></i> ${vo.hit }</td>
					<td style="width: 15%">
						<div class="dropdown">
							<label class="dropdown-toggle" data-toggle="dropdown"
								style="cursor: pointer;"> ${vo.writer } </label>

							<ul class="dropdown-menu">
								<li><a href="#">HTML</a></li>
								<li><a href="#">CSS</a></li>
								<li><a href="#">JavaScript</a></li>
							</ul>
						</div>
					</td>
					<td style="width: 15%">${vo.regdate }</td>
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
