<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<div class="panel panel-primary" style="overflow: auto;height: 50%;">
	<div class="panel-heading">${vo.title }
	<span class="pull-right">${vo.regdate }</span></div>
    <div class="panel-body">${vo.content }
	</div>
  	</div>
  	
	<div class="panel panel-primary" style="overflow: auto;height: 50%;">
	<div class="panel-heading">Comment</div>
    <div class="panel-body">
    <textarea class="form-control" rows="5"></textarea>
    <button type="button" class="btn btn-primary pull-right">Send</button>
	</div>
  	</div>

