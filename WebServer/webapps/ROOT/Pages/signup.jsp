<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="../Styles/style.css">
    <title>Tarpaulin - Login</title>
  <link rel="icon" type="image/x-icon" href="../Images/Tarpaulin_Logo_Alt_2.png">
</head>
  <body class="loginBody">
    <script src="../Scripts/userTypeLocalStorage.js"></script>
    <script src="../Scripts/header.js"></script>
    
    <section class="mainContainer login">
        <p class="bigTitle">Let's Get Started!</p>

        <label for="name">Full Name</label>
        <input type="text" id="name" placeholder="name">

        <label for="username">Username</label>
        <input type="text" id="username" placeholder="username">

        <label for="email">Email</label>
        <input type="text" id="email" placeholder="email">
        
        <label for="password">Password</label>
        <img class="signupEye" src="../Images/eye.png" onclick="
            let input = document.getElementsByTagName('input')[3];
            if(input.type == 'password') {
              this.src = '../Images/view.png';
              input.type = 'text';
            }
            else{
              this.src = '../Images/eye.png';
              input.type = 'password';
            }
        ">
        <input type="password" id="password" placeholder="password">
        
        <button class="buttonAccent">Sign Up</button>
    </section>
  </body>
</html>