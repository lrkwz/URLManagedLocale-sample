<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
</head>
<title>Home</title>
</head>
<body>
	<h2>Info</h2>
	<p>The time on the server is ${serverTime}.</p>
	<p>Your locale is ${currentLocale }</p>

	<h2>Test suite</h2>
	<ol>
		<li><a href='<spring:url value="/" />'>Unlocalized URL</a> (*)
			this should show the cookie stored locale or redirect to the "choose
			locale" page if no cookies are set</li>
		<li><a href='<spring:url value="/it_IT/home.html" />'>Italian</a>
			change locale to the specified value, sets cookie if not set</li>
		<li><a href='<spring:url value="/en_GB/home.html" />'>British
				English</a> (idem)</li>
		<li><a href='<spring:url value="/xx_XX/home.html" />'>Unknown</a>
			change locale to invalid xx_XX (so the default jvm locale is used)</li>
	</ol>

	<h2>
		Special <i>pages</i>
	</h2>
	<ol>
		<li><a href='<spring:url value="/secure/" />'>Your account</a>
			(**)</li>
		<li><a href='<spring:url value="/secure/extreme/" />'>Admin</a>
			(**)</li>
		<li><a href='<spring:url value="/chooseLocale.html" />'>Change
				locale page</a></li>
	</ol>

	<blockquote>
		(*) Open links also in <a
			href="http://en.wikipedia.org/wiki/Privacy_mode" target="help">private/incognito</a>
		mode in order to test without cookies!
	</blockquote>
	<blockquote>
		(**) Usernames/Passwords are:
		<ul>
			<li>rod/koala (admin)</li>
			<li>dianne/emu</li>
			<li>scott/wombat</li>
			<li>peter/opal</li>
		</ul>
	</blockquote>

	<h2>Here is your preferred locale info (from your browser
		configuration)</h2>

	<c:set var="clientLocale" value="${pageContext.request.locale}" />
	<c:set var="clientLocales" value="${pageContext.request.locales}" />

	Preferred locale: ${clientLocale.displayName}
	<br /> Preferred locale country: ${clientLocale.displayCountry}
	<br /> Preferred locale language: ${clientLocale.displayLanguage}
	<h3>Lower priority locales...</h3>
	<c:forEach var="loc" items="${clientLocales}" begin="1">
		<div>${loc.displayName}</div>
	</c:forEach>
</body>
</html>
