<%@include file="../userAuth.jsp"%>
<%@include file="../DBconnection.jsp"%>

<%@page import="
    java.sql.*, 
    oracle.jdbc.*
"%>

<%
        // get username (needed for calculating rank)
        String username = "username";
    
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

        String action = request.getParameter("action");
        if ("rating".equals(action)) {
            String formRating = request.getParameter("rating");
            if (formRating != null && courseId != null) {
                try {
                    out.println("Action: " + action);
                    out.println("Rating: " + formRating);
                    out.println("Course ID: " + courseId);
                    out.println("Username: " + username);
                
                    int rating = Integer.parseInt(formRating);

                    if (rating < 1 || rating > 10) {
                        out.println("<script>alert('Rating must be between 1 and 10.'); window.location.href='instructorPage.jsp';</script>");
                    } else {
                        out.println("xxxx: ");
                    String callSQL = "{call rate_instructor(?, ?, ?)}";
                    CallableStatement cstmt = con.prepareCall(callSQL);
                    cstmt.setString(1, courseId);
                    cstmt.setString(2, username);
                    cstmt.setInt(3, rating);
                    out.println("ssssss: ");
                    if (con != null && !con.isClosed()) {
                        out.println("oooooo: ");
                        cstmt.executeUpdate();
                        out.println("not reached ");
                    } else {
                        // Log an error or throw an exception
                        out.println("<script>alert('Database connection is closed or invalid.'); window.location.href='instructorPage.jsp';</script>");

                    }
                    out.println("ttttt: ");
                    cstmt.close();

                    }
                } catch (SQLException e) {
                    String detailedError = "SQL Error: " + e.getMessage();
                    out.println("<script>alert('" + detailedError + "'); window.location.href='instructorPage.jsp';</script>");
                    return;
                } catch (NumberFormatException e) {
                    out.println("<script>alert('Rating must be a number between 1 and 10.'); window.location.href='instructorPage.jsp';</script>");
                    return;
                }
                finally {
                    // Close the connection
                    try {
                        if (con != null) {
                            con.close();
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
%>