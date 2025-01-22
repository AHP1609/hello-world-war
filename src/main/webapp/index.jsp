<html>
<head>
<title>Hello World!</title>
</head>
<body>
	<h1>Hello, welcome to ANU World!</h1>
	<p>
		It is now all about the devops.
	<p>
		have a good day
	<p>
		<%= new java.util.Date() %></p>
	<p>
		You are coming from 
		<%= request.getRemoteAddr()  %></p>
</body>
