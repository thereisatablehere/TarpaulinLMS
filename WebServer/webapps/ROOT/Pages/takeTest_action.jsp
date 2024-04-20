<%@include file="../DBconnection.jsp"%>

<%@page import="
    java.sql.*, 
    oracle.jdbc.*
"%>

<%
boolean took = Boolean.parseBoolean((String) request.getParameter("took"));
String testId = request.getParameter("testId");

session.setAttribute("testId", testId);

if(took) {
    response.sendRedirect("testResults.jsp");
}
else {
    response.sendRedirect("test.jsp");
}
%>