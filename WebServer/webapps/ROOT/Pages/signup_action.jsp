<%@include file="../DBconnection.jsp"%>

<%@page import="
    java.sql.*, 
    oracle.jdbc.*
"%>

<%
String username = request.getParameter("username");
String first = request.getParameter("fname");
String last = request.getParameter("lname");
String password = request.getParameter("password");
String userType = request.getParameter("userType");

try {
    // make sure user has filled out everything
    // note that userType not being selected is handled from a NullPointerException being caught below
    
    if(username.length() == 0) {
        response.sendRedirect("signup.jsp");
    }
    if(first.length() == 0) {
        response.sendRedirect("signup.jsp");
    }
    if(last.length() == 0) {
        response.sendRedirect("signup.jsp");
    }
    if(password.length() == 0) {
        response.sendRedirect("signup.jsp");
    }
    
    CallableStatement cs = con.prepareCall("{call CREATE_NEW_USER(?, ?, ?, ?, ?)}");
	
    cs.setString(1, username);
    cs.setString(2, first);
    cs.setString(3, last);
    cs.setString(4, password);
    cs.setString(5, userType);
    
    cs.executeUpdate();
    
    cs.close();

    if(((String) userType) == "I") {
        session.setAttribute("userType", 1);
    }
    else {
        session.setAttribute("userType", 2);
    }

    session.setAttribute("username", username);

    out.println("added user!");

    response.sendRedirect("../index.jsp");
} catch (Exception E) {
    out.println(E);

    response.sendRedirect("signup.jsp");
}
%>