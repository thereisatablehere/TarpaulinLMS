<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="../Styles/style.css">
    <title>Tarpaulin - Your Joined Communities</title>
  </head>
  <body class="studentHomeBody">
    <script src="../Scripts/userTypeLocalStorage.js"></script>
    <script src="../Scripts/userTypeLocalStorageAuthPageCheck.js"></script>
    <script src="../Scripts/header.js"></script>

    <img class="openNavbar" src="../Images/menu.svg">

    <script src="../Scripts/loadSidebar.js"></script>

    <form action="profile_action.jsp" method="post" class="mainContainer profile">
        <div class="top">
            <img draggable="false" class="profileIcon" src="../Images/user-solid-circle.svg">
            <div>
                <p>Your Profile</p>
                <p>View or update your account information</p>
            </div>
        </div>

        <section class="profileSettings">

            <div>
                <p>Username</p>
                <input name="username" type="text" placeholder="Username" value="aUser">
            </div>

            <div>
                <p>First Name</p>
                <input name="fname" type="text" placeholder="First" value="First">
            </div>

            <div>
                <p>Last Name</p>
                <input name="lname" type="text" placeholder="Last" value="Last">
            </div>

            <div>
                <p>Email</p>
                <input name="email" type="text" placeholder="Email" value="your.email.csbsju.edu">
            </div>

            <div>
                <p>Password</p>
                <img class="passwordToggleIcon" src="../Images/eye.png" onclick="
                    let input = document.getElementById('password');
                    
                    if(input.type == 'password') {
                        this.src = '../Images/view.png';
                        input.type = 'text';
                    }
                    else{
                        this.src = '../Images/eye.png';
                        input.type = 'password';
                    }
                ">
                <input name="password" type="password" id="password" placeholder="password" value="password12345">
            </div>
	<button type="submit">
		Update Profile
	</button>
        </section>
    </form>

    <script src="../Scripts/navbarToggle.js"></script>

  </body>
</html>


