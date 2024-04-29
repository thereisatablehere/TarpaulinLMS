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
        %>

        <p style="font-size: 2em; font-weight: bold;"><%=instructor%></p>

        <div id="ratingDisplay">
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

        <section id="ratingContainer">
            <button id="openRatingForm" class="buttonNormal" onclick="toggleRatingForm()">Rate</button>

            <form id="ratingForm" method="post" action="rating_action.jsp">
                <div>
                    <section><label><input type="radio" name="rating" value="0">0</label></section>
                    <section><label><input type="radio" name="rating" value="1">1</label></section>
                    <section><label><input type="radio" name="rating" value="2">2</label></section>
                    <section><label><input type="radio" name="rating" value="3">3</label></section>
                    <section><label><input type="radio" name="rating" value="4">4</label></section>
                    <section><label><input type="radio" name="rating" value="5">5</label></section>
                </div>

                <div>
                    <button type="submit" class="buttonAccent">Submit</button>
                    
                    <button type="button" class="buttonNormal" onclick="toggleRatingForm()">Close</button>
                </div>
            </form>
        </section>

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
                    <% 
                String c_description = "";

                String query2 = 
                "SELECT descrip" + "\n" + 
                "FROM TARP_COURSE" + "\n" + 
                "WHERE course_id='" + courseId + "'";
                
                PreparedStatement preparedStmt2 = con.prepareStatement(query2);

                ResultSet result2 = preparedStmt2.executeQuery();

                while(result2.next()) {
                    c_description = result2.getString(1);
                    break;
                }

                result2.close();
                preparedStmt2.close();
                %>
                <p><%=c_description%></p>
                </form>

            <%
            }

            result.close();
            preparedStmt.close();
            %>

        </section>
  
        
    </section>
    

    <script>
        let open = false;

        function toggleRatingForm() {
            open = !(open);

            if(open) {
                document.getElementById("openRatingForm").style.display = "none";
                document.getElementById("ratingForm").style.display = "flex";
            }
            else {
                document.getElementById("openRatingForm").style.display = "flex";
                document.getElementById("ratingForm").style.display = "none";
            }
        }
    </script>
  </body>
</html>