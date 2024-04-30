<%@include file="../userAuth.jsp"%>
<%@include file="../DBconnection.jsp"%>

<%@page import="
    java.sql.*, 
    oracle.jdbc.*
"%>

<%
        // get username (needed for calculating rank)
        String username = "";
    
        try{
            username = (String) session.getAttribute("username");
        }
        catch(Exception E) {
            out.println(E);
        }


        String courseId = "";
        
        try {
            courseId = (String) session.getAttribute("courseId");
        }
        catch(Exception E) {
            out.println(E);
        }    

        String instructor = "instructor";

        
        try {
            instructor = (String) session.getAttribute("instructor");
        }
        catch(Exception E) {
            out.println(E);
        }

        int rating = Integer.parseInt(request.getParameter("rating"));
        out.println("<strong>" + rating + "</strong><br>");

        try {
            String callSQL = "{call rate_instructor(?, ?, ?)}";
            CallableStatement cstmt = con.prepareCall(callSQL);
            cstmt.setString(1, courseId);
            cstmt.setString(2, username);
            cstmt.setInt(3, rating);

            cstmt.executeUpdate();
            cstmt.close();
            
            out.println("<p style='color:green;'>" + "rate_instructor successfully called!" + "</p>");
        }
        catch(Exception E) {
            // instructor has already been rated, so replace rating 
            // by dropping it from table and adding new rating
            out.println("<p style='color:red;'>" + E + "</p>");

            out.println("Trying to replace rating");
            
            try {
                out.println("<br>username, instructor: " + "<p style='color: blue;'>" + username + " , " + instructor + "</p>");
                String query = "DELETE FROM TARP_RATES WHERE " + 
                "s_username='" + username + "' AND " + 
                "i_username='" + instructor + "'";
                PreparedStatement prepStmt = con.prepareStatement(query);

                prepStmt.execute();

                String callSQL = "{call rate_instructor(?, ?, ?)}";
                CallableStatement cstmt = con.prepareCall(callSQL);
                cstmt.setString(1, courseId);
                cstmt.setString(2, username);
                cstmt.setInt(3, rating);

                cstmt.executeUpdate();
                cstmt.close();

                out.println("<p style='color:green;'>" + "rating successfully updated!" + "</p>");
            }
            catch(Exception Ex) {
                out.println("<br><p style='color:red;'>" + Ex + "</p>");
            }

        }
        
        response.sendRedirect("instructorPage.jsp");
%>