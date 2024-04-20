<%@include file="../userAuth.jsp"%>

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
    <title>Tarpaulin - Student Home</title>
  <link rel="icon" type="image/x-icon" href="../Images/Tarpaulin_Logo_Alt_2.png">
</head>
  <body class="studentHomeBody">
    <script src="../Scripts/headerLoggedIn.js"></script>
    
    <script src="../Scripts/loadSidebar.js"></script>

    <section class="mainContainerLeft">
      
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
      
      <section class="studentHomeMainContainer">

        <div class="listContainer">

          <p class="bigTitle">My Courses</p>

          <div id="leftList" class="list coursesList">

            <%
            try {
                String query = 
                "SELECT course_id " + "\n" + 
                "FROM TARP_ENROLLS" + "\n" + 
                "WHERE username='" + username + "'"; 
                PreparedStatement preparedStmt = con.prepareStatement(query);
                
                ResultSet result = preparedStmt.executeQuery();
                
                while(result.next()) {
                    String courseId = result.getString(1);

                    String queryInner = 
                    "SELECT username " + "\n" + 
                    "FROM TARP_COURSE" + "\n" + 
                    "WHERE course_id='" + courseId + "'"; 
                    PreparedStatement preparedStmtInner = con.prepareStatement(queryInner);
                    
                    ResultSet resultInner = preparedStmtInner.executeQuery();

                    String instructorName = "";
                    while(resultInner.next()) {
                      instructorName = resultInner.getString(1);
                      break;
                    }

                    resultInner.close();
                    preparedStmtInner.close();
            %>

                    <div class="preview">

                      <form action="setCourseIdSessionAttribute_action.jsp" method="post">
                        
                        <input type="text" name="courseId" value=<%=courseId%> style="display: none;">
                        
                        <button type="submit" href="courseView.jsp" class="name"><%=courseId%></button>
                        <p>by</p>
                        <p class="instructorName"><%=instructorName%></p>
                      </form>

                      <!-- extra course info - maybe implement later, but for now dont include -->
                      <!--
                      <div>
                        <p>Current lecture:</p>
                        <p>You have not started a lecture yet.</p>
                      </div>

                      <div>
                        <p>Last test:</p>
                        <p>You have not taken a test yet.</p>
                      </div>
                    </div>
                    -->

                    </div>

            <%
                }
                result.close();
                preparedStmt.close();
              }
              catch(Exception e) {
                out.println(e);
              }
            %>

          </div>

        </div>

        <div class="listContainer">

          <p class="bigTitle communityNameTitle">My Communitites</p>
  
          <div class="list communitiesList">
          
            <%
            try {
              String query = 
              "SELECT community_id " + "\n" + 
              "FROM TARP_JOINED_BY" + "\n" + 
              "WHERE username='" + username + "'"; 
              PreparedStatement preparedStmt = con.prepareStatement(query);
              
              ResultSet result = preparedStmt.executeQuery();
              
              while(result.next()) {
                String communityId = result.getString(1);

                String queryInner = 
                  "SELECT num_students " + "\n" + 
                  "FROM TARP_COMMUNITY" + "\n" + 
                  "WHERE comm_id='" + communityId + "'"; 
                  PreparedStatement preparedStmtInner = con.prepareStatement(queryInner);
                  
                  ResultSet resultInner = preparedStmtInner.executeQuery();

                  String size = "";
                  while(resultInner.next()) {
                    size = resultInner.getString(1);
                    break;
                  }

                  String studentsText = "student";
                  if(!(size.equals("1"))) {
                    studentsText += "s";
                  }

                  resultInner.close();
                  preparedStmtInner.close();
            %>

                <form class="preview" action="setCommunityIdSessionAttribute_action.jsp" method="post">

                  <!-- TODO redirect -->
                  <button class="name" type="submit"><%=communityId%></button>
                    <input type="text" name="communityId" value=<%=communityId%> style="display: none;">
                    
                    <div>
                      <p><%=size%></p>
                      <p><%=studentsText%></p>
                    </div>
                </form>

            <%
              }
              result.close();
              preparedStmt.close();
            }
            catch(Exception e) {
              out.println(e);
            }
            %>

          </div>
  
        </div>

      </section>

    </section>

    <!-- display message if courses or communites is empty -->
    <script>
        // courses
        let checkLength = document.getElementsByClassName("coursesList")[0].children.length;
        let parent = document.getElementsByClassName("coursesList")[0];
        
        if(checkLength == 0) {
            parent.innerHTML = "<p class='bigDescription'>You have not enrolled in a course yet.</p>";
        }

        checkLength = document.getElementsByClassName("communitiesList")[0].children.length;
        parent = document.getElementsByClassName("communitiesList")[0];
        
        // communities
        if(checkLength == 0) {
            parent.innerHTML = "<p class='bigDescription'>You have not joined a community yet.</p>";
        }
    </script>

  </body>
</html>