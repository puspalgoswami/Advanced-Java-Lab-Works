<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%
    String mode = request.getParameter("mode");
    String action = request.getParameter("action");

    if ("included".equals(mode)) {
%>
        <h2>Welcome Page Included</h2>
        <p>This is the content from welcome.jsp</p>
        <p>This tag makes JSP simple and reusable.</p>

<%
    } else if ("forwarded".equals(mode)) {
%>
        <h1>Thank You Page Forwarded!</h1>
        <p>This content is from thankyou.jsp</p>

<%
    } else {
%>
        <h2>Custom tag that give forward and include actions</h2>

        <h2>Welcome Page Included</h2>
        <p>This is the content from welcome.jsp</p>
        <p>This tag makes JSP simple and reusable.</p>

        <hr>

        <h2>Forward Action</h2>
        <p>Click below to forward the request to the Thank You page.</p>

        <a href="CustomTag.jsp?mode=forwarded">Forward Request</a>

<%
    }
%>