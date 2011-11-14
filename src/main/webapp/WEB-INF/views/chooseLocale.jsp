<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page session="false"%>
<html>
<head>
<title>Select your preferred locale</title>
</head>
<body>
	<h1>Choose your preferred locale</h1>
	<p>You should always provide this view</p>
	<ul>
		<li><a href='<spring:url value="/en_US/home.html" />'>American english</a></li>
		<li><a href='<spring:url value="/it_CH/home.html" />'>Italian Switzeland</a></li>
	</ul>
</body>
</html>
