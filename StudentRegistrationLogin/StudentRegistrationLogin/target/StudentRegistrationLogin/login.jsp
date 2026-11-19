<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1">
<title>Student Login</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body class="login-page">
<div class="login-shell">
  <div class="form-card login-card">
    <h2>🔒 Login</h2>
    <% if (request.getParameter("registered") != null) { %>
      <div class="notice success">Registration successful! Use your Enrollment No. and default password Student@123.</div>
    <% } %>
    <% if (request.getParameter("error") != null) { %>
      <div class="notice error"><%= request.getParameter("error") %></div>
    <% } %>
    <form action="login" method="post">
      <label>User ID<input name="userId" type="text" required></label>
      <label>Password<input name="password" type="password" required></label>
      <button type="submit" class="purple-button">Login</button>
    </form>
    <p class="switch-link"><a href="register.jsp">Create student account</a></p>
  </div>
</div>
</body>
</html>
