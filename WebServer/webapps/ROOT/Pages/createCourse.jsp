<%@include file="../userAuth.jsp"%>

<%@include file="../DBconnection.jsp"%>

<%@page import="
    java.sql.*, 
    oracle.jdbc.*
"%>

<%
session.setAttribute("failedToCreateCourse", "false");
%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="../Styles/styles.css">
    <title>Tarpaulin - Create a Course</title>
  <link rel="icon" type="image/x-icon" href="../Images/Tarpaulin_Logo_Alt_2.png">
</head>
  <body class="instructorHomeBody">
    <script src="../Scripts/headerLoggedIn.js"></script>

    <section class="mainContainer">

        <div id="errorPopup" class="createCourseErrorPopup">
            <p>Error: make sure input fields are not blank.</p>
        </div>
        
        <p class="title">Create a Course</p>

        <section class="createCourse">

            <div class="nameContainer">
                <p>Name</p>
                <input name="Name" type="text">
            </div>

            <div class="descriptionContainer">
                <p>Description</p>
                <input name="Description" type="text">
            </div>

            <button onclick="checkInputs()" class="buttonAccent">Create</button>

        </section>
        
    </section>

    <script>
        let inputs = document.getElementsByTagName("input");
        let nameInput = inputs[0];
        let descriptionInput = inputs[1];
        let errorPopupRef = document.getElementById("errorPopup");
        let op = 0;
        let interval;

        function checkInputs() {
            if(nameInput.value.length == 0 || descriptionInput.value.length == 0) {
                errorPopupRef.style.opacity = "0";
                errorPopupRef.style.display = "flex";
                
                op = 0;
                interval = window.setInterval(animateErrorPopup, 1000 / 60);
            }
            else {
                errorPopupRef.style.display = "none";

                let form = document.createElement("form");
                form.method = "post";
                form.action = "createCourse_action.jsp";

                let name = document.createElement("input");
                name.name = "name";
                name.value = nameInput.value;
                name.style.display = "none";

                let description = document.createElement("input");
                description.name = "description";
                description.value = descriptionInput.value;
                description.style.display = "none";

                form.appendChild(name);
                form.appendChild(description);

                document.body.appendChild(form);

                form.submit();
            }
        }

        function animateErrorPopup() {
            op += 0.035;
            errorPopupRef.style.opacity = op;

            if(op >= 1) {
                window.clearInterval(interval);
            }
        }
    </script>
  </body>
</html>