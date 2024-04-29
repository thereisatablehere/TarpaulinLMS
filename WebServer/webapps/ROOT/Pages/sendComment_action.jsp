<%@include file="../userAuth.jsp"%>
<%@include file="../DBconnection.jsp"%>

<%@page import="
    java.sql.*, 
    oracle.jdbc.*, 
    java.util.Date
"%>

<%
String username = "username";

try{
    username = (String) session.getAttribute("username");
}
catch(Exception E) {
    username = "";
}
String comment = request.getParameter("comment");
String courseId = request.getParameter("courseId");

out.println(username + ", " + comment + ", " + courseId + "<br>");
            
if(comment.length() > 0) {
    try {
        String insertSql = "INSERT INTO TARP_S_COMMENT (course_id, s_username, s_comment, cdate) VALUES (?, ?, ?, ?)";
        PreparedStatement pstmt = con.prepareStatement(insertSql);
        pstmt.setString(1, courseId);
        pstmt.setString(2, username);
        pstmt.setString(3, comment);
        pstmt.setTimestamp(4, new java.sql.Timestamp(new Date().getTime()));
        out.println(insertSql + "<br>" + (new java.sql.Timestamp(new Date().getTime())) + "<br>");

        pstmt.executeUpdate();
        pstmt.close();

        out.println("Successfully posted comment");
    }
    catch (SQLException e) {
        out.println(e);
        session.setAttribute("failedToPostComment", "true");
    }
}

response.sendRedirect("courseView.jsp");
%>