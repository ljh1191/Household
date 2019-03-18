<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
        
		<c:if test="${vo != null }">
		<div class="sidebar-brand-text mx-3">
			<a href="/household/main/logout">로그아웃</a>
		</div>
		</c:if>
		<c:if test="${vo == null }">
		<div class="sidebar-brand-text mx-3">
			<a href="/household/main/loginform">로그인</a> | <a href="/household/main/signupform">회원가입</a>
		</div>
		</c:if>
		
        </nav>
        