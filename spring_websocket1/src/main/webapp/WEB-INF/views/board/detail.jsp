<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<div class="panel panel-primary" style="overflow: auto; height: 45%;">
	<div class="panel-heading">${vo.title }
		<div class="panel-body">${vo.content }</div>
	</div>
</div>
<button type="button" class="btn btn-primary" style="float: right;"
	onclick="location='<c:url value='/tboardReplyInsert?num=${vo.num }&ref=${vo.ref}&lev=${vo.lev}&step=${vo.step}'/>'">답글</button>







