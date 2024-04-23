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

<section class="mainContainer">
    
    <p class="bigTitle" style="text-align: center; margin: 0;">Results</p>
    
    <form action="courseSearch.jsp" method="post" style="display: flex; align-self: center; margin-top: 1em; margin-bottom: 2em;">
        <button class="buttonAccent" type= "submit" onclick= "courseSearch">Search Again</button>
    </form>

     <select class="courseSearchFilter">
        <option>Filter By</option>
        <option>Course Name</option>
        <option>Instructor</option>
        <option>Rating</option>
        <option>Date Created</option>
    </select>

    <section class="list coursesList" style="border: 1px solid #00000040; width: 40vw; max-width: 30em; min-width: 15em;">
        
        <%
        String username = (String) session.getAttribute("username");

        String coursename = request.getParameter("coursename");
        String instructor = request.getParameter("instructor");

        if(coursename == null || instructor == null) {
            try {
                coursename = (String) session.getAttribute("coursenameParam");
                instructor = (String) session.getAttribute("instructorParam");
            }
            catch(Exception E) {
                out.println(E);
            }
        }
        else {
            session.setAttribute("coursenameParam", coursename);
            session.setAttribute("instructorParam", instructor);
        }

        String query = "";
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

        while(result.next()) {
            coursename = result.getString(1);
            instructor = result.getString(2);
        %>

            <!-- inline CSS because this specific page has a slightly different courses list -->
            <form class="course" action="setCourseIdSessionAttribute_action.jsp" method="post"
            style="width: fit-content;">
                <input type="text" name="courseId" value=<%=coursename%> style="display: none;">

                <input type="text" name="loadBackToSearch" value="true" style="display: none;">
                <input type="text" name="coursenameParam" value=<%=coursename%> style="display: none;">
                <input type="text" name="instructorParam" value=<%=instructor%> style="display: none;">
                
                <button type="submit" class="bigDescription"
                style="margin: 0; margin-bottom: 0.2em;">
                    <%= coursename %>
                </button>

                <div style="margin-bottom: 0.25em;">
                    <p>by</p>
                    <p class="instructorName"><%= instructor %></p>
                </div>

                <p>The description of this course would go here. Not yet implemented.</p>
            </form>

        <%
        }

        result.close();
        prepStmt.close();
        %>

    </section>

</section>
</body>
</html>



