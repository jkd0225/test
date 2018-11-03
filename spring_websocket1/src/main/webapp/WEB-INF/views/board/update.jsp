<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>


<form id="articleForm" action="<c:url value='/tboardUpdate'/>"
	method="post" enctype="multipart/form-data">
	<input type="hidden" name="num" value="${vo.num }"> <input
		type="hidden" name="ref" value="${vo.ref }"> <input
		type="hidden" name="lev" value="${vo.lev }"> <input
		type="hidden" name="step" value="${vo.step }">
	<h3 style="margin-bottom: 25px;">Article Form</h3>
	<div class="form-group">
		<input type="text" class="form-control" name="title"
			placeholder="title" value="${vo.title }" required>
	</div>
	<div class="form-group">
		<input type="text" class="form-control" name="writer"
			placeholder="writer" value="${vo.writer }" required>
	</div>
	<div class="form-group">
		<textarea class="form-control" name="content" placeholder="content"
			maxlength="140" rows="7">${vo.content }</textarea>
	</div>
	<div class="form-group">
		<input type="text" name="orgfilename" class="form-control" ${vo.orgfilename }>
	</div>
	<div class="form-group">
		<input type="file" name="file" class="form-control">
	</div>
	<button type="submit" id="submit" name="submit"
		class="btn btn-primary pull-right">Submit Form</button>
</form>

