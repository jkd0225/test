<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container-fluid" style="margin-bottom: 15px;">
	<p class="text-left" style="font-size: x-large;">상세보기</p>


	<button type="submit" class="btn btn-primary" style="float: right;"
		onclick="location='<c:url value='/tboardUpdate?num=${vo.num }'/>'">수정</button>


</div>

<div class="panel panel-primary" style="overflow: auto; height: 45%;">
	<div class="panel-heading">${vo.title }
		<div class="panel-body">${vo.content }</div>
	</div>
	<a
		href="${pageContext.request.contextPath}/resources/upload/${vo.savefilename}"
		target="_blank"> <img class="img-thumbnail" alt=""
		src="${pageContext.request.contextPath}/resources/upload/${vo.savefilename}"
		width="304" height="236">
	</a>

</div>
<div class="form-control" style="margin-bottom: 15px;">
	 <a 
		href="<c:url value='/fileDownload?num=${vo.num }'/>">${vo.orgfilename }</a>
		<span class="pull-right">${vo.filesize }</span>
</div>

<button type="button" class="btn btn-primary" style="float: right;"
	onclick="location='<c:url value='/tboardInsert?num=${vo.num }&ref=${vo.ref}&lev=${vo.lev}&step=${vo.step}'/>'">답글</button>






