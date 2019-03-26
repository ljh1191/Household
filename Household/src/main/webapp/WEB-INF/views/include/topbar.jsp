<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
	<c:if test="${vo != null }">
		<div class="sidebar-brand-text mx-3">
			<a href="/household/main/logout">Logout</a>
		</div>
	</c:if>
	<c:if test="${vo == null }">
		<div class="sidebar-brand-text mx-3">
			<a href="/household/main/loginform">Login</a> | <a
				href="/household/main/signupform">SignUp</a>
		</div>
	</c:if>
</nav>
