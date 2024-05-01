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
    <title>Tarpaulin - Search For a Course</title>
  <link rel="icon" type="image/x-icon" href="../Images/Tarpaulin_Logo_Alt_2.png">
</head>
  <body class="studentHomeBody">
    <script src="../Scripts/headerLoggedIn.js"></script>

    <img class="openNavbar" src="../Images/menu.svg">

    <script src="../Scripts/loadSidebar.js"></script>

    <section class="mainContainer mainContainerLeft courseSearch">
       <form method="post" action="courseSearchResults.jsp" onsubmit="setLocalStorage()">
        <section class="search">
            <p class="title">Find a New Course to Enroll In</p>

            <p class="bigDescription">Fill out any number of parameters</p>
            <p class="notice">(leave blank to browse all courses)</p>

            <div>
                <p>Course Name</p>
                <input id="courseInput" type="text" name="coursename" id="coursename" placeholder="Course">
            </div>

            <div>
                <p>Created By</p>
                <input id="createdInput" type="text" name="instructor" id="instructor" placeholder="Instructor">
            </div>

            <button class="buttonAccent" type="submit">search</button>
        </section>
        </form>
    </section>

    <script>
        function setLocalStorage() {
            localStorage.setItem("courseInputValue", document.getElementById("courseInput").value);
            localStorage.setItem("createdInputValue", document.getElementById("createdInput").value);
        }

        if(localStorage.getItem("goingBackToSearch") == "true") {
            localStorage.setItem("goingBackToSearch", "false");

            document.getElementById("courseInput").value = localStorage.getItem("courseInputValue");
            document.getElementById("createdInput").value = localStorage.getItem("createdInputValue");
        }
    </script>
  </body>
</html>