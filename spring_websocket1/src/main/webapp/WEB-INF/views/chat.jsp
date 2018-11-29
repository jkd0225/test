<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
#data {
	overflow: auto;
	height: 700px;
	border: 2px solid;
	border-radius: 5px;
	padding: 15px;
}

#name {
	width: 80px;
	margin-top: 10px;
}
</style>

<script type="text/javascript"
	src="<c:url value="/resources/js/sockjs-0.3.4.js"/>"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#sendBtn").click(function() {
			if ($("#message").val() == "") {
				alert('공백');
				return;
			}
			sendMessage();
			$('#message').val('');
			$('#message').focus();
		});

		$('#data').scrollTop($('#data')[0].scrollHeight);
	});
	var sock;
	sock = new SockJS("<c:url value="/echo"/>");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	function sendMessage() {
		message = {};
		message.content = $("#message").val();
		message.sender = $("#name").val();
		message.receiver = 'bbb';
		message.room = ${room};
		sock.send(JSON.stringify(message));
	}

	function getTimeStamp() {
		var d = new Date();
		var s = leadingZeros(d.getFullYear(), 4) + '-'
				+ leadingZeros(d.getMonth() + 1, 2) + '-'
				+ leadingZeros(d.getDate(), 2) + ' ' +

				leadingZeros(d.getHours(), 2) + ':'
				+ leadingZeros(d.getMinutes(), 2) + ':'
				+ leadingZeros(d.getSeconds(), 2);

		return s;
	}

	function leadingZeros(n, digits) {
		var zero = '';
		n = n.toString();

		if (n.length < digits) {
			for (i = 0; i < digits - n.length; i++)
				zero += '0';
		}
		return zero + n;
	}

	function onMessage(evt) {
		var data = evt.data;
		var obj = JSON.parse(data);
		var t = getTimeStamp();
		var user = '${user }';
		if (obj.sender === user) {
			var str = "<div class='container1 darker'><p>" + obj.content
					+ "</p><span class=time-left>" + t + "</span>";
			if (obj.read === 1) {
				str += "<span>읽음</span></div>";
			} else {
				str += "<span>읽지않음</span></div>";
			}
			$("#data").append(str);
		} else {
			$("#data").append(
					"<div class='container1'><p>" + obj.content
							+ "</p><span class=time-right>" + t
							+ "</span></div>");
		}
		$('#data').scrollTop($('#data')[0].scrollHeight);
	}

	function onClose(evt) {
		$("#data").append("연결끊김");
	}
</script>
<div class="container-fluid" style="margin-bottom: 15px;">
	<p class="text-left" style="font-size: x-large;">채팅</p>
</div>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-4">
			<div id="data">
				<c:forEach var="vo" items="${list }">
					<fmt:formatDate value="${vo.regdate }"
						pattern="yyyy-MM-dd HH:mm:ss" var="regdate" />
					<c:choose>
						<c:when test="${vo.sender == user }">
							<div class='container1 darker'>
								<p>${vo.content }</p>
								<span class='time-left'>${regdate }</span>
								<c:choose>
									<c:when test="${vo.read == 1 }">
										<span>읽음</span>
									</c:when>
									<c:otherwise>
										<span>읽지않음</span>
									</c:otherwise>
								</c:choose>
							</div>
						</c:when>
						<c:otherwise>
							<div class='container1'>
								<p>${vo.content }</p>
								<span class='time-right'>${regdate }</span>
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
			<input type="text" id="name" />
			<textarea class="form-control" rows="5" id="message"></textarea>
			<input type="button" id="sendBtn" value="전송" />
		</div>
		<div class="col-sm-8">
			<div style="border: solid 2px #fff; height: 900px; padding: 10px;">
				<div class="container-fluid"
					style="border: solid 2px #fff; height: 600px;"></div>

				<div class="panel panel-default" style="margin-top: 10px;">
					<div class="panel-heading">강좌명</div>
					<div class="panel-body" style="height: 160px;">내용</div>
				</div>

				<div class="btn-group btn-group-justified">
					<a href="#" class="btn btn-default">Apple</a> <a href="#"
						class="btn btn-default">Samsung</a> <a
						href='<c:url value="/home?room=${room }"/>'
						class="btn btn-default">나가기</a>
				</div>
			</div>
		</div>
	</div>
</div>
