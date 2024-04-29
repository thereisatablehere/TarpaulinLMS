<%@include file="../userAuth.jsp"%>
<%@include file="../DBconnection.jsp"%>

<%@page import="
    java.sql.*, 
    oracle.jdbc.*
"%>

<%
String courseId = request.getParameter("courseId");
String lectureId = request.getParameter("lectureId");
String username = request.getParameter("username");

String markW = "INSERT INTO TARP_WATCHES (lecture_id, course_id, username) VALUES('" + lectureId + "', '" + courseId + "', '" + username + "')";

PreparedStatement setWatchedStmt = con.prepareStatement(markW);
    
setWatchedStmt.execute();

response.sendRedirect("courseView.jsp");
%>