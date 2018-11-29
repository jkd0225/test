<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container-fluid" style="margin-bottom: 15px;">
	<p class="text-left" style="font-size: x-large;">상세보기</p>

	<button type="submit" class="btn btn-default" style="float: right;"
		onclick="location='<c:url value='/gboardDelete?num=${vo.num }'/>'">삭제</button>
	<form action="<c:url value='/gboardUpdate'/>" method="post">
		<input type="hidden" name="num" value="${vo.num }"> <input
			type="hidden" name="title" value="${vo.title }"> <input
			type="hidden" name="writer" value="${vo.writer }"> <input
			type="hidden" name="content" value="${vo.content }">
		<button type="submit" class="btn btn-default"
			style="float: right; margin-right: 10px;"
			onclick="location='<c:url value='/gboardUpdate'/>'">수정</button>
	</form>
</div>

<div class="container-fluid"
	style="overflow: auto; height: 45%; border: solid 1px #fff; border-radius: 5px; margin-bottom: 15px;">
	<div class="panel-heading">${vo.writer }
		<div class="pull-right">
			<span id="recomm">${vo.recomm }</span> <i class='fas fa-eye'></i>
			${vo.hit } ${vo.regdate }
		</div>
		<!-- 	<button type="button" class="btn btn-default pull-right" onclick="recommDown()" id="btn1">추천취소</button> -->
		<!-- 	<button type="button" class="btn btn-default pull-right" onclick="recommUp()" id="btn2">추천</button> -->
		<c:choose>
			<c:when test="${isRecomm == 'true' }">
				<button type="button" class="btn-xs btn-default pull-right"
					id="btn3">
					<i class='fas fa-thumbs-down'></i>
				</button>
			</c:when>
			<c:otherwise>
				<button type="button" class="btn-xs btn-default pull-right"
					id="btn4">
					<i class='fas fa-thumbs-up'></i>
				</button>
			</c:otherwise>
		</c:choose>
		<hr style="border: solid 1px #fff;">


		<div>
			<strong>${vo.title }</strong>
			<hr style="border: solid 1px #fff;">

		</div>
	</div>
	<div class="panel-body">${vo.content }</div>
</div>

<div class="container-fluid" id="comments"
	style="overflow: auto; height: 40%; border: solid 1px #fff; border-radius: 5px;">
	<div class="panel-heading">
		Comment
		<hr style="border: solid 1px #fff;">
	</div>

	<div class="panel-body" id="commentList">
		<c:forEach var="vo" items="${list }">
			<div class="panel panel-default">
				<div class="panel-heading">${vo.cnum }</div>
				<div class="panel-body">${vo.content }
					<button type="button" class="btn btn-default pull-right"
						onclick="deleteComment(${vo.cnum})">삭제</button>
				</div>
			</div>
		</c:forEach>
	</div>
	<textarea class="form-control" rows="5" id="comment"></textarea>
	<div>
		<span id="count">0</span>/<span id="max-count">0</span>
	</div>
	<button type="button" class="btn btn-default pull-right"
		onclick="addComment()">Send</button>
</div>

<script id="template-list-item" type="text/template">
	<div class="panel panel-default">
		<div class="panel-heading">{cnum}</div>
		<div class="panel-body">{content}
		<button type="button" class="btn btn-default pull-right"
						onclick="deleteComment({cnum1})">삭제</button>
	</div>
	</div>
</script>

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
				$("#btn3").html("<i class='fas fa-thumbs-down'></i>");
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
				$("#btn4").html("<i class='fas fa-thumbs-up'></i>");
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
	$(document).ready(function(){
	});

	function getList() {
		$.ajax({
			url:"<c:url value='/comment?num=${vo.num }'/>",
			dataType:'json',
			success:function(data){
				$("#commentList").empty();
				var html = document.querySelector("#template-list-item").innerHTML;
				var resultHTML = "";
				$(data).each(function(i, json){
					resultHTML += html.replace("{cnum}", json.cnum)
										.replace("{content}", json.content)
										.replace("{cnum1}", json.cnum);
					
// 					var div = document.createElement("div");
// 					var str = json.cnum + " " + json.content + "<br>";
// 					$(div).html(str);
// 					$("#commentList").append(div);
				});
				document.querySelector("#commentList").innerHTML = resultHTML;
				$('#comments').scrollTop($('#comments')[0].scrollHeight);
			}
		});
	}
	
	function addComment(){
		if($("#comment").val() == ""){
			alert('공백');
			return;
		}
		var num = ${vo.num };
		var comment = $("#comment").val();
		$.getJSON("<c:url value='/commentInsert'/>", {
			"num" : num,
			"comment" : comment
		}, function(data){
			if(data.code){
				$("#comment").val("");
				getList();
			}else
				console.log("fail");
		});
		$('#comment').focus();
	}
	
	function deleteComment(cnum){
		var num = ${vo.num};
		$.getJSON("<c:url value='/commentDelete'/>",{
			"num" : num,
			"cnum" : cnum
		}, function(data){
			if(data.code){
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





