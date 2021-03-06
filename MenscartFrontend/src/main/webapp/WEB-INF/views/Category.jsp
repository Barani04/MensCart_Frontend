
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="resources/js/validate.js"></script>
<style type="text/css">
html, body {
	background: url(resources/img/viewbac.jpg) !important;
	padding: 0px;
}

body {
	padding-top: 70px;
}

.custab {
	border: 1px solid #ccc;
	padding: 5px;
	margin: 5% 0;
	box-shadow: 3px 3px 2px #ccc;
	transition: 0.5s;
}

.custab:hover {
	box-shadow: 3px 3px 0px transparent;
	transition: 0.5s;
}
</style>
<c:if test="${flag}">
	<form action="updatecat" method="post" class="form-horizontal"
		onsubmit="return formCategory()">
</c:if>

<c:if test="${!flag}">
	<form action="addcat" method="post" class="form-horizontal"
		onsubmit="return formCategory()">
</c:if>
<div class="container">

	<div style="margin-top: 50px;" class="mainbox col-xs-6 col-xs-offset-3">
		<div class="panel panel-info">
			<div class="panel-heading">
				<div style="font-size: 25px; text-align: center;"
					class="panel-title">Category Details</div>
			</div>
			<div style="padding-top: 30px" class="panel-body">

				<!--Form-group -->
				<c:if test="${flag}">
					<div class="form-group">
						<label class="col-xs-4 control-label">Category Id:</label>
						<div class="col-xs-8">
							<input type="text" class="form-control" name="categoryId"
								value="${category.categoryId}" placeholder="Category Id">
						</div>
					</div>

				</c:if>

				<div class="form-group">
					<label for="categoryName" class="col-xs-4 control-label">Category
						Name:</label>
					<div class="col-xs-8">
						<input type="text" class="form-control" name="categoryName"
							id="categoryName" value="${category.categoryName}"
							placeholder="Category Name" autofocus>
					</div>
				</div>

				<div class="form-group">
					<label for="description" class="col-xs-4 control-label">Category
						Description:</label>
					<div class="col-xs-8">
						<input id="description" name="description" type="text"
							id="description" value="${category.description}"
							placeholder="Description" class="form-control input-xs">
					</div>
				</div>

				<div class="form-group">
					<div
						class="col-xs-offset-5 col-xs-3 col-xs-offset-7 col-sm-offset-5 col-sm-3 col-sm-offset-7">
						<input type="submit" value="Add Category" class="btn btn-info" />
					</div>
				</div>
			</div>
		</div>
	</div>

</div>
</form>

<!-- TABLE DISPLAY -->
<div class="row col-xs-offset-1 col-xs-10 custyle">
	<table class="table table-striped table-bordered custab">
		<thead
			style="color: white; font-weight: bold; font-size: 20px; background-color: green;"
			class="table-default active">
			<tr class="text-center">
				<td>S.No</td>
				<td>Category Id</td>
				<td>Category Name</td>
				<td>Update</td>
				<td>Delete</td>
			</tr>
		</thead>
		<tbody
			style="color: #f90404; font-size: 15px; font-family: serif; background-color: #64f153;">
			<c:forEach items="${catdetail}" var="category" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td>${category.categoryId}</td>
					<td>${category.categoryName}</td>
					<td class="text-center"><a class='btn btn-warning btn-sm'
						href="getUpdateCat?catId=${category.categoryId}"><span
							class="glyphicon glyphicon-pencil"></span></a></td>
					<td class="text-center"><a
						href="deleteCategory?catId=${category.categoryId}"
						class="btn btn-danger btn-sm"><span
							class="glyphicon glyphicon-remove"></span></a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>