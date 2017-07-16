<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/css/description.css"> -->
<title>FashionFactory${title}</title>
<style type="text/css">
body{
	background: url(resources/img/background.jpg) !important ;
	padding: 0px;
}
</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<c:choose>
		<c:when test="${isUserClickedlogin == 'true'}">
			<%@include file="/WEB-INF/views/login.jsp"%>
		</c:when>
		
		<c:when test="${isUserClickedAbout == 'true'}">
			<%@include file="/WEB-INF/views/about.jsp"%>
		</c:when>
		
		<c:when test="${isUserClickedContact == 'true'}">
			<%@include file="/WEB-INF/views/contact.jsp"%>
		</c:when>
		
		<c:when test="${isUserClickedsignup == 'true'}">
			<%@include file="/WEB-INF/views/signup.jsp"%>
		</c:when>
			<c:when test="${isUserClickedProductDes == 'true'}">
				<%@ include file="productdescription.jsp" %>
			</c:when>
		<c:otherwise>
			<%@ include file="carousel.jsp"%>
			<br>
			<br>
			<c:if test="${adminLoggedIn !='true' }">
				<%@ include file="griddisplay.jsp"%>
			</c:if>
		</c:otherwise>
		
	</c:choose>
	
	<script type="text/javascript" src="resources/js/mypro.js"></script>
</body>
</html>