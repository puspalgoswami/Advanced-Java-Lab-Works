<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%
    String clientIP = request.getRemoteAddr();
    String requestURL = request.getRequestURL().toString();
    String contextPath = request.getContextPath();
    String serverName = request.getServerName();
    int serverPort = request.getServerPort();

    Integer hits = (Integer)application.getAttribute("totalHits");

    if (hits == null) {
        hits = 1;
    } else {
        hits++;
    }

    application.setAttribute("totalHits", hits);
%>

<html>
<head>
    <title>Server Side Information</title>
</head>

<body>

<h2>Server-Side Information</h2>

<p><b>Client IP:</b> <%= clientIP %></p>

<p><b>Request URL:</b> <%= requestURL %></p>

<p><b>Context Path:</b> <%= contextPath %></p>

<p><b>Server Name:</b> <%= serverName %></p>

<p><b>Server Port:</b> <%= serverPort %></p>

<p><b>Total Hits:</b> <%= hits %></p>

</body>
</html>