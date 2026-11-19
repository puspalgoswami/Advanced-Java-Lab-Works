<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
String studentName = (String) session.getAttribute("studentName");
String enrollmentNo = (String) session.getAttribute("enrollmentNo");
if (studentName == null || enrollmentNo == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>
<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8"><title>Student Dashboard</title><link rel="stylesheet" href="css/style.css"></head>
<body class="dashboard-page">
<div class="dashboard-card">
  <h1>Welcome, <%= studentName %>!</h1>
  <p>Login successful.</p>
  <div class="student-info"><strong>Enrollment No:</strong> <%= enrollmentNo %></div>
  <a class="logout-link" href="login.jsp">Logout</a>
</div>
</body></html>
