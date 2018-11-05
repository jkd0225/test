<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container-fluid" style="margin-bottom: 15px;">
	<p class="text-left" style="font-size: x-large;">상세보기</p>

	<button type="submit" class="btn btn-primary" style="float: right;"
		onclick="location='<c:url value='/gboardDelete?num=${vo.num }'/>'">삭제</button>
	<form action="<c:url value='/gboardUpdate'/>" method="post">
		<input type="hidden" name="num" value="${vo.num }"> <input
			type="hidden" name="title" value="${vo.title }"> <input
			type="hidden" name="writer" value="${vo.writer }"> <input
			type="hidden" name="content" value="${vo.content }">
		<button type="submit" class="btn btn-primary"
			style="float: right; margin-right: 10px;"
			onclick="location='<c:url value='/gboardUpdate'/>'">수정</button>
	</form>
</div>


<div class="panel panel-primary" style="overflow: auto; height: 45%;">
	<div class="panel-heading">${vo.title }

		<span id="recomm">${vo.recomm }</span> <span class="pull-right">
			${vo.hit } ${vo.regdate }</span>
		<!-- 	<button type="button" class="btn btn-primary pull-right" onclick="recommDown()" id="btn1">추천취소</button> -->
		<!-- 	<button type="button" class="btn btn-primary pull-right" onclick="recommUp()" id="btn2">추천</button> -->
		<c:choose>
			<c:when test="${isRecomm == 'true' }">
				<button type="button" class="btn btn-primary pull-right" id="btn3">추천취소</button>
			</c:when>
			<c:otherwise>
				<button type="button" class="btn btn-primary pull-right" id="btn4">추천</button>
			</c:otherwise>
		</c:choose>

	</div>
	<div class="panel-body">${vo.content }</div>
</div>

<div class="panel panel-primary" style="overflow: auto; height: 45%;">
	<div class="panel-heading">Comment</div>
	<div class="panel-body" id="commentList">
		<c:forEach var="vo" items="${list }">
    	${vo.cnum } ${vo.content }<br>
		</c:forEach>
	</div>
	<textarea class="form-control" rows="5" id="comment"></textarea>
	<div><span id="count">0</span>/<span id="max-count">0</span></div>
	<button type="button" class="btn btn-primary pull-right"
		onclick="addComment()">Send</button>
</div>

<script type="text/javascript">
// 	$(document).ready(function(){
// 		$("#btn1").hide();
// 		$("#btn2").hide();
// 	});
	

	var recomm = ${vo.recomm};
	$(document).on("click","#btn4",function(){
		$.ajax({
			url:"<c:url value='/recommUp?num=${vo.num}&writer=${vo.writer}'/>",
			dataType:'json',
			success:function(data){
				recomm = data.recomm;
				$("#btn4").attr("id","btn3");
				$("#btn3").text("추천취소");
				$("#recomm").text(recomm);
			}
		});
	});
	
	$(document).on("click","#btn3",function(){
		$.ajax({
			url:"<c:url value='/recommDown?num=${vo.num}&writer=${vo.writer}'/>",
			dataType:'json',
			success:function(data){
				$("#btn3").attr("id","btn4");
				$("#btn4").text("추천");
				$("#recomm").text(recomm - 1);
			}
		});
	});
	
// 	function recommUp(){
// 		$.ajax({
// 			url:"<c:url value='/recommUp?num=${vo.num}&writer=${vo.writer}'/>",
// 			dataType:'json',
// 			success:function(data){
// 				$("#btn1").show();
// 				$("#btn2").hide();
// 				$("#btn3").hide();
// 				$("#btn4").hide();
// 				$("#recomm").text("${vo.recomm}");
// 			}
// 		});
// 	}
// 	function recommDown(){
// 		$.ajax({
// 			url:"<c:url value='/recommDown?num=${vo.num}&writer=${vo.writer}'/>",
// 			dataType:'json',
// 			success:function(data){
// 				$("#btn2").show();
// 				$("#btn1").hide();
// 				$("#btn4").hide();
// 				$("#btn3").hide();
// 				$("#recomm").text("${vo.recomm -1}");
// 			}
// 		});
// 	}

	function getList() {
		$.ajax({
			url:"<c:url value='/comment?num=${vo.num }'/>",
			dataType:'json',
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
	
	document.getElementById('comment').addEventListener('keyup',checkByte);
	var countSpan = document.getElementById('count');
	var message = '';
	var MAX_MESSAGE_BYTE = 100;
	document.getElementById('max-count').innerHTML = MAX_MESSAGE_BYTE.toString();
	
	function count(message){
		var totalByte = 0;
		
		for(var index = 0, length = message.length; index < length; index++){
			var currentByte = message.charCodeAt(index);
			(currentByte > 128) ? totalByte += 2 : totalByte++;
		}
		return totalByte;
	}
	
	function checkByte(event){
		const totalByte = count(event.target.value);
		
		if(totalByte <= MAX_MESSAGE_BYTE){
			countSpan.innerText = totalByte.toString();
			message = event.target.value;
		}else{
			alert(MAX_MESSAGE_BYTE + "바이트까지 전송가능합니다.");
			countSpan.innerText = count(message).toString();
			event.target.value = message;
		}
	}
</script>





