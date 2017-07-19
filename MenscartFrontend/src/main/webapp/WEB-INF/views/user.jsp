<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<title>FashionFactory-user</title>
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
			<c:when test="${isUserClickedProductDes == 'true'}">
				<%@ include file="productdescription.jsp" %>
			</c:when>
			<c:when test="${isUserClickedAdd == 'true'}">
				<%@ include file="shippingaddress.jsp" %>
			</c:when>
			<c:when test="${isUserClickedViewShipAddress == 'true'}">
				<%@ include file="viewShipAddress.jsp" %>
			</c:when>
			<c:when test="${isUserClickedCart == 'true'}">
				<%@ include file="cart.jsp" %>
			</c:when>
			<c:when test="${isUserClickedDeliver == 'true'}">
				<%@ include file="Receipt.jsp" %>
			</c:when>
			<c:when test="${isUserClickedThankYou == 'true'}">
				<%@ include file="thankyou.jsp" %>
			</c:when>
			<c:when test="${isUserClickedPayment == 'true'}">
				<%@ include file="payment.jsp" %>
			</c:when>
			<c:when test="${isUserClickedHistory == 'true'}">
				<%@ include file="OrderPage.jsp" %>
			</c:when>
			<c:when test="${isUserClikedEmptyCart == 'true'}">
				<%@ include file="EmptyCart.jsp" %>
			</c:when>
			<c:when test="${BeforeUpdate == 'true'}">

			<%@include file="/WEB-INF/views/shippingaddress.jsp"%>
		</c:when>
			<c:otherwise>
			<%@ include file="carousel.jsp"%>
			<br>
			<%@ include file="griddisplay.jsp"%>
			</c:otherwise>
		</c:choose>
</body>
</html>