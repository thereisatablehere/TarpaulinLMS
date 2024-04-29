<%@include file="../userAuth.jsp"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="../Styles/styles.css">
    <title>Tarpaulin - Create Community</title>
  <link rel="icon" type="image/x-icon" href="../Images/Tarpaulin_Logo_Alt_2.png">
</head>
  <body class="studentHomeBody">
    <script src="../Scripts/headerLoggedIn.js"></script>

    <img class="openNavbar" src="../Images/menu.svg">
    
    <script src="../Scripts/loadSidebar.js"></script>

    <section class="mainContainer">

        <%
        Boolean communityCreateFailed = false;

        try{
            communityCreateFailed = Boolean.parseBoolean(
            (String) session.getAttribute("failedToCreateCommunity")
            );
        }
        catch(Exception E) {
            communityCreateFailed = false;
        }

        if(communityCreateFailed) {
            session.setAttribute("failedToCreateCommunity", "false");
        %>
            <!-- inline CSS becase student home error message 
            should be further down than instructor -->
            <div id="createCourseFailedMessage" style="
            margin-top: -28em;
            width: 25em;
            transform: none;
            ">
                <img class="errorIcon" src="../Images/exclamation-outline.svg">
                <p>Failed to create community</p>
                <img class="closeIcon" src="../Images/close.svg" 
                onclick="this.parentNode.style.display='none'">
            </div>
        <%
        }
        %>

        <p class="bigTitle" style="text-align: center;">Create a Community</p>

        <!-- not a form because handled by JS so can get date -->
        <section class="createCommunity">
            <div>
                <p>Name</p>
                <input id="name" type="text" placeholder="Name">
            </div>

            <p>Description</p>
            <input id="description" type="text" placeholder="Description">

            <button class="buttonAccent" onclick="submitForm()">Create</button>
        </section>

    </section>

    <script src="../Scripts/navbarToggle.js"></script>

    <script>
        let failed = false;

        function submitForm() {
            failed = false;
            let form = document.createElement("form");
            form.action="createCommunity_action.jsp";
            form.method="post";

            let nameInput = document.createElement("input");
            nameInput.name = "name";
            let nameInputed = document.getElementById("name").value;
            
            if(nameInputed.length == 0) {
                failed = true;
            }

            if(nameInputed.includes("'")) {
                failed = true;
            }
            
            nameInput.value = nameInputed;
            form.appendChild(nameInput);

            let descriptionInput = document.createElement("input");
            descriptionInput.name = "description";
            let descriptionInputed = document.getElementById("description").value;

            if(descriptionInputed.length == 0) {
                failed = true;
            }

            descriptionInput.value = descriptionInputed.replace("'", "''");
            console.log(descriptionInput.value)
            form.appendChild(descriptionInput);

            let dateInput = document.createElement("input");
            dateInput.name = "date";
            let date = new Date();
            let fullYear = date.getFullYear();
            let dateFormatted = 
                fullYear.toString() + "-" +
                (date.getMonth() + 1) + "-" + 
                date.getDate();            
            dateInput.value = dateFormatted;
            form.appendChild(dateInput);

            form.style.display = "none";
            document.body.appendChild(form);
            
            
            if(failed) {
                // ensure that there will be a SQL error
                nameInput.value = null;
            }
            form.submit();
        }
    </script>
  </body>
</html>