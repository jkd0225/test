<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>


<form id="articleForm" action="<c:url value='/tboardInsert'/>"
	method="post" enctype="multipart/form-data">
	<input type="hidden" name="num" value="${vo.num }"> <input
		type="hidden" name="ref" value="${vo.ref }"> <input
		type="hidden" name="lev" value="${vo.lev }"> <input
		type="hidden" name="step" value="${vo.step }">
	<h3 style="margin-bottom: 25px;">Article Form</h3>
	<div class="form-group">
		<input type="text" class="form-control" name="title"
			placeholder="title" required>
	</div>
	<div class="form-group">
		<input type="text" class="form-control" name="writer"
			placeholder="writer" required>
	</div>
	<div class="form-group">
		<textarea class="form-control" name="content"
			placeholder="content" maxlength="140" rows="7"></textarea>
	</div>
	<div class="form-group">
		<input type="file" name="file1" class="form-control">
	</div>
	<button type="submit" id="submit" name="submit"
		class="btn btn-primary pull-right">Submit Form</button>
</form>




