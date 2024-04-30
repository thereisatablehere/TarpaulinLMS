<!--
    As of now, this is largely the same as normal courseView.jsp, and is probably a terrible way 
of separating the two. However, if the course view for instructors should end up being decently 
different enought from normal courseView.jsp, then this would be fine.
-->

<%@include file="../userAuth.jsp"%>

<%@include file="../DBconnection.jsp"%>

<%@page import="
    java.sql.*, 
    oracle.jdbc.*, 
    java.util.*
"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="../Styles/styles.css">
    <title>Tarpaulin - View a Course</title>
  <link rel="icon" type="image/x-icon" href="../Images/Tarpaulin_Logo_Alt_2.png">
</head>
  <body class="instructorHomeBody" style="display: none;">
    <script src="../Scripts/headerLoggedIn.js"></script>

    <section class="mainContainer courseView">

        <%
        String courseId = "";
        
        try {
            courseId = (String) session.getAttribute("courseId");
        }
        catch(Exception E) {
            out.println(E);
        }
        %>
        
        <p id="courseTitle" class="title"><%=courseId%> (Student View)</p>

        <nav id="nav">
            <p onclick="changeTab(this)" style="font-weight: bold;">Overview</p>
            <p onclick="changeTab(this)">Lectures</p>
            <p onclick="changeTab(this)">Tests</p>
            <!--<p onclick="changeTab(this)">Q Board</p>-->
            <p onclick="changeTab(this)">Comments</p>
        </nav>

        <div id="overview" class="tab">

            <div class="topInfo">
                <!-- not yet implemented, but maybe do so later if enought time and want to -->
                <button id="join" class="buttonNormal">Unenroll</button>
                
                <button id="join" class="buttonAccent">View Grades</button>
            </div>

            <div class="topInfo">

                <%
                String instructor = "instructor";

                String queryString = 
                "SELECT username" + "\n" + 
                "FROM TARP_COURSE" + "\n" + 
                "WHERE course_id='" + courseId + "'";
                
                PreparedStatement preparedStmt = con.prepareStatement(queryString);

                ResultSet result = preparedStmt.executeQuery();

                while(result.next()) {
                    instructor = result.getString(1);
                    break;
                }

                result.close();
                preparedStmt.close();

                session.setAttribute("instructor", instructor);
                %>

                <div style="margin-left: -0.5em;">
                    <p>Taught by</p>
                    <p class="instructor"><%=instructor%> (You)</p>
                </div>
                
                <!-- get rating of instructor - copied from instructorPage.jsp -->
                <div>
                    <%
                    String rating = "";

                    queryString = 
                    "SELECT instructor_score" + "\n" + 
                    "FROM TARP_RATES" + "\n" + 
                    "WHERE i_username='" + instructor + "'";
                    
                    preparedStmt = con.prepareStatement(queryString);

                    result = preparedStmt.executeQuery();

                    ArrayList<Integer> ratings = new ArrayList<Integer>();
                    int ratingsSum = 0;

                    while(result.next()) {
                        int currentRating = Integer.parseInt(result.getString(1));
                        ratingsSum += currentRating;

                        ratings.add(currentRating);
                    }

                    result.close();
                    preparedStmt.close();

                    String ratingToDisplay = "No Ratings";

                    if(ratings.size() > 0) {
                        // calculate average rating
                        double avgRating = ratingsSum / ((double) ratings.size());
                        avgRating /= 2;
                        // round to 2 decimal ppoints
                        avgRating = Math.round(avgRating * 100.0) / 100.0;

                        ratingToDisplay = "(" + String.valueOf(avgRating) + ")";

                        for(int i = 0; i < Math.floor(avgRating); i++) {
                    %>
                            <img draggable="false" class="star" src="../Images/star-full.svg">
                    <%
                        }
                    }
                    %>
                    
                    <p><%=ratingToDisplay%></p>
                </div>
            </div>

            <div class="description">
                <p>Description</p>

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
            </div>

        </div>

        <div id="lectures" class="tab">
            
            <div class="finished" style="
            padding: 0;
            margin: 0;
            ">
                <%
                int c_lectures = 0;
                
                String c_lects = 
                "SELECT course_id, lecture_id" + "\n" + 
                "FROM TARP_LECTURE" + "\n" + 
                "WHERE course_id='" + courseId + "'"  
                ;
                
                PreparedStatement c_lect_stmt = con.prepareStatement(c_lects);
                
                ResultSet res_c_lect = c_lect_stmt.executeQuery();
                
                while(res_c_lect.next()) { %>
                    <form class="course" action="setLectureIdSessionAttribute_action.jsp" method="post" style="
                    order: 5;
                    width: 100%;
                    padding: 0;
                    display: flex;
                    flex-direction: row;
                    align-self: flex-start;
                    justify-content: center;
                    ">

                            <div class="lectureContainer"style="order: 5;">
                                <input type="text" name="lectureId" value=<%="\"" + res_c_lect.getString(2) + "\""%> style="display: none;">
                                <input type="text" name="courseId" value=<%=courseId%> style="display: none;">

                                <button class="goToLecture" type="submit"><%=res_c_lect.getString(2)%></button>
                            </div>
                    </form>
                    <%  c_lectures++;
                }
                
                // if(c_lectures == 1) {
                %>
                <!--
                    <p class="bigDescription" style="margin-bottom: 1em; font-weight: bold;order: 1; text-align: center;"><%=c_lectures%> Lecture</p>
                -->
                <%
                // }
                // else {
                %>
                <!--
                    <p class="bigDescription" style="margin-bottom: 1em; font-weight: bold;order: 1; text-align: center;"><%=c_lectures%> Lectures</p>
                -->
                <%
                // }
                %>
            </div>
            
        </div>

        <div id="tests" class="tab">

            <%
            queryString = 
            "SELECT test_id, num_q" + "\n" + 
            "FROM TARP_TEST" + "\n" + 
            "WHERE course_id='" + courseId + "'";
            
            preparedStmt = con.prepareStatement(queryString);

            result = preparedStmt.executeQuery();

            boolean noTests = true;

            while(result.next()) {
                String testId = result.getString(1);

                // only show tests that have at least a single question
                if(result.getInt(2) > 0) {
                    noTests = false;
            %>

                    <form class="testContainer" action="takeTest_action.jsp" method="post">
                        <input type="text" name="testId" value=<%="\"" + testId + "\""%> style="display: none;">
                        
                        <p><%=testId%></p>
                        <p>The description of the test would go here - not yet implemented.</p>

                        <input type="text" name="took" value="false" style="display: none;">
                        <button tye="submit" class="buttonNormal">View</button>
                    </form>

            <%
                }
            }

            result.close();
            preparedStmt.close();
            
            if(noTests) {
            %>
                <p style="
                font-weight: 500;
                text-align: center;
                font-size: 1.1em;
                ">
                    This course does not have any tests with at least 1 question. 
                    <br>
                    Remember that students will not see any tests that you have created 
                    that do not have any questions.
                </p>
            <%
            }
            %>
            
        </div>

        <!--
        <div id="q board" class="tab">

            <div class="questionContainer">
                <div>
                    <p>userName</p>
                    <p>at</p>
                    <p>1:23pm</p>
                </div>
                
                <p>This is a question a user can post.</p>
            </div>

            <div class="questionContainer">
                <div>
                    <p class="instructor">theProf (instructor)</p>
                    <p>at</p>
                    <p>5:00pm</p>
                </div>
                
                <p>Something else here.</p>
            </div>

            <div class="questionContainer">
                <div>
                    <p>userHere</p>
                    <p>at</p>
                    <p>7:00am</p>
                </div>
                
                <p>Is this a question?</p>
            </div>
            
        </div>
        -->

        <div id="comments" class="tab">
            
            <%
            Boolean postCommentFailed = false;

            try{
                postCommentFailed = Boolean.parseBoolean((String) session.getAttribute("failedToPostComment"));
            }
            catch(Exception E) {
                postCommentFailed = false;
            }

            if(postCommentFailed) {
                out.println("Failed to post comment");
                session.setAttribute("failedToPostComment", "false");
            }
            %>

            <section id="commentsList">
                <% 
                String commentQuery = "SELECT s_username, s_comment, cdate FROM view_comments WHERE course_id = ? ORDER BY cdate DESC";
                PreparedStatement commentStmt = con.prepareStatement(commentQuery);
                commentStmt.setString(1, courseId);
                ResultSet commentsResultSet = commentStmt.executeQuery();

                boolean noComments = true;

                while (commentsResultSet.next()) {
                    noComments = false;

                    String commenter = commentsResultSet.getString("s_username");
                    String commentText = commentsResultSet.getString("s_comment");
                    Timestamp commentTime = commentsResultSet.getTimestamp("cdate");
                %>
                    <div class="questionContainer">
                        <div>
                            <%
                            if(commenter.equals(instructor)) {
                            %>
                                <p class="instructor"><%= commenter %> (instructor) (you)</p>
                            <%
                            }
                            else {
                            %>
                                <p><%= commenter %></p>
                            <%
                            }
                            %>
                            <p><%= new java.text.SimpleDateFormat("MM/dd/yy 'at' HH:mm").format(commentTime) %></p>
                        </div>
                        
                        <p><%= commentText %></p>
                    </div>
                <%
                }

                commentsResultSet.close();
                commentStmt.close();

                if(noComments) {
                %>
                    <p style="
                    font-weight: bold;
                    text-align: center;
                    font-size: 1.25em;
                    ">
                        This course does not have any comments.
                    </p>
                <%
                }
                %>
            </section>

            <form id="postCommmentContainer" action="sendComment_action.jsp" method="post">
                <input type="hidden" name="courseId" value="<%= courseId %>">
                
                <input type="text" name="comment" placeholder="Add a comment...">

                <button type="submit">
                    <img src="../Images/send.svg">
                </button>
            </form>
            
        </div>
        
    </section>

    <script src="../Scripts/courseViewNav.js"></script>
  </body>
</html>