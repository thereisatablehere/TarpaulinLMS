<%@include file="../userAuth.jsp"%>
<%@include file="../DBconnection.jsp"%>

<%@page import="
    java.sql.*, 
    oracle.jdbc.*, 
    java.util.Date
"%>

<%
String username = "";

try{
    username = (String) session.getAttribute("username");
}
catch(Exception E) {
    username = "";
}

boolean student = true;
try {
    String queryString = 
    "SELECT f_name" + "\n" + 
    "FROM TARP_INSTRUCTOR" + "\n" + 
    "WHERE username='" + username + "'";
    
    PreparedStatement preparedStmt = con.prepareStatement(queryString);

    ResultSet result = preparedStmt.executeQuery();

    student = !(result.next());
}
catch(Exception E) {
    student = true;
}

String comment = request.getParameter("comment");
String courseId = request.getParameter("courseId");

out.println(username + ", " + comment + ", " + courseId + "<br>");
            
if(comment.length() > 0) {
    try {
        String insertSql = "";
        
        if(student) {
            insertSql = "INSERT INTO TARP_S_COMMENT (course_id, s_username, s_comment, cdate) VALUES (?, ?, ?, ?)";
        }
        else {
            insertSql = "INSERT INTO TARP_I_COMMENT (course_id, i_username, i_comment, cdate) VALUES (?, ?, ?, ?)";
        }
        
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

if(student) {
    response.sendRedirect("courseView.jsp");
}
else {
    response.sendRedirect("courseViewAsInstructor.jsp");
}
%>