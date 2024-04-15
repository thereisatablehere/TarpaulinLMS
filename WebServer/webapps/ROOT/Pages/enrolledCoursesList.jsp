<%@include file="../userAuth.jsp"%>

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
            <div class="course">
                <p class="bigDescription">CSCI 321</p>
                
                <div>
                    <p>by</p>
                    <p class="instructorName">Bruce the Prof</p>
                </div>

                <div>
                    <p>Progress:</p>
                    <p class="progress">50%</p>
                </div>

                <div class="controls">
                    <a href="courseView.jsp">View</a>
                    <a href="courseView.jsp">QBoard</a>
                </div>
            </div>

            <div class="course">
                <p class="bigDescription">HIST 111</p>
                
                <div>
                    <p>by</p>
                    <p class="instructorName">Doe Johnson</p>
                </div>

                <div>
                    <p>Progress:</p>
                    <p class="progress">30%</p>
                </div>

                <div class="controls">
                    <a href="courseView.jsp">View</a>
                    <a href="courseView.jsp">QBoard</a>
                </div>
            </div>

            <div class="course">
                <p class="bigDescription">CSCI 355</p>
                
                <div>
                    <p>by</p>
                    <p class="instructorName">John Doeson</p>
                </div>

                <div>
                    <p>Progress:</p>
                    <p class="progress">80%</p>
                </div>

                <div class="controls">
                    <a href="courseView.jsp">View</a>
                    <a href="courseView.jsp">QBoard</a>
                </div>
            </div>

        </section>

    </section>

    <script src="../Scripts/navbarToggle.js"></script>
  </body>
</html>