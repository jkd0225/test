<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>


<!-- include summernote css/js-->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script src="<c:url value="/resources/js/summernote-ko-KR.js"/>"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//아이디가 content 에 서머노트를 적용 한다.
		$('#content1').summernote({

			lang : 'ko-KR',
			height : 600,
			minHeight : 300, // set minimum height of editor
			maxHeight : 600, // set maximum height of editor
			focus : true
		// set focus to editable area after initializing summe
		});

	});
</script>
<form id="articleForm" action="<c:url value='/gboardUpdateOk'/>"
	method="post">
	<input type="hidden" name="num" value="${vo.num }">
	<h3 style="margin-bottom: 25px;">Article Form</h3>
	<div class="form-group">
		<input type="text" class="form-control" id="title" name="title"
			placeholder="title" value="${vo.title }" required>
	</div>
	<div class="form-group">
		<input type="text" class="form-control" id="writer" name="writer"
			placeholder="writer" value="${vo.writer }" readonly="readonly">
	</div>
	<div class="form-group">
		<textarea class="form-control" id="content1" name="content"
			placeholder="content" maxlength="140" rows="7">${vo.content }</textarea>
	</div>
	<button type="submit" id="submit" name="submit"
		class="btn btn-primary pull-right">Submit Form</button>
</form>




