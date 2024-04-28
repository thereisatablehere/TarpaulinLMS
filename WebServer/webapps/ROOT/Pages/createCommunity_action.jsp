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
    String date = request.getParameter("date");

    String query = 
    "INSERT INTO TARP_COMMUNITY " + 
    "(comm_id, username, date_created, c_description, num_students) " + "\n" + 
    "VALUES(" + 
    "'" + name + "'" + "," + 
    "'" + username + "'" + "," + 
    "'" + date + "'" + ", " + 
    "'" + description + "'" + ", " + 
    "'" + "0" + "'" + 
    ")";
    PreparedStatement preparedStmt = con.prepareStatement(query);

    preparedStmt.execute();

    String queryJoin = 
    "INSERT INTO TARP_JOINED_BY " + 
    "(community_id, username) " + "\n" + 
    "VALUES(" + 
    "'" + name + "'" + "," + 
    "'" + username + "'" + 
    ")";
    PreparedStatement preparedStmtJoin = con.prepareStatement(queryJoin);

    preparedStmtJoin.execute();
    out.println("Course created successfully!");
}
catch(Exception E) {
    session.setAttribute("failedToCreateCommunity", "true");
    out.println(E);
}

response.sendRedirect("../index.jsp");
%>