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
    out.println(E);
}

String courseId = "courseId";

try {
    courseId = (String) session.getAttribute("courseId");
}
catch(Exception E) {
    out.println(E);
}
%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="../Styles/styles.css">
    <title>Tarpaulin - Course Grades</title>
  <link rel="icon" type="image/x-icon" href="../Images/Tarpaulin_Logo_Alt_2.png">
</head>
  <body class="studentHomeBody">
    <script src="../Scripts/headerLoggedIn.js"></script>

    <img class="openNavbar" src="../Images/menu.svg">
    
    <script src="../Scripts/loadSidebar.js"></script>

    <section class="mainContainer">

        <p class="bigTitle"><%=courseId%> - Grades</p>

        <button class="buttonNormal" onclick='window.open("courseView.jsp", "_self")'>Back to Course</button>

        <section class="allGradeReportContainer">
            <%
            // get taken tests
            try {
                String query = 
                "SELECT test_id, score " + "\n" + 
                "FROM TARP_TAKEN_BY " + "\n" + 
                "WHERE course_id='" + courseId + "' AND" + "\n" + 
                "username='" + username + "'";

                PreparedStatement preparedStmt = con.prepareStatement(query);
                ResultSet result = preparedStmt.executeQuery();

                int total = 0;
                int count = 0;

                while(result.next()) {
                    ++count;
                    int score = result.getInt(2);
                    total += score;
            %>
                    <div>
                        <p><%=result.getString(1)%></p>
                        <p><%=score%>%</p>
                    </div>
            <%
                }

                // calculate total score
                if(count > 0) {
                    double totalScoreCalc = (total + 0.0) / count;
                    double totalScoreFormatted = Math.round(totalScoreCalc * 100.00) / 100.00;
            %>
                    <div class="total">
                        <p>Total:</p>
                        <p><%=totalScoreFormatted%>%</p>
                    </div>
            <%
                }
                else {
            %>
                    <div style="align-self: center; margin: 0;">
                        <p style="font-weight: bold;">No tests taken yet</p>
                    </div>
            <%
                }
            }
            catch(Exception E) {
                out.println(E);
            }
            %>
        </section>

    </section>

    <script src="../Scripts/navbarToggle.js"></script>
  </body>
</html>