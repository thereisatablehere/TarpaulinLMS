<%@include file="../DBconnection.jsp"%>

<%@page import="
    java.sql.*, 
    oracle.jdbc.*
"%>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");

String userTypeCheck = "";
String usernameOutputCheck = "";

// first check if student

PreparedStatement preparedStmt = con.prepareStatement(
    "SELECT USERNAME, PASSWORD " + "\n" +
    "FROM TARP_STUDENT"
);


ResultSet result = preparedStmt.executeQuery();

while (result.next()) {
    String usernameCheck = result.getString(1);
    String passwordCheck = result.getString(2);

    if(usernameCheck.equals(username) && passwordCheck.equals(passwordCheck)) {
        userTypeCheck = "student";
        usernameOutputCheck = usernameCheck;
        break;
    }
}

result.close();
preparedStmt.close();

// check if instructor, if not student
if(userTypeCheck.length() == 0) {
    preparedStmt = con.prepareStatement(
        "SELECT USERNAME, PASSWORD " + "\n" +
        "FROM TARP_INSTRUCTOR"
    );


    result = preparedStmt.executeQuery();

    while (result.next()) {
        String usernameCheck = result.getString(1);
        String passwordCheck = result.getString(2);

        if(usernameCheck.equals(username) && passwordCheck.equals(passwordCheck)) {
            userTypeCheck = "instructor";
            usernameOutputCheck = usernameCheck;
            break;
        }
    }
}
%>

<p id="output" style="display: none;"><%=userTypeCheck%></p>
<p id="username" style="display: none;"><%=usernameOutputCheck%></p>

<script src="../Scripts/userTypeLocalStorage.js"></script>
<script>
    let userTypeCheck = document.getElementById("output").innerText;

    if(userTypeCheck.length > 0) {
        localStorage.setItem("username", document.getElementById("username").innerText);

        setUserType(userTypeCheck);
    }
    else {
        window.open("login.jsp", "_self");
    }
</script>

