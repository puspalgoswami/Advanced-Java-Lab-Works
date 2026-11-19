package com.student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String enrollment = request.getParameter("userId");
        String password = request.getParameter("password");

        String sql = "SELECT s.name, s.enrollment_no FROM students s JOIN student_login l " +
                     "ON s.enrollment_no=l.enrollment_no WHERE l.enrollment_no=? AND l.password=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, enrollment);
            ps.setString(2, password);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    HttpSession session = request.getSession();
                    session.setAttribute("studentName", rs.getString("name"));
                    session.setAttribute("enrollmentNo", rs.getString("enrollment_no"));
                    response.sendRedirect("dashboard.jsp");
                } else {
                    response.sendRedirect("login.jsp?error=Invalid+User+ID+or+Password");
                }
            }
        } catch (SQLException e) {
            throw new ServletException("Login database error.", e);
        }
    }
}
