<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="../Styles/styles.css">
    <title>Tarpaulin</title>
  <link rel="icon" type="image/x-icon" href="../Images/Tarpaulin_Logo_Alt_2.png">
</head>
  <body class="landingBody">  
    <script src="../Scripts/userTypeLocalStorage.js"></script>

    <script>
      let check = localStorage.getItem("userType");
      
      if(check == "student" || check == "instructor") {
        window.open("../../index.jsp", "_self");
      }
    </script>

    <script src="../Scripts/headerGuest.js"></script>

    <section class="mainContainer mainContainerHorizontal">
      <div class="landingIntro">
        <p class="giantTitle">Tarpaulin</p>

        <p class="bigDescription">Gain access to a large array of educational content that can be accessed at anytime, and from anywhere.</p>

        <button class="buttonNormal" onclick="window.open('learnMore.jsp', '_self')">Learn More</button>
      </div>

      <div class="landingIconCollage">
        <div>
          <img draggable="false" src="../Images/exchange-rate.png">
          <img draggable="false" src="../Images/online-learning.png">
        </div>

        <div>
          <img draggable="false" src="../Images/knowledge.png">
          <img draggable="false" src="../Images/webinar.png">
        </div>

        <div>
          <img draggable="false" src="../Images/communities.png">
          <img draggable="false" src="../Images/chat.png">
        </div>

        <div>
          <img draggable="false" src="../Images/best-customer-experience.png">
          <img draggable="false" src="../Images/conversation.png">
        </div>
      </div>
    </section>
  </body>
</html>
