<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ page pageEncoding="utf-8" %>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="909435786306-0c48l5omb0o3v1gfod6uv3i5ropqovm5.apps.googleusercontent.com">
<div class="jumbotron">
    <h1>로그인</h1>
</div>
<c:url var="loginProcessingUrl" value='/user/login' />
<c:url var="signUpPath" value="/signup" />
<form action="${ loginProcessingUrl }" method="post">
	<div class="form-group form-group-lg">
		<div class="form-group">
			<label>사용자명</label> <input type="text" name="email"
				class="form-control" placeholder="이메일">
		</div>
		<div class="form-group">
			<label>비밀번호</label> <input type="password" name="password"
				class="form-control" placeholder="비밀번호">
		</div>
		<div class="form-action">
			<sec:csrfInput />
			<input type="submit" class="btn btn-primary btn-lg" value="로그인">
			<a href="${ signUpPath }" class="btn btn-default btn-lg">회원 가입</a>
		</div>
		<div class = "form-action" id="naver_id_login" style="text-align: center">
			<a href="${url}"> <img width="223"
				src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
		</div>
		<div class="g-signin2" data-onsuccess="onSignIn"></div>
		<script type="text/javascript">
		function onSignIn(googleUser) {
			  var profile = googleUser.getBasicProfile();
			  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
			  console.log('Name: ' + profile.getName());
			  console.log('Image URL: ' + profile.getImageUrl());
			  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
			}
		</script>
	</div>
</form>