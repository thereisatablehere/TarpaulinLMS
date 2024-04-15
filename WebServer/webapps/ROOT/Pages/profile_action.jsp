<%@include file="../DBconnection.jsp"%>

<%@page import="
    java.sql.*, 
    oracle.jdbc.*
"%>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");
String first = request.getParameter("fname");
String last = request.getParameter("lname");
String email = request.getParameter("email");

// Call the stored procedure to modify the student's profile
try {
    CallableStatement cs = con.prepareCall("{call modify_student_profile(?, ?)}");
    cs.setString(1, username);
    cs.setString(2, password);
    cs.executeUpdate();
    cs.close();
    out.println("Username/Password updated.");
} catch (SQLException e) {
    // Handle any SQL exceptions
    out.println("An error occurred while updating username/password: " + e.getMessage());
    e.printStackTrace();
} finally {
    // Close the connection
    try {
        if (con != null) {
            con.close();
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>
