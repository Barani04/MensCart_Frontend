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
<title>Insert title here</title>

<style type="text/css">
.container1 {
	background: white;
	border: 1px solid #b4f7b5;
	border-radius: 10px;
	margin: 10px 10px;

}

#f1_container1 {
	position: relative;
	width: 250px;
	margin-top: 10px;
	margin-bottom: 10px;
	margin-left: 10px;
	height: 300px;
	z-index: 1;
	height: 300px;
}

#f1_container1 {
	perspective: 1000;
}

#f1_card1 {
	width: 100%;
	height: 100%;
	transform-style: preserve-3d;
	transition: all 1.0s linear;
}

#f1_container1:hover #f1_card1 {
	transform: rotateY(180deg);
	box-shadow: -5px 5px 5px #aaa;
}

.face {
	position: absolute;
	width: 100%;
	height: 100%;
	backface-visibility: hidden;
}

.face.back {
	display: block;
	transform: rotateY(180deg);
	box-sizing: border-box;
	padding: 10px;
	color: white;
	text-align: center;
	background-color:#8986d8;
}

.proname{
	background-color: purple;
	font-size: 20px;
	margin-top: 50px;
}
.proprice{
	font-size: 18px;
	margin-top: 60px;
}
</style>	
</head>
<body>
	<div class="container1">
		<div class="row">
			<c:forEach items="${prodetail}" var="product">
				<div class="col-md-3">
					<div id="f1_container1">
						<div id="f1_card1" class="shadow">
							<div class="front face">
								<img src="resources/images/${product.productId}.jpg" />
							</div>
							<div class="back face center">
								<p class="proname">${product.productName}</p>
								<p class="proprice">&#8377; ${product.price}</p>
								<p><a href="productdescription?proId=${product.productId}"><button type="submit" class="btn btn-warning btn-md"><span class="glyphicon glyphicon-eye-open"></span>View</button></a></p>
								<p><a href="#"><button type="submit" class="btn btn-success btn-md"><span class="glyphicon glyphicon-shopping-cart"></span>Add to Cart</button></a></p>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>