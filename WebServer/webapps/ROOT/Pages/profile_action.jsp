<%@include file="../userAuth.jsp"%>
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

try {
    if((int) session.getAttribute("userType") == 2 && ((String) session.getAttribute("username")).equals(username)){
        CallableStatement cs = con.prepareCall("{call modify_student_profile(?, ?)}");
	cs.setString(1, username);
    	cs.setString(2, password);
    	cs.executeUpdate();
    	cs.close();
	response.sendRedirect("../index.jsp");
    }else if((int) session.getAttribute("userType") == 1 && ((String) session.getAttribute("username")).equals(username)){
        CallableStatement cs = con.prepareCall("{call modify_instructor_profile(?, ?)}");
	cs.setString(1, username);
        cs.setString(2, password);
    	cs.executeUpdate();
    	cs.close();
	response.sendRedirect("../index.jsp");
    }else{
	response.sendRedirect("../index.jsp");
    }
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


try {
    CallableStatement cs = con.prepareCall("{call CREATE_NEW_USER(?, ?, ?, ?, ?)}");
	
    cs.setString(1, username);
    cs.setString(2, first);
    cs.setString(3, last);
    cs.setString(4, password);
    cs.setString(5, );
    
    cs.executeUpdate();
    
    cs.close();

	response.sendRedirect("../index.jsp");
} catch (SQLException E) {
    out.println(E);
}