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

String course_id = "";

try{
    course_id = (String) session.getAttribute("courseId");
}
catch(Exception E) {
    course_id = "Course";
}

String lecture_id = "";

try{
    lecture_id = (String) session.getAttribute("lectureId");
}
catch(Exception E) {
    lecture_id = "Lecture";
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="../Styles/styles.css">
    <title>Tarpaulin - View Lecture</title>
    <link rel="icon" type="image/x-icon" href="../Images/Tarpaulin_Logo_Alt_2.png">
</head>
<body class="studentHomeBody">
<script src="../Scripts/headerLoggedIn.js"></script>

<img class="openNavbar" src="../Images/menu.svg">

<%
// don't load sidebar if user is an instructor

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

if(student) {
%>
    <script src="../Scripts/loadSidebar.js"></script>
<%
}
%>

<section class="mainContainer watchLecture">
    <%
    if(student) {
    %>
        <button class="buttonAccent backNav" onclick="window.open('courseView.jsp', '_self')">
            <img src="../Images/cheveron-left.svg"><p>Go Back</p>
        </button>
    <%
    }
    else {
    %>
        <button class="buttonAccent backNav" onclick="window.open('courseViewAsInstructor.jsp', '_self')">
            <img src="../Images/cheveron-left.svg"><p>Go Back</p>
        </button>
    <%
    }
    %>
    
    <p class="bigTitle"><%=lecture_id%></p>

    <video width="320" height="180" controls></video>

    <%
    String getLink = 
        "SELECT url" + "\n" + 
        "FROM TARP_LECTURE" + "\n" + 
        "WHERE course_id='" + course_id + "' AND lecture_id='" + lecture_id + "'";
        
    PreparedStatement getLinkStmt = con.prepareStatement(getLink);
    
    ResultSet res_link = getLinkStmt.executeQuery();
    
    while(res_link.next()) { 
        String link = res_link.getString(1);
    %>
        <a class="link" href=<%=link%>>(<%=link%>)</a>
    <%
    }
    
    String isWatched = 
        "SELECT *" + "\n" + 
        "FROM TARP_WATCHES" + "\n" + 
        "WHERE course_id='" + course_id + "' AND lecture_id='" + lecture_id + "' AND username='" + username + "'";
        
    PreparedStatement getWatchedStmt = con.prepareStatement(isWatched);
    
    ResultSet res_watched = getWatchedStmt.executeQuery();
    
    %>

    <form action="watchLecture_action.jsp" method="post">
        <input type="text" name="courseId" value=<%="\"" + course_id + "\""%> style="display: none;">
        <input type="text" name="lectureId" value=<%="\"" + lecture_id + "\""%> style="display: none;">
        <input type="text" name="username" value=<%="\"" + username + "\""%> style="display: none;">
        <%if(res_watched.next()) { %>
            <button type="button" class="buttonNormal alreadyWatched">Already Watched</button>
        <%}else{%>
            <%
            if(student) {
            %>
            <button type="submit" class="buttonNormal markAsWatched">
                <img src="../Images/checkmark.svg">
                <p>Mark As Watched</p>
            </button>
            <%
            }
            %>
        <%}%>
    </form>

    </section>

</section>

<script src="../Scripts/navbarToggle.js"></script>
</body>
</html>

