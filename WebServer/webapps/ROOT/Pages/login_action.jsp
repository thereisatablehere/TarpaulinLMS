<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="../Styles/style.css">
    <title>Tarpaulin - Login</title>
  </head>
  <body class="loginBody">
    <script src="../Scripts/userTypeLocalStorage.js"></script>
    <script src="../Scripts/header.js"></script>
    
    <form class="mainContainer login" action="login_action.jsp" method="post">
        <p class="bigTitle">Welcome Back!</p>
        
        <label for="username">username</label>
        <input name="username" type="text" id="username" placeholder="username">
        
        <label for="password">Password</label>
        <img src="../Images/eye.png" onclick="
            let input = document.getElementsByTagName('input')[1];
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
        
        <button type="submit" class="buttonAccent">Login</button>
    </form>
  </body>
</html>