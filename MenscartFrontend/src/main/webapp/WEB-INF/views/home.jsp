<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
html, body {
	background: url(resources/img/background.jpg);
	padding: 0px;
}

header {
	margin: 0px;
	padding: 0px;
	background-color: purple;
}

img {
	padding-left: 10px;
	padding-top: 5px;
	padding-bottom: 5px;
}
</style>
</head>
<body>
	<header> <img src="resources/img/logo.png" /></header>
	<%@ include file="navbar.jsp"%>


	<c:choose>
		<c:when test="${isUserClickedlogin == 'true'}">
			<%@include file="/WEB-INF/views/login.jsp"%>
		</c:when>
		
		<c:when test="${isUserClickedProduct == 'true'}">
			<%@include file="/WEB-INF/views/Product.jsp"%>
		</c:when>
		
		<c:when test="${isUserClickedCategory == 'true'}">
			<%@include file="/WEB-INF/views/Category.jsp"%>
		</c:when>
		
		
		<c:when test="${isUserClickedSupplier == 'true'}">
			<%@include file="/WEB-INF/views/Supplier.jsp"%>
		</c:when>
		
		<c:when test="${isUserClickedsignup == 'true'}">
			<%@include file="/WEB-INF/views/signup.jsp"%>
		</c:when>
		
		<c:when test="${BeforeUpdate == 'true'}">

			<%@include file="/WEB-INF/views/Product.jsp"%>
		</c:when>
		
		<c:when test="${BeforeUpdateSup == 'true'}">

			<%@include file="/WEB-INF/views/Supplier.jsp"%>
		</c:when>
		
		<c:when test="${Before == 'true'}">

			<%@include file="/WEB-INF/views/Category.jsp"%>
		</c:when>
		
		
		<c:otherwise>
			<%@ include file="carousel.jsp"%>
		</c:otherwise>
		
	</c:choose>
</body>
</html>