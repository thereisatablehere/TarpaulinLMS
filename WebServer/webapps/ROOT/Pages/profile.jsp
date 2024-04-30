<%@include file="../userAuth.jsp"%>
<%@include file="../DBconnection.jsp"%>

<%@page import="
    java.sql.*, 
    oracle.jdbc.*
"%>

<%
String username = "";

try{
    username = (String) session.getAttribute("username");
}
catch(Exception E) {
    username = "";
}
%>

<%
boolean student = true;
try {
    String queryString = 
    "SELECT f_name" + "\n" + 
    "FROM TARP_INSTRUCTOR" + "\n" + 
    "WHERE username='" + username + "'";
    
    PreparedStatement preparedStmt = con.prepareStatement(queryString);

    ResultSet result = preparedStmt.executeQuery();

    student = !(result.next());
}
catch(Exception E) {
    student = true;
}
%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="../Styles/styles.css">
    <title>Tarpaulin - Profile</title>
  <link rel="icon" type="image/x-icon" href="../Images/Tarpaulin_Logo_Alt_2.png">
</head>
  <body class="studentHomeBody">
    <script src="../Scripts/headerLoggedIn.js"></script>

    <img class="openNavbar" src="../Images/menu.svg">

    <%
    if(student) {
    %>
        <script src="../Scripts/loadSidebar.js"></script>
    <%
    }
    %>

    <form class="mainContainer profile" action="profile_action.jsp" method="post">
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
                
                <div class="comingSoonContainer">
                    <input class="nonedit" readonly name="username" type="text" placeholder="Username" value=<%=username%>>
                    <p class="comingSoon">Being able to edit coming soon!</p>
                </div>
            </div>

            <div>
                <p>First Name</p>
                
                <%
                String firstName = "firstName";

                try {
                    String from = "";

                    if(((int) session.getAttribute("userType")) == 1) {
                        from = "instructor";
                    }
                    else if(((int) session.getAttribute("userType")) == 2) {
                        from = "student";
                    }

                    String queryString = 
                        "SELECT F_NAME" + "\n" + 
                        "FROM TARP_" + from + "\n" + 
                        "WHERE USERNAME='" + username + "'";
                    
                    PreparedStatement preparedStmt = con.prepareStatement(queryString);

                    ResultSet result = preparedStmt.executeQuery();

                    while(result.next()) {
                        firstName = result.getString(1);
                        break;
                    }

                    result.close();
                    preparedStmt.close();
                }
                catch(Exception E) {
                    firstName = "exception";
                }
                %>
                
                <div class="comingSoonContainer">
                    <input class="nonedit" readonly name="fname" type="text" placeholder="First" value=<%=firstName%>>
                    <p class="comingSoon">Being able to edit coming soon!</p>
                </div>
            </div>

            <div>
                <p>Last Name</p>

                <%
                String lastName = "lastName";

                try {
                    String from = "";

                    if(((int) session.getAttribute("userType")) == 1) {
                        from = "instructor";
                    }
                    else if(((int) session.getAttribute("userType")) == 2) {
                        from = "student";
                    }

                    String queryString = 
                        "SELECT L_NAME" + "\n" + 
                        "FROM TARP_" + from + "\n" + 
                        "WHERE USERNAME='" + username + "'";
                    
                    PreparedStatement preparedStmt = con.prepareStatement(queryString);

                    ResultSet result = preparedStmt.executeQuery();

                    while(result.next()) {
                        lastName = result.getString(1);
                        break;
                    }

                    result.close();
                    preparedStmt.close();
                }
                catch(Exception E) {
                    lastName = "exception";
                }
                %>
                
                <div class="comingSoonContainer">
                    <input class="nonedit" readonly name="lname" type="text" placeholder="Last" value=<%=lastName%>>
                    <p class="comingSoon">Being able to edit coming soon!</p>
                </div>
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

                <%
                String password = "password";

                try {
                    String from = "";

                    if(((int) session.getAttribute("userType")) == 1) {
                        from = "instructor";
                    }
                    else if(((int) session.getAttribute("userType")) == 2) {
                        from = "student";
                    }

                    String queryString = 
                        "SELECT PASSWORD" + "\n" + 
                        "FROM TARP_" + from + "\n" + 
                        "WHERE USERNAME='" + username + "'";
                    
                    PreparedStatement preparedStmt = con.prepareStatement(queryString);

                    ResultSet result = preparedStmt.executeQuery();

                    while(result.next()) {
                        password = result.getString(1);
                        break;
                    }

                    result.close();
                    preparedStmt.close();
                }
                catch(Exception E) {
                    password = "exception";
                }
                %>
                <input name="password" type="password" id="password" placeholder="password" value=<%=password%>>
            </div>
	        
            <div style="
                border-top: none;
                display: flex;
                flex-direction: row;
                justify-content: center;
                margin: 0;
            ">
                <button class="buttonNormal" type="submit" style="
                    margin: 0;
                    margin-left: 0;
                "> Update Profile</button>
            </div>
        </section>
    </form>

    <script src="../Scripts/navbarToggle.js"></script>

  </body>
</html>


