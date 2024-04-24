<%@include file="../userAuth.jsp"%>

<%@include file="../DBconnection.jsp"%>

<%@page import="
    java.sql.*, 
    oracle.jdbc.*
"%>

<%
String username = "username";

try{
    username = (String) session.getAttribute("username");
}
catch(Exception E) {
    username = "username";
}
%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="../Styles/styles.css">
    <title>Tarpaulin - View a Course</title>
  <link rel="icon" type="image/x-icon" href="../Images/Tarpaulin_Logo_Alt_2.png">
</head>
  <body class="instructorHomeBody">
    <script src="../Scripts/headerLoggedIn.js"></script>

    <script src="../Scripts/loadSidebar.js"></script>

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

        <%
        boolean loadBackToSearch = false;

        try {
            loadBackToSearch = Boolean.parseBoolean((String) session.getAttribute("loadBackToSearch"));
        }
        catch(Exception E) {
            out.println(E);
        }

        if(loadBackToSearch) {
        %>
            <button class="buttonAccent" 
            style="display: flex; align-self: center;" 
            onclick="window.open('courseSearchResults.jsp', '_self')">
                Back to search
            </button>
        <%
        }
        %>
        
        <p class="title"><%=courseId%></p>

        <nav id="nav">
            <p onclick="changeTab(this)" style="font-weight: bold;">Overview</p>
            <p onclick="changeTab(this)">Lectures</p>
            <p onclick="changeTab(this)">Tests</p>
            <p onclick="changeTab(this)">Q Board</p>
            <p onclick="changeTab(this)">Comments</p>
        </nav>

        <div id="overview" class="tab">

            <div class="topInfo">
                <!-- not yet implemented, but maybe do so later if enought time and want to -->
                <%  
                String query = "SELECT * FROM TARP_ENROLLS where course_id = ? AND username = ?";
                PreparedStatement prepStmt1 = con.prepareStatement(query);
                prepStmt1.clearParameters();
                prepStmt1.setString(1, courseId);
                prepStmt1.setString(2, username);
                
                ResultSet result1 = prepStmt1.executeQuery();
                if (!result1.next()){%>
                    <button id="join" class="buttonNormal" onclick='window.open("enrollAction.jsp", "_self")'>Enroll</button>
                <%}
                else{%>
                    <button id="join" class="buttonNormal">Enrolled</button>
                <%}

                result1.close();
                prepStmt1.close();
                %>
                
                <button id="join" class="buttonAccent" onclick='window.open("courseGrades.jsp", "_self")'>View Grades</button>
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
                    <p class="instructor" onclick='window.open("instructorPage.jsp", "_self")'><%=instructor%></p>
                </div>
                
                <!-- Course rating - not yet implemented, but maybe do later if enough time and want to -->
                <div>
                    <img draggable="false" class="star" src="../Images/star-full.svg">
                    <img draggable="false" class="star" src="../Images/star-full.svg">
                    <img draggable="false" class="star" src="../Images/star-full.svg">
                    
                    <p>(3.2)</p>
                </div>
            </div>

            <div class="description">
                <p>Description</p>

                <!-- TODO -->
                <p>The description of this course would go here - not yet implemented.</p>
            </div>

        </div>

        <div id="lectures" class="tab">

            <div class="todo">
                <p class="bigDescription" style="margin-bottom: 1em; font-weight: bold;">3 Unfinished Lectures</p>

                <div class="lectureContainer">
                    <p>Data Types Part 3</p>
                    <div class="video">Video placeholder</div>
                </div>
    
                <div class="lectureContainer">
                    <p>Intro to Data Structures</p>
                    <div class="video">Video placeholder</div>
                </div>
    
                <div class="lectureContainer">
                    <p>Data Structures Part 2</p>
                    <div class="video">Video placeholder</div>
                </div>
            </div>

            <div class="finished">
                <p class="bigDescription" style="margin-bottom: 1em; font-weight: bold;">3 Completed Lectures</p>

                <div class="lectureContainer">
                    <p>Your First Program</p>
                    <div class="video">Video placeholder</div>
                </div>
    
                <div class="lectureContainer">
                    <p>Intro to Data Types</p>
                    <div class="video">Video placeholder</div>
                </div>
    
                <div class="lectureContainer">
                    <p>Data Types Part 2</p>
                    <div class="video">Video placeholder</div>
                </div>
            </div>


        </div>

        <div id="tests" class="tab">

            <%
            queryString = 
            "SELECT test_id" + "\n" + 
            "FROM TARP_TEST" + "\n" + 
            "WHERE course_id='" + courseId + "'";
            
            preparedStmt = con.prepareStatement(queryString);

            result = preparedStmt.executeQuery();

            while(result.next()) {
                String testId = result.getString(1);

                // check to see if test has alrady been taken
                String queryStringInner = 
                "SELECT test_id, score" + "\n" + 
                "FROM TARP_TAKEN_BY" + "\n" + 
                "WHERE test_id='" + testId + "'" + " AND " + 
                    "course_id='" + courseId + "'" + " AND " + 
                    "username='" + username + "'";
                
                PreparedStatement preparedStmtInner = con.prepareStatement(queryStringInner);

                ResultSet resultInner = preparedStmtInner.executeQuery();

                boolean took = false;
                String score = "-1";

                while(resultInner.next()) {
                    took = true;
                    score = resultInner.getString(2);

                    break;
                }

                resultInner.close();
                preparedStmtInner.close();
            %>

                <form class="testContainer" action="takeTest_action.jsp" method="post">
                    <input type="text" name="testId" value=<%="\"" + testId + "\""%> style="display: none;">
                    
                    <p><%=testId%></p>
                    <p>The description of the test would go here - not yet implemented.</p>

                    <input type="text" name="took" value=<%=took%> style="display: none;">

                    <%
                    if(took) {
                    %>
                        <div>
                            <p class="takenText">Completed!</p>
                            <p class="score">Score: <%=score%></p>
                        </div>
                    <%
                    }
                    else {
                    %>
                        <button tye="submit" class="buttonNormal">Start</button>
                    <%
                    }
                    %>

                </form>

            <%
            }

            result.close();
            preparedStmt.close();
            %>

            <!--
            <div class="testContainer">
                <p>Test Title</p>
                <p>This test is about something, and that is described right here.</p>
                <div>
                    <p>completed on</p>
                    <p>01/23/12 at 12:34pm</p>
                </div>
                <button class="buttonAccent" onclick='window.open("testResults.jsp", "_self")'>View Results</button>
            </div>
            -->
            
        </div>

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

        <div id="comments" class="tab">
            <input type="text" placeholder="comment" style="
                width: 50%;
                padding: 10px;
                outline: none;
                border: 1px solid black;
                border-radius: 10px;
                font-size: 1em;
                margin-left: 10%;
            ">
            <button class="buttonAccent" style="font-size: 0.7em; margin: 0; margin-top: 0.5em; margin-bottom: 2em; margin-left: 10%;">Comment</button>

            <div class="questionContainer">
                <div>
                    <p class="instructor">Bruce The Prof (instructor)</p>
                    <p>01/22/24 at 2:30pm</p>
                </div>
                
                <p>Thanks for all of the feedback everyone!</p>
            </div>
            
            <div class="questionContainer">
                <div>
                    <p>userHere</p>
                    <p>01/21/24 at 1:23pm</p>
                </div>
                
                <p>Great course.</p>
            </div>

            <div class="questionContainer">
                <div>
                    <p>anotherUser</p>
                    <p>01/21/24 at 1:20pm</p>
                </div>
                
                <p>I learned a lot of usefull stuff.</p>
            </div>
            
        </div>
        
    </section>

    <script src="../Scripts/courseViewNav.js"></script>
  </body>
</html>