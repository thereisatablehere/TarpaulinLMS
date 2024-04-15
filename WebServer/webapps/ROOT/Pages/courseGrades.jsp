<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="../Styles/style.css">
    <title>Tarpaulin - Course Grades</title>
  </head>
  <body class="studentHomeBody">
    <script src="../Scripts/userTypeLocalStorage.js"></script>
    <script src="../Scripts/userTypeLocalStorageAuthPageCheck.js"></script>
    <script src="../Scripts/header.js"></script>

    <img class="openNavbar" src="../Images/menu.svg">
    
    <script src="../Scripts/loadSidebar.js"></script>

    <section class="mainContainer">

        <p class="bigTitle">CSCI 123 - Grades</p>

        <button class="buttonNormal" onclick='window.open("courseView.jsp", "_self")'>Back to Course</button>

        <section class="allGradeReportContainer">
            <div>
                <p>Total:</p>
                <p>92%</p>
            </div>
            
            <div>
                <p>Intro to Data Types Exam</p>
                <p>90%</p>
            </div>

            <div>
                <p>Data Types Part 2 Exam</p>
                <p>98%</p>
            </div>

            <div>
                <p>Unit 3 Exam</p>
                <p>100%</p>
            </div>
        </section>

    </section>

    <script src="../Scripts/navbarToggle.js"></script>
  </body>
</html>