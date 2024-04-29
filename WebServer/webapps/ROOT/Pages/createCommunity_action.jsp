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

    out.println("<strong>Inputs:</strong>");
    out.println("<br>" + name + "<br>" + description + "<br>" + date);
    
    String query = 
    "INSERT INTO TARP_COMMUNITY" +
    "(comm_id, username, date_created, c_description, num_students) " + 
    "values(" + 
    "'" + name + "', '" + 
    username + "', " + 
    "TIMESTAMP '" + date + " 0:0:0', '" + 
    description + "', " + 
    "0)";
    
    out.println("<br><p style='color: blue'>" + query + "</p>");
    
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
    out.println("<p style='color: green;'>Course created successfully!</p>");

    response.sendRedirect("joinedCommunitiesList.jsp");
}
catch(Exception E) {
    session.setAttribute("failedToCreateCommunity", "true");
    out.println("<p style='color: red'>" + E + "</p>");
    
    response.sendRedirect("createCommunity.jsp");
}

%>