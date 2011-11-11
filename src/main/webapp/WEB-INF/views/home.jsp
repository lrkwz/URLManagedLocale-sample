<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<li><a href="./">Unqualified URL</a> (*) this should show the cookie stored locale or redirect to the "choose locale" page if no cookies are set</li>
		<li><a href="./it_IT">Italian</a> change locale to the specified value, sets cookie if not set</li>
		<li><a href="./en_GB">British English</a> (idem)</li>
		<li><a href="./xx_XX">Unknown</a> change locale to default jvm</li>		
	</ol>
	
	<h2>Special <i>pages</i></h2>
	<ol>
		<li><a href="secure/">Your account</a> (**)</li>
		<li><a href="secure/extreme/">Admin</a> (**)</li>
		<li><a href="changelocale.html">Change locale page</a></li>
	</ol>
	
	<blockquote>(*) Open links also in <a href="http://en.wikipedia.org/wiki/Privacy_mode" target="help">private/incognito</a> mode in order to test without cookies!</blockquote>
	<blockquote>
	    (**) Usernames/Passwords are:
	    <ul>
        <li>rod/koala (admin)</li>
        <li>dianne/emu</li>
        <li>scott/wombat</li>
        <li>peter/opal</li>
        </ul>
	</blockquote> 
</body>
</html>
