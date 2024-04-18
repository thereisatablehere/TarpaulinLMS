<!-- actually delete a course - this file called from instructorHome.jsp -->

<%@include file="../DBconnection.jsp"%>

<%@page import="
    java.sql.*, 
    oracle.jdbc.*
"%>

<%
try {
    String courseId = request.getParameter("courseId");

    CallableStatement callStmt = con.prepareCall(" {call DELETE_COURSE(?)}");
    callStmt.setString(1, courseId);

    callStmt.execute();

    out.println("course deleted");

    response.sendRedirect("../index.jsp");
}
catch(Exception E) {
    out.println(E);

    response.sendRedirect("../index.jsp");
}
%>