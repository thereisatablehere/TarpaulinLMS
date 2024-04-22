<!-- lots of inline CSS, but since JSP and HTML are already up and everything works, 
maybe just leave it -->

<%@include file="../userAuth.jsp"%>

<%@include file="../DBconnection.jsp"%>

<%@page import="
    java.sql.*, 
    oracle.jdbc.*, 
    java.util.ArrayList
"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="../Styles/styles.css">
    <title>Tarpaulin - Instructor Page</title>
  <link rel="icon" type="image/x-icon" href="../Images/Tarpaulin_Logo_Alt_2.png">
</head>
  <body class="studentHomeBody">
    <script src="../Scripts/headerLoggedIn.js"></script>

    <script src="../Scripts/loadSidebar.js"></script>
    
    <section class="mainContainer">

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
            out.println("ee");
            String formRating = request.getParameter("rating");
            out.println("eeeee");
            out.println(formRating);
            out.println(courseId);
            out.println("Course ID: " + courseId);
            out.println("Username: " + username);
            
            if (formRating != null && courseId != null) {
                out.println("eqe");

                try {
                    int rating = Integer.parseInt(formRating);
                    String callSQL = "{ call rate_instructor(?, ?, ?) }";
                    CallableStatement cstmt = con.prepareCall(callSQL);
                    cstmt.setString(1, courseId);
                    cstmt.setString(2, username);
                    cstmt.setInt(3, rating);
                    
                    out.println("Executing stored procedure for rating...");
                    cstmt.execute();
                    out.println("Stored procedure executed successfully.");
                    cstmt.close();
                    
                    response.sendRedirect("instructorPage.jsp"); // Redirect to a confirmation or status page

                } catch (SQLException e) {
                    out.println("SQL Error: " + e.getMessage());
                    request.setAttribute("errorMessage", "Database error occurred. Please try again.");
                } catch (NumberFormatException e) {
                    out.println("Error converting rating to integer: " + e.getMessage());
                    request.setAttribute("errorMessage", "Invalid rating format.");
                } 
            }
        }
        %>

        <p style="font-size: 2em; font-weight: bold;"><%=instructor%></p>

        <div style="
            display: flex;
            flex-direction: row;
            align-items: center;
        ">
            <div>
                <%
                String rating = "";

                String queryString = 
                "SELECT instructor_score" + "\n" + 
                "FROM TARP_RATES" + "\n" + 
                "WHERE i_username='" + instructor + "'";
                
                PreparedStatement preparedStmt = con.prepareStatement(queryString);

                ResultSet result = preparedStmt.executeQuery();

                ArrayList<Integer> ratings = new ArrayList<Integer>();
                int ratingsSum = 0;

                while(result.next()) {
                    int currentRating = Integer.parseInt(result.getString(1));
                    ratingsSum += currentRating;

                    ratings.add(currentRating);
                }

                result.close();
                preparedStmt.close();

                // calculate average rating
                double avgRating = ratingsSum / ((double) ratings.size());
                avgRating /= 2;
                // round to 2 decimal ppoints
                avgRating = Math.round(avgRating * 100.0) / 100.0;

                for(int i = 0; i < Math.floor(avgRating); i++) {
                %>
                    <img draggable="false" class="star" src="../Images/star-full.svg">
                <%
                }
                %>
            </div>
            <p style="margin-left: 0.5em;">(<%=avgRating%>)</p>
        </div>

        <button class="buttonNormal" 
            style="margin: 0; font-size: 0.8em;"
            onclick='document.getElementById("ratingControls").style.display = "flex"'
        >Rate</button>
        <form id="ratingForm" method="post" action="">
            <input type="hidden" name="action" value="rating">
            <div id="ratingControls" style="
                display: none;
                flex-direction: row;
                align-items: center;
                justify-content: space-between;
                background-color: white;
                border: 1px solid #00000040;
                border-radius: 20px;
                margin-top: 0.5em;
                padding: 7px;
                ">
                <label><input type="radio" name="rating" value="0">0</label>
                <label><input type="radio" name="rating" value="1">1</label>
                <label><input type="radio" name="rating" value="2">2</label>
                <label><input type="radio" name="rating" value="3">3</label>
                <label><input type="radio" name="rating" value="4">4</label>
                <label><input type="radio" name="rating" value="5">5</label>
        
                <button type="submit" class="buttonAccent" style="font-size: 0.8em;">Submit</button>
                <button type="button" class="buttonNormal" style="font-size: 0.8em;"
                    onclick='document.getElementById("ratingControls").style.display = "none"'>Close</button>
            </div>
        </form>

            <p style="
                font-size: 1.75em;
                font-weight: 500;
                margin-top: 1em;
                margin-bottom: 0;
            ">Courses</p>
  
            <section id="instructorTaught" class="listContainer coursesList">
                
                <%
                queryString = 
                "SELECT course_id" + "\n" + 
                "FROM TARP_COURSE" + "\n" + 
                "WHERE username='" + instructor + "'";
                
                preparedStmt = con.prepareStatement(queryString);

                result = preparedStmt.executeQuery();

                while(result.next()) {
                    String courseId2 = result.getString(1);
                %>

                    <form class="taught" action="setCourseIdSessionAttribute_action.jsp" method="post">
                        <input type="text" name="courseId2" value=<%=courseId2%> style="display: none;">

                        <button class="name"><%=courseId2%></button>
                        
                        <!-- rating - maybe implement later if have time and want to -->
                        <div style="
                            display: flex;
                            flex-direction: row;
                            align-items: center;
                        ">
                            <div>
                                <img draggable="false" class="star" src="../Images/star-full.svg">
                                <img draggable="false" class="star" src="../Images/star-full.svg">
                                <img draggable="false" class="star" src="../Images/star-full.svg">
                                <img draggable="false" class="star" src="../Images/star-full.svg">
                            </div>
                            <p style="margin-left: 0.5em;">(4.5)</p>
                        </div>

                        <%

                        %>

                        <!-- TODO -->
                        <p>The description of this course would go here - not yet implemented.</p>
                    </form>

                <%
                }

                result.close();
                preparedStmt.close();
                %>

            </section>
  
        
    </section>
  </body>
</html>