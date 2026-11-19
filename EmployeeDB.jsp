
<%@ page import="java.sql.*" %>
<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String salary = request.getParameter("salary");
String action = request.getParameter("action");

Connection con = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");

    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/studentdb",
        "root",
        "181222"
    );

    if ("Insert".equals(action)) {
        PreparedStatement ps = con.prepareStatement(
            "INSERT INTO employee (id, name, salary) VALUES (?, ?, ?)"
        );
        ps.setInt(1, Integer.parseInt(id));
        ps.setString(2, name);
        ps.setDouble(3, Double.parseDouble(salary));
        ps.executeUpdate();
        out.println("Employee inserted successfully!");
    }

    if ("Update".equals(action)) {
        PreparedStatement ps = con.prepareStatement(
            "UPDATE employee SET name=?, salary=? WHERE id=?"
        );
        ps.setString(1, name);
        ps.setDouble(2, Double.parseDouble(salary));
        ps.setInt(3, Integer.parseInt(id));
        ps.executeUpdate();
        out.println("Employee updated successfully!");
    }

    if ("Delete".equals(action)) {
        PreparedStatement ps = con.prepareStatement(
            "DELETE FROM employee WHERE id=?"
        );
        ps.setInt(1, Integer.parseInt(id));
        ps.executeUpdate();
        out.println("Employee deleted successfully!");
    }

} catch(Exception e) {
    out.println("Error: " + e.getMessage());
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Employee Database</title>
</head>
<body>

<h2>Employee Database</h2>

<form method="post">
    ID:
    <input type="text" name="id"><br><br>

    Name:
    <input type="text" name="name"><br><br>

    Salary:
    <input type="text" name="salary"><br><br>

    <button type="submit" name="action" value="Insert">Insert</button>
    <button type="submit" name="action" value="Update">Update</button>
    <button type="submit" name="action" value="Delete">Delete</button>
</form>

</body>
</html>
