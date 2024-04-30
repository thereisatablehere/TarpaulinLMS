<%@include file="../DBconnection.jsp"%>

<%@page import="
    java.sql.*, 
    oracle.jdbc.*
"%>

<%
String username = "";
try{
    username = (String) session.getAttribute("username");
}
catch(Exception E) {
    username = "";
}

try {
    String name = request.getParameter("name");
    String description = request.getParameter("description");

    String query = 
    "INSERT INTO TARP_COURSE (course_id, username) " + "\n" + 
    "VALUES(" + "'" + name + "'" + "," + "'" + username + "'" + ")";
    PreparedStatement preparedStmt = con.prepareStatement(query);

    preparedStmt.execute();
}
catch(Exception E) {
    session.setAttribute("failedToCreateCourse", "true");
}

response.sendRedirect("../index.jsp");
%>