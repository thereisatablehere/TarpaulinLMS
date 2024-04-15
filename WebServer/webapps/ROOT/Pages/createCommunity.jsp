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

        <section class="allGradeReportContainer createCommunity">
            <div>
                <p>Name</p>
                <input type="text" placeholder="Name">
            </div>

            <p>Description</p>
            <input type="text" placeholder="Description">

            <button class="buttonAccent">Create</button>
        </section>

    </section>

    <script src="../Scripts/navbarToggle.js"></script>
  </body>
</html>