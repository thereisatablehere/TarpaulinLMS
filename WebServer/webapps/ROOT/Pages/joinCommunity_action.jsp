<%@include file="../userAuth.jsp"%>

<%@include file="../DBconnection.jsp"%>

<%@page import="
    java.sql.*, 
    oracle.jdbc.*, 
    java.util.ArrayList, 
    java.util.Collections
"%>

<%
String username = "";

try{
    username = (String) session.getAttribute("username");
}
catch(Exception E) {
    username = "";
}

String communityName = request.getParameter("communityName");
String action = request.getParameter("action");

try {
    //String findCommunityQuery = "SELECT comm_id FROM TARP_COMMUNITY WHERE c_name=?";
    //PreparedStatement findStmt = con.prepareStatement(findCommunityQuery);
    //findStmt.setString(1, communityName);
    //ResultSet rs = findStmt.executeQuery();
    
    //if (!rs.next()) {
    //    out.println("<script>alert('Community not found.'); window.location.href='joinedCommunitiesList.jsp';</script>");
    //    return;
    //}
    //String communityId = rs.getString("comm_id");
    //rs.close();
    //findStmt.close();

    // Now, attempt to enroll the user in the community
    String enrollQuery = "INSERT INTO TARP_JOINED_BY (username, community_id) VALUES (?, ?)";
    PreparedStatement enrollStmt = con.prepareStatement(enrollQuery);
    enrollStmt.setString(1, username);
    enrollStmt.setString(2, communityName);
    enrollStmt.executeUpdate();
    enrollStmt.close();
    
    out.println("Successfully joined the community");

    response.sendRedirect("joinedCommunitiesList.jsp");
} catch (SQLException e) {
    out.println("Failed to join the community");
    out.println("SQL Error: " + e.getMessage());

    session.setAttribute("failedToJoinCommunity", "true");
    
    response.sendRedirect("joinCommunity.jsp");
}
%>