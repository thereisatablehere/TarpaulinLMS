<%@include file="../userAuth.jsp"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="../Styles/style.css">
    <title>Tarpaulin - Student Home</title>
  </head>
  <body class="studentHomeBody">
    <script src="../Scripts/userTypeLocalStorage.js"></script>
    <script src="../Scripts/userTypeLocalStorageAuthPageCheck.js"></script>
    <script src="../Scripts/header.js"></script>

    <img class="openNavbar" src="../Images/menu.svg">
    
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
        <p id=<%=username%>><%=username%></p>
        
        <p>!</p>
      </div>
      
      <section class="studentHomeMainContainer">

        <div class="listContainer">

          <p class="bigTitle">My Courses</p>

          <div class="list coursesList">
            <div class="preview">
              <div>
                <a href="courseView.jsp" class="name">Sample Course</a>
                <p>by</p>
                <p class="instructorName">Instructor name</p>
              </div>

              <div>
                <p>Current lecture:</p>
                <a href="courseView.jsp">Some Learning Thing</a>
              </div>

              <div>
                <p>Last test:</p>
                <a href="courseView.jsp">Test 1</a>
              </div>
            </div>

            <div class="preview">
              <div>
                <a href="studentHome.jsp" class="name">Another Course</a>
                <p>by</p>
                <p class="instructorName">Instructor name</p>
              </div>

              <div>
                <p>Current lecture:</p>
                <p>You have not started a lecture yet.</p>
              </div>

              <div>
                <p>Last test:</p>
                <p>You have not taken a test yet.</p>
              </div>
            </div>

            <div class="preview">
              <div>
                <a href="studentHome.jsp" class="name">A Course</a>
                <p>by</p>
                <p class="instructorName">Instructor name</p>
              </div>

              <div>
                <p>Current lecture:</p>
                <a href="studentHome.jsp">Some Lecture Here</a>
              </div>

              <div>
                <p>Last test:</p>
                <a href="studentHome.jsp">A Random Test Part 3</a>
              </div>
            </div>
          </div>

        </div>

        <div class="listContainer">

          <p class="bigTitle communityNameTitle">My Communitites</p>
  
          <div class="list communitiesList">
            <div class="preview">
              <a href="communityView.jsp" class="name">Some Community</a>
                <div>
                  <p>2</p>
                  <p>students</p>
                </div>
            </div>

            <div class="preview">
              <a href="communityView.jsp" class="name">Random Community</a>
                <div>
                  <p>34</p>
                  <p>students</p>
                </div>
            </div>

            <div class="preview">
              <a href="communityView.jsp" class="name">Another Community</a>
                <div>
                  <p>21</p>
                  <p>students</p>
                </div>
            </div>
          </div>
  
        </div>

      </section>

    </section>
  </body>
</html>