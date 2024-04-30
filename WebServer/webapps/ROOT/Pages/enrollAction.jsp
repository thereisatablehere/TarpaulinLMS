<%@include file="../userAuth.jsp"%>

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
%>

<%
String courseId = "";

try {
    courseId = (String) session.getAttribute("courseId");
}
catch(Exception E) {
    out.println(E);
}

%>
<%
        CallableStatement callStmt = con.prepareCall("{call enroll_in_course(?,?)}");
        callStmt.clearParameters();
        callStmt.setString(1, courseId);
        callStmt.setString(2, username);
        callStmt.execute();
        callStmt.close();

        response.sendRedirect("courseView.jsp");
%>