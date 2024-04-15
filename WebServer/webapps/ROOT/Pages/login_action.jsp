<%@include file="../DBconnection.jsp"%>

<%@page import="
    java.sql.*, 
    oracle.jdbc.*
"%>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");

CallableStatement callStmt = con.prepareCall(" {? = call LOGIN(?,?)}");
callStmt.setString(2, username);
callStmt.setString(3, password);

callStmt.registerOutParameter(1, Types.INTEGER);

callStmt.execute();

int result = callStmt.getInt(1);
session.setAttribute("userType", result);

if(result == 0) {
    response.sendRedirect("login.jsp");
}
else {
    session.setAttribute("username", username);

    response.sendRedirect("../index.jsp");
}
%>

<p id="output" style="display: none;"><%=result%></p>

<script src="../Scripts/userTypeLocalStorage.js"></script>
