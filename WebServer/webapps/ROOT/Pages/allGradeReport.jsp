<%@include file="../userAuth.jsp"%>

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
    <title>Tarpaulin - Cumulative Grade Report</title>
  <link rel="icon" type="image/x-icon" href="../Images/Tarpaulin_Logo_Alt_2.png">
</head>
  <body class="studentHomeBody">
    <script src="../Scripts/headerLoggedIn.js"></script>

    <img class="openNavbar" src="../Images/menu.svg">
    
    <script src="../Scripts/divloadSidebar.js"></script>

    <section class="mainContainer">

        <p class="bigTitle">Cumulative Grade Report</p>
        <%String username = (String)session.getAttribute("username");
        
        %>
        <section class="allGradeReportContainer">
            <div>
                <p>Class</p>
                <p>Percent Complete</p>
            </div>
            <% String query = "SELECT course_id FROM STUDENT_GRADES_VIEW WHERE username = ?";
            PreparedStatement prepStmt = con.prepareStatement(query);
            prepStmt.clearParameters();
            prepStmt.setString(1, username);
            ResultSet result = prepStmt.executeQuery();
            while (result.next()){
              String cname = result.getString(1);
              String innerQuery = "SELECT view_grade(?, ?) FROM dual";
              PreparedStatement prepStmt2 = con.prepareStatement(innerQuery);
              prepStmt2.clearParameters();
              prepStmt2.setString(1, username);
              prepStmt2.setString(2, cname);
              ResultSet result2 = prepStmt2.executeQuery();
              result2.next();
              %>
            <div>
                <p><%=cname%></p>
                <p><%=result2.getInt(1)%>%</p>
            </div>
          <%result2.close();
          prepStmt2.close();}
          result.close();
          prepStmt.close();
          %>
        </section>

    </section>

    <script src="../Scripts/navbarToggle.js"></script>
  </body>
</html>