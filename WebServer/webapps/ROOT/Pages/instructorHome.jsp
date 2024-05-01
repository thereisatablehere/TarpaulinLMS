<%@include file="../userAuth.jsp"%>

<%@include file="../DBconnection.jsp"%>

<%@page import="
    java.sql.*, 
    oracle.jdbc.*, 
    java.util.*
"%>

<%@include file="../dontCacheJSP.jsp"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="../Styles/styles.css">
    <title>Tarpaulin - Instructor Home</title>
  <link rel="icon" type="image/x-icon" href="../Images/Tarpaulin_Logo_Alt_2.png">
</head>
  <body class="instructorHomeBody">
    <script src="../Scripts/headerLoggedIn.js"></script>

    <%
    Boolean courseCreateFailed = false;

    try{
        courseCreateFailed = Boolean.parseBoolean((String) session.getAttribute("failedToCreateCourse"));
    }
    catch(Exception E) {
        courseCreateFailed = false;
    }

    if(courseCreateFailed) {
        session.setAttribute("failedToCreateCourse", "false");
    %>
        <div id="createCourseFailedMessage">
            <img class="errorIcon" src="../Images/exclamation-outline.svg">
            <p>Failed to create course</p>
            <img class="closeIcon" src="../Images/close.svg" 
            onclick="this.parentNode.style.display='none'">
        </div>
    <%
    }
    %>

    <section class="mainContainer">
        
        <!-- welcome message -->
        <div class="studentWelcome title">
            <p>Welcome back, </p>
            
            <%
            String username = "";

            try{
                username = (String) session.getAttribute("username");
            }
            catch(Exception E) {
                username = "";
            }
            %>
            <p id="username"><%=username%></p>
            <p>!</p>
        </div>

        <!-- rating -->
        <div class="studentWelcome" style="font-size: 1.2em;">
            <p>Your rating:</p>
            
            <%
            String ratingToDisplay = "NA";

            try {
                String rating = "";

                String queryString = 
                "SELECT instructor_score" + "\n" + 
                "FROM TARP_RATES" + "\n" + 
                "WHERE i_username='" + username + "'";
                
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

                ratingToDisplay = "No Ratings";

                if(ratings.size() > 0) {
                    // calculate average rating
                    double avgRating = ratingsSum / ((double) ratings.size());
                    avgRating /= 2;
                    // round to 2 decimal ppoints
                    avgRating = Math.round(avgRating * 100.0) / 100.0;

                    ratingToDisplay = String.valueOf(avgRating);
                }
            }
            catch(Exception E) {
                ratingToDisplay = "NA";
            }
            %>
            
            <p style="margin-left: 0.35em"><%=ratingToDisplay%></p>
        </div>

        <button class="buttonAccent createCourseButton" onclick='window.open("createCourse.jsp", "_self")'>Create a Course</button>

        <section class="studentHomeMainContainer instructorMainContainer">

            <div class="listContainer">

                <p class="bigTitle">My Created Courses</p>

                <!-- confirm delete course popup -->
                <form class="confirmDeleteCourse" action="deleteCourse_action.jsp" method="post">
                    <p></p>

                    <input type="text" name="courseId" style="display: none;">
                    
                    <div>
                        <button class="buttonAccent" type="button" onclick=hideConfirmDeleteCourse()>No</button>
                        <button class="buttonNormal" type="submit">Yes</button>
                    </div>
                </form>
                
                <div class="list coursesList">

                    <%
                    try{
                        String query = 
                        "SELECT * " + "\n" + 
                        "FROM TARP_COURSE " + "\n" + 
                        "WHERE username='" + username + "'";
                        PreparedStatement preparedStmt = con.prepareStatement(query);
                        
                        ResultSet result = preparedStmt.executeQuery();
                        
                        while(result.next()) {
                            String courseId = result.getString(1);
                    %>
            
                            <!-- extra indent because part of SJP while loop above  -->
                            <div class="instructorCoursePreview">
                                <p class="bigDescription"><%=courseId%></p>

                                <!-- course rating - maybe implement later, but for now don't include -->
                                <!--
                                <div class="rating">
                                    <div>
                                        <img draggable="false" class="star" src="../Images/star-full.svg">
                                        <img draggable="false" class="star" src="../Images/star-full.svg">
                                        <img draggable="false" class="star" src="../Images/star-full.svg">
                                        <img draggable="false" class="star" src="../Images/star-full.svg">
                                        <img class="emptyStar" src="../Images/star-full.svg">
                                    </div>
                                    <p>(4.5)</p>
                                </div>
                                -->

                                <!-- get the number of students taking the course -->
                                <%
                                String queryInner = 
                                "SELECT username " + "\n" + 
                                // WHY IS ENROLLS SPELLED WITH 2 L'S??? SPELLING FEELS HARD SOMETIMES
                                "FROM TARP_ENROLLS " + "\n" + 
                                "WHERE course_id='" + courseId + "'";
                                PreparedStatement preparedStmtInner = con.prepareStatement(queryInner);
                                
                                ResultSet resultInner = preparedStmtInner.executeQuery();
                                
                                int count = 0;
                                while(resultInner.next()) {
                                    ++count;
                                }

                                resultInner.close();
                                preparedStmtInner.close();
                                %>

                                <div class="students">
                                    <p><%=count%></p>
                                    
                                    <%
                                    if(count == 1) {
                                    %>
                                        <p>students</p>
                                    <%
                                    }
                                    else {
                                    %>
                                        <p>student</p>
                                    <%
                                    }
                                    %>

                                    <%
                                    if(count == 0) {
                                    %>
                                        <img src="../Images/mood-sad-outline.svg" style="
                                            width: 18px;
                                            height: 18px;
                                            margin-left: 0.35em;
                                        ">
                                    <%
                                    }
                                    %>
                                </div>

                                <div id="controls" class="controls">
                                    <form action="setCourseIdSessionAttributeAsInstructor_action.jsp" method="post">
                                        <input type="text" name="courseId" value=<%=courseId%> style="display: none;">
                                        <button type="submit"><img src="../Images/eye.png"></button>
                                    </form>
                                    
                                    <div class="comingSoonContainer" style="
                                    height: 1.5em;
                                    ">
                                        <button class="notYet" type="submit">
                                            <img src="../Images/edit-pencil.svg">
                                        </button>
                                        
                                        <p class="comingSoon" style="
                                        filter: brightness(80%);
                                        box-shadow: 0 0 5px grey;
                                        ">
                                            Coming soon!
                                        </p>
                                    </div>
                                    
                                    <form action="setCourseIdSessionAttributeAsInstructor_action.jsp" method="post" 
                                    onsubmit="openCourseChat(this)">
                                        <input type="text" name="courseId" value=<%=courseId%> style="display: none;">
                                        <button type="submit"><img src="../Images/chat-bubble-dots.svg"></button>
                                    </form>
                                    
                                    <button class="delete" onclick=openDeleteCourseConfirm(this)><img src="../Images/trash.svg"></button>
                                </div>
                            </div>
                    
                    <%
                        }

                        result.close();
                        preparedStmt.close();
                    }
                    catch(Exception E) {
                        out.println(E);
                    }
                    %>
                
                </div>

            </div>
    
        </section>

        <!-- display message if instructor has no courses -->
        <script>
            let checkLength = document.getElementsByClassName("instructorCoursePreview").length;
            let parent = document.getElementsByClassName("coursesList")[0];
            
            if(checkLength == 0) {
                parent.innerHTML = "<p class='bigDescription'>You have not created a course yet.</p>";
            }
        </script>
        
    </section>

    <script>
        // handle confirm course delete stuff

        let ref = document.getElementsByClassName("confirmDeleteCourse")[0];
        let courseIdElem = ref.getElementsByTagName("p")[0];
        let inputElem = ref.getElementsByTagName("input")[0];

        function hideConfirmDeleteCourse() {
            ref.style.display = "none";
        }

        function openDeleteCourseConfirm(elem) {
            let courseId = elem.parentNode.parentNode.children[0].innerText;
            inputElem.value = courseId;
            
            courseIdElem.innerText = "Are you sure you want to delete " + courseId + "?";

            ref.style.display = "flex";
        }
        
        // handle go to course chat

        function openCourseChat(elem) {
            // get course name
            let courseId = elem.parentNode.parentNode.children[0].innerText;
            courseId += " (Student View)";

            // set session attributes so that courseViewAsInstructor.jsp will load into comments tab
            localStorage.setItem("courseViewCourseId", courseId);
            localStorage.setItem("courseViewTab", "comments");

            return true;
        }
    </script>
  </body>
</html>
