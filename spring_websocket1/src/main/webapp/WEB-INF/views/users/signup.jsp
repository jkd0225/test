<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ page pageEncoding="utf-8"%>
<div class="jumbotron">
	<h1>가입하기</h1>
</div>
<c:url var="signUpPath" value="/signup" />
<f:form modelAttribute="user" action="${ signUpPath }" method="post">
	<div class="form-group form-group-lg">
		<div class="form-group">
			<label>이메일</label>
			<f:input path="email" cssClass="form-control" />
			<f:errors path="email" element="div" cssClass="alert text-danger" />
		</div>
		<div class="form-group">
			<label>비밀번호</label>
			<f:password path="password" cssClass="form-control"
				placeholder="비밀번호" />
			<f:errors path="password" element="div" cssClass="alert text-danger" />
		</div>
		<div class="form-group"></div>
		<div class="form-action">
			<s:csrfInput />
			<input type="submit" class="btn btn-primary btn-lg btn-block"
				value="회원 가입">
		</div>
	</div>
</f:form>
