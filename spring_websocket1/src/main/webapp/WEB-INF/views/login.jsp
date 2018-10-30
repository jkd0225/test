<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ page pageEncoding="utf-8" %>
<div class="jumbotron">
    <h1>로그인</h1>
</div>
<c:url var="loginProcessingUrl" value='/user/login' />
<c:url var="signUpPath" value="/signup" />
<form action="${ loginProcessingUrl }" method="post">
    <div class="form-group form-group-lg">
        <div class="form-group">
            <label>사용자명</label>
            <input type="text" name="email" class="form-control" placeholder="이메일">
        </div>
        <div class="form-group">
            <label>비밀번호</label>
            <input type="password" name="password" class="form-control" placeholder="비밀번호">
        </div>
        <div class="form-action">
                <sec:csrfInput />
            <input type="submit" class="btn btn-primary btn-lg" value="로그인">
            <a href="${ signUpPath }" class="btn btn-default btn-lg">회원 가입</a>
        </div>
    </div>
</form>