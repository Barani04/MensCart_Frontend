<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
* {box-sizing: border-box;}
body {font-family: 'Playfair Display', serif; margin: 0;text-align: center}
h1 {font-weight: normal;color: #6A5953}
kbd {font-size: 0.9em;display:inline-block;line-height:1.1;}
.wrap {
  display: inline-block;
  margin: 0 40px 2em 0;
  background: rgba(228, 225, 228, .5);
}
div {
  width: 170px;
  height: 100px;
  line-height: 100px;
  margin: 0 auto;
  -o-transition: all 0.5s ease-in-out;
  -moz-transition: all 0.5s ease-in-out;
  -webkit-transition: all 0.5s ease-in-out;
  transition: all 0.5s ease-in-out;
}
.three, .six, .nine {
  background: rgba(255, 153, 0, .4);
}
.three:hover {
  -o-transform: translate(-20px, 20px);
  -ms-transform: translate(-20px, 20px);
  -moz-transform: translate(-20px, 20px);
  -webkit-transform: translate(-20px, 20px);
  transform: translate(-20px, 20px);
}
</style>
</head>
<body>
	<div class="container">
		<div class="wrap"><div class="three"><kbd>translate(-20px, 20px)</kbd></div></div>
	</div>
</body>
</html>