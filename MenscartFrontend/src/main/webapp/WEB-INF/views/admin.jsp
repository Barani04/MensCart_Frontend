<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="navbar.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
	<c:choose>
		<c:when test="${isUserClickedProduct == 'true'}">
			<%@include file="/WEB-INF/views/Product.jsp"%>
		</c:when>
		
		<c:when test="${isUserClickedCategory == 'true'}">
			<%@include file="/WEB-INF/views/Category.jsp"%>
		</c:when>
		
		
		<c:when test="${isUserClickedSupplier == 'true'}">
			<%@include file="/WEB-INF/views/Supplier.jsp"%>
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
		<marquee direction="left" style="margin: 100px; padding: 0px 100px;"><h2>Welcome...!Admin</h2></marquee>
	</c:otherwise>
	</c:choose>
</body>
</html>