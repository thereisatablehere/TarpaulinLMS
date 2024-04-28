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

        <p class="bigTitle" style="text-align: center;">Create a Community</p>

        <!-- not a form because handled by JS so can get date -->
        <section class="allGradeReportContainer createCommunity">
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
        function submitForm() {
            let form = document.createElement("form");
            form.action="createCommunity_action.jsp";
            form.method="post";

            let nameInput = document.createElement("input");
            nameInput.name = "name";
            nameInput.value = document.getElementById("name").value;
            form.appendChild(nameInput);

            let descriptionInput = document.createElement("input");
            descriptionInput.name = "description";
            descriptionInput.value = document.getElementById("description").value;
            form.appendChild(descriptionInput);

            let dateInput = document.createElement("input");
            dateInput.name = "date";
            
            let date = new Date();
            let months = [
                "jan", "feb", "mar", "apr", 
                "may", "jun", "jul", "aug", 
                "sep", "oct", "nov", "dec" 
            ];
            let fullYear = date.getFullYear();
            
            // DD - MM - YY
            let dateFormatted = 
                date.getDate() + "-" + 
                months[date.getMonth()] + "-" + 
                // only get the last 2 digits of the year
                (fullYear.toString()).substring(2);
            
            dateInput.value = dateFormatted;
            form.appendChild(dateInput);

            form.style.display = "none";
            document.body.appendChild(form);

            form.submit();
        }
    </script>
  </body>
</html>