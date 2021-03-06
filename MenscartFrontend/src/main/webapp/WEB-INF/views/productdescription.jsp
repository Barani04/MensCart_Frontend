<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="resources/css/description.css">
<style type="text/css">
.container12 {
	margin: 130px auto;
	width: auto;
	padding-left: 350px;
}
</style>
	<div style="margin: 130px auto; width: auto; padding-left: 350px;">
		<div class="row">
			<div class="header1">

				<a href="home" class="btn btn-info btn-sm"><span
					class="glyphicon glyphicon-arrow-left"></span> Back</a>
			</div>
			<hr id="top-hr">
			<table id="#table12">
				<tr>
					<td><img
						src="<c:url value = "resources/images/${proinfo.productId}.jpg"/>"
						alt="${proinfo.productName}"></td>
					<td class="des">
						<p class="proname">${proinfo.productName}</p>
						<hr id="prohr" />
						<p class="sup">seller:${supplier.supplierName}</p>
						<p class="price">&#8377; ${proinfo.price}</p>
						<hr id="hrsec" />
						<p class="prodes" style="margin-left: 60px !important;">Description:</p><p style="padding-left:90px;">${proinfo.productDescription}</p>
						<c:if test="${proinfo.stock>0}">
							<p id="msg1">Available</p>
						</c:if>
						<c:if test="${proinfo.stock<=0}">
							<p id="msg2">Out Of Stock</p>
						</c:if>
						<c:if test="${pageContext.request.userPrincipal.name!=null}">
							<p style="margin-left: 60px;">
								<a href="addToCart?proId=${proinfo.productId}" class="btn btn-warning btn-md cart">
									<span class="glyphicon glyphicon-shopping-cart"></span>
										Add to Cart
								</a>
							</p>
							</c:if>
							<c:if test="${pageContext.request.userPrincipal.name == null}">
								<p style="margin-left: 60px;">
								<a href="login" class="btn btn-warning btn-lg cart">
									<span class="glyphicon glyphicon-shopping-cart"></span>
										Add to Cart
								</a>
								</p>
							</c:if>												
					</td>
				</tr>
			</table>
		</div>
	</div>