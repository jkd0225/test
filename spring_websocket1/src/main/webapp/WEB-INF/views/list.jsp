<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<div class="container-fluid">
	<form method="post" action="<c:url value='/list'/>" style="float: right;margin-top: 18px;"> 
		<select name="field">
			<option value="title" <c:if test="${field == 'title' }">selected="selected"</c:if>>글제목</option>
			<option value="writer" <c:if test="${field == 'writer' }">selected="selected"</c:if>>작성자</option>
			<option value="content" <c:if test="${field == 'content' }">selected="selected"</c:if>>내용</option>
		</select>
	    <input type="text" name="keyword" value="${keyword }">
	    <button type="submit" class="btn btn-xs"><i class="fa fa-search"></i></button>
    </form>
  <h2>Table</h2>
  <div class="table-responsive">          
  <table class="table table-bordered table-striped table-hover">
    <thead>
      <tr>
        <th>#</th>
        <th>title</th>
        <th>date</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="vo" items="${list }">
      <tr>
        <td>${vo.num }</td>
        <td><a href="<c:url value='/detail?num=${vo.num }'/>">${vo.title }</a></td>
        <td>${vo.regdate }</td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
  </div>
  <button type="button" class="btn btn-primary" style="float: right;" onclick="location='<c:url value='/t_board'/>'">글쓰기</button>
  <br>
 
  <div class="text-center">
  	 <ul class="pagination">
  	 <c:choose>
  	 	<c:when test="${pu.startPageNum > 5 }">
  	 		<li><a href="<c:url value='/list?pageNum=${pu.startPageNum - 1 }&field=${field }&keyword=${keyword }'/>">
  	 		<i class="fa fa-chevron-left"></i></a></li>
  	 	</c:when>
  	 	<c:otherwise>
			<li class="disabled"><a href="">
			<i class="fa fa-chevron-left"></i></a></li>
		</c:otherwise>
  	 </c:choose>
  	 
  	<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
  		<c:choose>
  			<c:when test="${pu.pageNum == i }">
		  		<li class="active"><a href="<c:url value='/list?pageNum=${i }&field=${field }&keyword=${keyword }'/>">${i }</a></li>
  			</c:when>
  			<c:otherwise>
  				<li><a href="<c:url value='/list?pageNum=${i }&field=${field }&keyword=${keyword }'/>">${i }</a></li>
  			</c:otherwise>
  		</c:choose>
  	</c:forEach>
  	
  	 <c:choose>
  	 	<c:when test="${pu.endPageNum < pu.totalPageCount }">
  	 		<li><a href="<c:url value='/list?pageNum=${pu.endPageNum + 1 }&field=${field }&keyword=${keyword }'/>">
  	 		<i class="fa fa-chevron-right"></i></a></li>
  	 	</c:when>
  	 	<c:otherwise>
			<li class="disabled"><a href="">
			<i class="fa fa-chevron-right"></i></a></li>
		</c:otherwise>
  	 </c:choose>
  	</ul>
   </div>
</div>
