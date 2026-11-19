package com.student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
    private static final String DEFAULT_PASSWORD = "Student@123";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String enrollment = request.getParameter("enrollment");
        String name = request.getParameter("name");
        String batch = request.getParameter("batch");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String dob = request.getParameter("dob");
        String address = request.getParameter("address");
        String state = request.getParameter("state");
        String city = request.getParameter("city");

        if (enrollment == null || name == null || enrollment.isBlank() || name.isBlank()) {
            response.sendRedirect("register.jsp?error=Please+fill+the+required+fields");
            return;
        }

        try (Connection con = DBConnection.getConnection()) {
            con.setAutoCommit(false);
            try {
                String studentSql = "INSERT INTO students(enrollment_no,name,batch,official_email,mobile_number,dob,address,state,city) VALUES(?,?,?,?,?,?,?,?,?)";
                try (PreparedStatement ps = con.prepareStatement(studentSql)) {
                    ps.setString(1, enrollment.trim());
                    ps.setString(2, name.trim());
                    ps.setString(3, batch);
                    ps.setString(4, email);
                    ps.setString(5, mobile);
                    ps.setDate(6, Date.valueOf(dob));
                    ps.setString(7, address);
                    ps.setString(8, state);
                    ps.setString(9, city);
                    ps.executeUpdate();
                }

                String loginSql = "INSERT INTO student_login(enrollment_no,password) VALUES(?,?)";
                try (PreparedStatement ps = con.prepareStatement(loginSql)) {
                    ps.setString(1, enrollment.trim());
                    ps.setString(2, DEFAULT_PASSWORD);
                    ps.executeUpdate();
                }
                con.commit();
                response.sendRedirect("login.jsp?registered=1");
            } catch (SQLException e) {
                con.rollback();
                if (e.getErrorCode() == 1062) {
                    response.sendRedirect("register.jsp?error=Enrollment+number+already+registered");
                } else {
                    throw e;
                }
            } finally {
                con.setAutoCommit(true);
            }
        } catch (SQLException | IllegalArgumentException e) {
            throw new ServletException("Registration failed. Check database setup and required fields.", e);
        }
    }
}
