<%@page import="java.sql.*, oracle.jdbc.*"%>
<%@include file="../userAuth.jsp"%>
<%@include file="../DBconnection.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../Styles/styles.css">
    <title>Tarpaulin - Search For a Course</title>
    <link rel="icon" type="image/x-icon" href="../Images/Tarpaulin_Logo_Alt_2.png">
</head>
<body class="studentHomeBody">
    <script src="../Scripts/headerLoggedIn.js"></script>
    <img class="openNavbar" src="../Images/menu.svg">
    <script src="../Scripts/loadSidebar.js"></script>
    
    <section class="mainContainer mainContainerLeft courseSearchResults">
        <%String username = (String)session.getAttribute("username");
        String coursename = request.getParameter("coursename");
        String instructor = request.getParameter("instructor");%>
        <!-- Results Section -->
        <% String query = "";
        PreparedStatement prepStmt = null;
        if(coursename.equals("") && instructor.equals("")){
            query = "SELECT course_id, username FROM TARP_COURSE";
            prepStmt = con.prepareStatement(query);
            prepStmt.clearParameters();
        }
        else {
            query = "SELECT course_id, username FROM TARP_COURSE where course_id = ? OR username = ?";
            prepStmt = con.prepareStatement(query);
            prepStmt.clearParameters();
            prepStmt.setString(1, coursename);
            prepStmt.setString(2, instructor);
        }
        ResultSet result = prepStmt.executeQuery();
        %>
        <p>&nbsp</p>
        <form action="courseSearch.jsp" method="post">
            <button class="buttonAccent" type= "submit" onclick= "courseSearch">Search Again</button>
        </form>
        
        <section class="search" type = "block">
            <p class="title">Results</p>

         <select>
                <option>Filter By</option>
                <option>Course Name</option>
                <option>Instructor</option>
                <option>Rating</option>
                <option>Date Created</option>
         </select>
         <p>&nbsp</p>
         <div class="course">
            <%while (result.next()){
                String cname = result.getString(1);
                String instr = result.getString(2);
                %>
            <p class="name"><%=cname%></p>
    
            <div>
                <p class="instructor"><%=instr%></p>
            </div>
    
            <div>
                <div>
                    <img draggable="false" class="star" src="../Images/star-full.svg">
                    <img draggable="false" class="star" src="../Images/star-full.svg">
                    <img draggable="false" class="star" src="../Images/star-full.svg">
                    <img draggable="false" class="star" src="../Images/star-full.svg">
                </div>
                <p>(4.5)</p>
            </div>
    
            <p>A description of this course would go right here.</p>
            <p>-------------------------------------------------</p>
        </div>
        <%}%>
    </section>
    <%result.close();
    prepStmt.close();
    %>
    </section>
</body>
</html>



