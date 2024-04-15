<%@include file="../userAuth.jsp"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="../Styles/styles.css">
    <title>Tarpaulin - Your Joined Communities</title>
  <link rel="icon" type="image/x-icon" href="../Images/Tarpaulin_Logo_Alt_2.png">
</head>
  <body class="studentHomeBody">
    <script src="../Scripts/headerLoggedIn.js"></script>

    <img class="openNavbar" src="../Images/menu.svg">

    <script src="../Scripts/loadSidebar.js"></script>

    <section class="mainContainer">
      
      <p class="bigTitle">Your Joined Communities</p>

        <section class="communitiesListContainer">
            
            <div class="community">
                <p class="title">Some Community</p>

                <p>The description would go here.</p>
                
                <div>
                    <p>Your Rank:</p>
                    <p>1st</p>
                </div>

                <div class="controls">
                    <a class="buttonNormal" href="communityView.jsp">View</a>
                </div>
            </div>

            <div class="community">
                <p class="title">Another Community</p>

                <p>Some random description is placed here instead of what the actual description of this community would actually be.</p>
                
                <div>
                    <p>Your Rank:</p>
                    <p>3rd</p>
                </div>

                <div class="controls">
                    <a class="buttonNormal" href="communityView.jsp">View</a>
                </div>
            </div>

            <div class="community">
                <p class="title">A Community</p>
                
                <div>
                    <p>Your Rank:</p>
                    <p>10th</p>
                </div>

                <div class="controls">
                    <a class="buttonNormal" href="communityView.jsp">View</a>
                </div>
            </div>

        </section>

    </section>

    <script src="../Scripts/navbarToggle.js"></script>
  </body>
</html>