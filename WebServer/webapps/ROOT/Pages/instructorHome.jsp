<%@include file="../userAuth.jsp"%>

<%@include file="../DBconnection.jsp"%>

<%@page import="
    java.sql.*, 
    oracle.jdbc.*
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

    <section class="mainContainer">
        
        <div class="studentWelcome title">
            <p>Welcome back, </p>
            
            <%
            String username = "username";

            try{
                username = (String) session.getAttribute("username");
            }
            catch(Exception E) {
                username = "username";
            }
            %>
            <p id="username"><%=username%></p>
            <p>!</p>
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
                        <button class="buttonNormal" type="submit" onclick="let a = 5;">Yes</button>
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
                                <p>students</p>
                            </div>

                            <div class="controls">
                                <a href="courseView.jsp">View</a>
                                
                                <!-- TODO later -->
                                <a href="editCourse.jsp">Edit</a>
                                
                                <!-- TODO later -->
                                <a href="instructorHome.jsp">QBoard</a>
                                
                                <a class="delete" onclick=openDeleteCourseConfirm(this)>Delete</a>
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

    <!-- handle confirm course delete stuff -->
    <script>
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
    </script>
  </body>
</html>
