<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



	<div class="panel panel-primary" style="overflow: auto;height: 45%;">
	<div class="panel-heading">${vo.title }
	<span class="pull-right">${vo.regdate }</span></div>
    <div class="panel-body">${vo.content }
	</div>
  	</div>
  	
	<div class="panel panel-primary" style="overflow: auto;height: 45%;">
	<div class="panel-heading">Comment</div>
    <div class="panel-body" id="commentList">
    <c:forEach var="vo" items="${list }">
    	${vo.cnum } ${vo.content }<br>
    </c:forEach>
    </div>
    <textarea class="form-control" rows="5" id="comment"></textarea>
    <button type="button" class="btn btn-primary pull-right" onclick="addComment()">Send</button>
  	</div>

<script type="text/javascript">
	function getList() {
		$.ajax({
			url:"<c:url value='/comment?num=${vo.num }'/>",
			dataTyoe:'json',
			success:function(data){
				$("#commentList").empty();
				$(data).each(function(i, json){
					var div = document.createElement("div");
					var str = json.cnum + " " + json.content + "<br>";
					$(div).html(str);
					$("#commentList").append(div);
				});
			}
		});
	}
	function addComment(){
		var num = ${vo.num };
		$.getJSON("<c:url value='/commentInsert'/>", {
			"num" : num,
			"comment" : $("#comment").val()
		}, function(data){
			if(data.code){
				$("#comment").val("");
				getList();
			}else
				console.log("fail");
		});
	}
	
</script>




