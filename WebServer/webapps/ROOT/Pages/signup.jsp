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
    <title>Tarpaulin - Signup</title>
  <link rel="icon" type="image/x-icon" href="../Images/Tarpaulin_Logo_Alt_2.png">
</head>
  <body class="loginBody">
    <script src="../Scripts/headerGuest.js"></script>
    
    <form class="mainContainer login" action="signup_action.jsp" method="post">
        <p class="bigTitle">Let's Get Started!</p>

        <label for="firstName">First Name</label>
        <input name="fname" type="text" id="firstName" placeholder="first">
        
        <label for="lastName">Last Name</label>
        <input name="lname" type="text" id="lastName" placeholder="last">

        <label for="username">Username</label>
        <input name="username" type="text" id="username" placeholder="username">
        
        <label>User Type</label>
        <div id="userTypeContainer">
          <div>
            <input type="radio" id="student" name="userType" value="S">
            <label for="student">Student</label><br>
          </div>

          <div>
            <input type="radio" id="instructor" name="userType" value="I">
            <label for="instructor">Instructor</label><br>
          </div>
        </div>
        
        
        <label for="password">Password</label>
        <img class="signupEye" src="../Images/eye.png" onclick="
            let input = document.getElementsByTagName('input')[5];
            if(input.type == 'password') {
              this.src = '../Images/view.png';
              input.type = 'text';
            }
            else{
              this.src = '../Images/eye.png';
              input.type = 'password';
            }
        ">
        <input name="password" type="password" id="password" placeholder="password">
        
        <% String a = "Sign"; %>
        <button class="buttonAccent" type="submit">Sign Up</button>
    </form>

  </body>
</html>