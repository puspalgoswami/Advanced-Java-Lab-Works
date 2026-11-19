<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1">
<title>Student Registration</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body class="register-page">
<div class="register-shell">
  <div class="form-card registration-card">
    <h2>🎓 Student Registration</h2>
    <% if (request.getParameter("error") != null) { %>
      <div class="notice error"><%= request.getParameter("error") %></div>
    <% } %>
    <form action="register" method="post">
      <label>Name<input name="name" type="text" required></label>
      <label>Enrollment No.<input name="enrollment" type="text" required></label>
      <label>Batch<input name="batch" type="text" required></label>
      <label>Official Email<input name="email" type="email" required></label>
      <label>Mobile Number<input name="mobile" type="tel" pattern="[0-9]{10,15}" required></label>
      <label>DOB<input name="dob" type="date" required></label>
      <label>Address<input name="address" type="text" required></label>
      <label>State<input name="state" type="text" required></label>
      <label>City<input name="city" type="text" required></label>
      <button type="submit" class="blue-button">Register</button>
    </form>
    <p class="switch-link">Already registered? <a href="login.jsp">Login</a></p>
  </div>
</div>
</body>
</html>
