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
</div>
<div class="form-group">
	<input type="text" name="orgfilename" class="form-control"
		value="${vo.orgfilename }"> <a
		href="<c:url value='/fileDownload?num=${vo.num }'/>">다운로드</a>
		<img alt="" src="${pageContext.request.contextPath}/resources/upload/${vo.savefilename}">
</div>
<button type="button" class="btn btn-primary" style="float: right;"
	onclick="location='<c:url value='/tboardInsert?num=${vo.num }&ref=${vo.ref}&lev=${vo.lev}&step=${vo.step}'/>'">답글</button>







