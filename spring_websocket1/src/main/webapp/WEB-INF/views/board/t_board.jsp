<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script src="<c:url value="/resources/js/summernote-ko-KR.js"/>"></script>
<script type="text/javascript">
$(document).ready(function() {
	//아이디가 content 에 서머노트를 적용 한다.
  $('#content').summernote({
// 	  toolbar: [
// 		    // [groupName, [list of button]]
// 		    ['style', ['bold', 'italic', 'underline', 'clear']],
// 		    ['font', ['strikethrough', 'superscript', 'subscript']],
// 		    ['fontsize', ['fontsize']],
// 		    ['color', ['color']],
// 		    ['para', ['ul', 'ol', 'paragraph']],
// 		    ['table', ['table']],
// 		    ['height', ['height']]
// 		  ],
	lang: 'ko-KR',
	height:300 , 
	minHeight: null,             // set minimum height of editor
    maxHeight: null,             // set maximum height of editor
    focus: true  // set focus to editable area after initializing summe
});

});




</script>
</head>
<body>
<form id="articleForm" action="<c:url value='/insert'/>" method="post">
  <br style="clear: both">
  <h3 style="margin-bottom: 25px;">Article Form</h3>
  <div class="form-group">
    <input type="text" class="form-control" id="title" name="title" placeholder="title" required>
  </div>
  <div class="form-group">
    <textarea class="form-control" id="content" name="content" placeholder="content" maxlength="140" rows="7"></textarea>
  </div>
  <button type="submit" id="submit" name="submit" class="btn btn-primary pull-right">Submit Form</button>
</form>

	<div id="imageBoard">
      <ul>
        <c:forEach items="${files}" var="file">
          <li><img src="/image/${file}" width="480" height="auto"/></li>
        </c:forEach>
      </ul>
    </div>

<script src="https://www.google.com/recaptcha/api.js?" async defer></script><div class="g-recaptcha" data-sitekey="6Lcvw_gSAAAAAH3zOofJBJOFLpmjx7Vq3hxnYIRw"></div>
<noscript>
        <div style="width: 302px; height: 352px;">
        <div style="width: 302px; height: 352px; position: relative;">
        <div style="width: 302px; height: 352px; position: absolute;">
        <iframe src="https://www.google.com/recaptcha/api/fallback?k=6Lcvw_gSAAAAAH3zOofJBJOFLpmjx7Vq3hxnYIRw"
        frameborder="0" scrolling="no"
        style="width: 302px; height:352px; border-style: none;">
        </iframe>
        </div>
        <div style="width: 250px; height: 80px; position: absolute; border-style: none;
        bottom: 21px; left: 25px; margin: 0px; padding: 0px; right: 25px;">
        <textarea id="g-recaptcha-response" name="g-recaptcha-response"
        class="g-recaptcha-response"
        style="width: 250px; height: 80px; border: 1px solid #c1c1c1;
        margin: 0px; padding: 0px; resize: none;" value="">
        </textarea>
        </div>
        </div>
        </div>
        </noscript>	
</body>
</html>