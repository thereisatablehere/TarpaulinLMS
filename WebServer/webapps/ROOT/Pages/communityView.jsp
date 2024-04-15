<%@include file="../userAuth.jsp"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="../Styles/styles.css">
    <title>Tarpaulin - View a Community</title>
  <link rel="icon" type="image/x-icon" href="../Images/Tarpaulin_Logo_Alt_2.png">
</head>
  <body class="studentHomeBody">
    <script src="../Scripts/headerLoggedIn.js"></script>

    <img class="openNavbar" src="../Images/menu.svg">

    <script src="../Scripts/loadSidebar.js"></script>

    <section class="mainContainer">
      
      <p class="bigTitle communityViewTitle">The Best Community on Tarp</p>

        <section class="communityView">
            
            <p class="bigDescription">This is a great community where any student is invited to compete with one another to see who is the best student.</p>

            <div style="margin-top: 0.5em;">
                <p>123</p>
                <p>Members</p>
            </div>

            <div style="margin-bottom: 0.2em;">
                <p>Your Rank:</p>
                <p>2nd</p>
            </div>

            <div class="controls">
                <button class="buttonNormal">Invite Another Student</button>
                <button class="buttonAccent">Leave Community</button>
            </div>

            <p class="title">Leaderboard</p>

            <div class="leaderboard">
                <div>
                    <p>1.</p>
                    <p>userHere</p>
                </div>
                <div>
                    <p>2.</p>
                    <p class="you">You</p>
                </div>
                <div>
                    <p>3.</p>
                    <p>anotheruser</p>
                </div>
                <div>
                    <p>4.</p>
                    <p>sopmeoneElse</p>
                </div>
                <div>
                    <p>5.</p>
                    <p>person</p>
                </div>
            </div>

        </section>

    </section>

    <script src="../Scripts/navbarToggle.js"></script>
  </body>
</html>