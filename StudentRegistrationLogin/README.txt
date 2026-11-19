STUDENT REGISTRATION AND LOGIN (JSP + Servlet + JDBC + MySQL + Tomcat)

1) In MySQL Workbench, run database.sql.
2) Open DBConnection.java and replace YOUR_MYSQL_PASSWORD with your MySQL root password.
3) Build the project from the project folder:
   mvn clean package
4) Copy target\StudentRegistrationLogin.war into:
   TOMCAT_HOME\webapps
5) Start Tomcat using:
   TOMCAT_HOME\bin\startup.bat
6) Open:
   http://localhost:8080/StudentRegistrationLogin/

After registration:
- User ID = Enrollment Number
- Default Password = Student@123

This is an educational demo. Passwords are stored in plain text and the default password
should be replaced with proper password hashing before using this in a real system.
