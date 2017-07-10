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
	.boxed:hover{
		box-shadow: -8px -8px #eaeae1;
		
	}
</style>
</head>
<body>
	<div style="margin-top: 100px;" class="container">
	<div style="text-align: left;"><a href="add" style="border-radius: 6px;" class="btn btn-md btn-success"><span style="padding-top: 3px;padding-bottom: 5px;" class="glyphicon glyphicon-plus"></span>Add</a></div>
	<c:forEach items="${shipdetail}" var="ship">
		<div style="background-color: aqua;margin: 20px 10px;border: 3px solid aqua;border-radius: 15px;" class="col-md-3 boxed">
			<a href="" style="margin: 10px 0px 5px 10px;border-radius: 6px;" class="btn btn-sm btn-danger"><span  class="glyphicon glyphicon-trash"></span></a><a href="" style="margin: 10px 0px 5px 10px; border-radius: 6px;" class="btn btn-sm btn-warning"><span class="glyphicon glyphicon-pencil"></span></a>
			<div style="text-align: left;"><strong style="padding-right: 5px;word-wrap: break-word;">Name:</strong>${ship.userName}</div>
			<div style="text-align: left;"><strong style="padding-right: 5px;word-wrap: break-word;">Address:</strong>${ship.address }</div>
			<div style="text-align: left;"><strong style="padding-right: 5px;word-wrap: break-word;">PhoneNo:</strong>${ship.contactNo}</div>
			<div style="text-align: left;"><a href="pay?shipmentId=${ship.shipmentId}" style="border-radius: 6px;" class="btn btn-md btn-info"><span  class="glyphicon glyphicon-envelope"></span> Deliver</a></div>	
		</div>
	</c:forEach>	
	</div>
</body>
</html>