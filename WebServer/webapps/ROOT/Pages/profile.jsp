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
            <%
            String password = "password";
            int numChangedPassword = 0; // Initialize to 0

            try {
                String from = "";

                if(((int) session.getAttribute("userType")) == 1) {
                    from = "instructor";
                }
                else if(((int) session.getAttribute("userType")) == 2) {
                    from = "student";
                }

                String queryString = 
                    "SELECT PASSWORD, NUM_CHANGED_PASSWORD" + "\n" + // Retrieve num_changed_password from the database
                    "FROM TARP_" + from + "\n" + 
                    "WHERE USERNAME='" + username + "'";
                
                PreparedStatement preparedStmt = con.prepareStatement(queryString);

                ResultSet result = preparedStmt.executeQuery();

                while(result.next()) {
                    password = result.getString(1);
                    numChangedPassword = result.getInt(2); // Retrieve num_changed_password value
                    break;
                }

                result.close();
                preparedStmt.close();
            }
            catch(Exception E) {
                password = "exception";
            }
            %>
            <p>Changed <%=numChangedPassword%> time(s)</p>
            <input name="password" type="password" id="password" placeholder="password" value=<%=password%>>
        </div>
        <div>
            <%
            String oldpassword = "password";
            try {
                String from = "";

                if(((int) session.getAttribute("userType")) == 1) {
                    from = "instructor";
                }
                else if(((int) session.getAttribute("userType")) == 2) {
                    from = "student";
                }

                String queryString = 
                    "SELECT PASSWORD" + "\n" + // Retrieve num_changed_password from the database
                    "FROM TARP_" + from + "\n" +
                    " AS OF TIMESTAMP (SYSTIMESTAMP - INTERVAL '5' HOUR) " +
                    "WHERE USERNAME = ?";
                
                PreparedStatement preparedStmt2 = con.prepareStatement(queryString);
                preparedStmt2.setString(1, username);
                ResultSet result2 = preparedStmt2.executeQuery();

                while(result2.next()) {
                    oldpassword = result2.getString(1);
                    break;
                }

                result2.close();
                preparedStmt2.close();
            }
            catch(Exception E) {
                oldpassword = "exception";
            }
            %>
        <p>Password 5 hours ago: <%=oldpassword%></p>
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

