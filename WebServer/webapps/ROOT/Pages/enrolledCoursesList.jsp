<%@include file="../DBconnection.jsp"%>

<%@page import="
    java.sql.*, 
    oracle.jdbc.*
"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="../Styles/styles.css">
    <title>Tarpaulin - Your Enrolled Courses</title>
    <link rel="icon" type="image/x-icon" href="../Images/Tarpaulin_Logo_Alt_2.png">
</head>
<body class="studentHomeBody">
<script src="../Scripts/headerLoggedIn.js"></script>

<img class="openNavbar" src="../Images/menu.svg">

<script src="../Scripts/loadSidebar.js"></script>

<section class="mainContainer">
  
  <p class="bigTitle">Your Enrolled Courses</p>

    <section class="coursesList" style="border: 1px solid #00000040;">

        <%  
            try {
                // Set the username here
                String username = (String) session.getAttribute("username");
                
                // Create the view dynamically
                String dynamicSQL = "DECLARE " +
                                    "v_username VARCHAR2(100) := '" + username + "'; " +
                                    "BEGIN " +
                                    "EXECUTE IMMEDIATE ' " +
                                    "CREATE OR REPLACE VIEW view_courses_taking AS " +
                                    "SELECT S.course_id, T.username " +
                                    "FROM tarp_enrolls S, tarp_course T " +
                                    "WHERE S.username = ''' || v_username || ''' AND T.course_id = S.course_id'; " +
                                    "END;";
                PreparedStatement pstmt = con.prepareStatement(dynamicSQL);
                pstmt.execute();
                
                // Prepare SQL query to select from the created view
                String query = "SELECT course_id, username FROM view_courses_taking";
                pstmt = con.prepareStatement(query);
                
                // Execute query
                ResultSet rs = pstmt.executeQuery();
                
                // Iterate over the result set
                while(rs.next()) {
                    String courseId = rs.getString("course_id");
                    String instructor = rs.getString("username");
        %>
                    <!-- TODO: make redirect work like studentHome.jsp so course page can actually load context -->
                    <div class="courseContainer">
                        <div class="course">
                            <p class="bigDescription"><a href="courseView.jsp?courseId=<%= courseId %>"><%= courseId %></a></p>
                            
                            <div>
                                <p>Instructor:</p>
                                <p class="username"><%= instructor %></p>
                            </div>
                        </div>
                    </div>
        <%
                }
                
                // Close resources
                rs.close();
                pstmt.close();
            } catch(Exception e) {
                e.printStackTrace();
            }
        %>

    </section>

</section>

<script src="../Scripts/navbarToggle.js"></script>
</body>
</html>

