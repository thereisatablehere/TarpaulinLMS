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
            session.setAttribute("loadBackToSearch", "false");
            
            try {
                // Set the username here
                String username = (String) session.getAttribute("username");
                
                // Prepare SQL query to select from the created view
                String query = "SELECT course_id, username FROM view_courses_taking WHERE studentUser = ?";
                PreparedStatement pstmt = con.prepareStatement(query);
                
                // Set parameter
                pstmt.setString(1, username);
                
                // Execute query
                ResultSet rs = pstmt.executeQuery();
                
                // Iterate over the result set
                while(rs.next()) {
                    String courseId = rs.getString("course_id");
                    String instructor = rs.getString("username");
        %>

                    <form class="course" action="setCourseIdSessionAttribute_action.jsp" method="post">
                        <input type="text" name="courseId" value=<%=courseId%> style="display: none;">
                        
                        <button type="submit" class="bigDescription"><%= courseId %></button>

                        <div>
                            <p>by</p>
                            <p class="instructorName"><%= instructor %></p>
                        </div>

                        <!-- maybe implement later if have time and want to -->
                        <!--
                        <div>
                            <p>Progress:</p>
                            <p class="progress">50%</p>
                        </div>
                        -->
                    </form>
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

