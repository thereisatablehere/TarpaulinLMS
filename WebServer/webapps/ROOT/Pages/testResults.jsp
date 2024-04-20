<!-- as of right now, students only able to see final score from taken tests, 
but if decide to be able to view each question of test later on, can use this-->

<!-- this page should only need to load data and not change anything -->

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
    <title>Tarpaulin - Test Results</title>
<link rel="icon" type="image/x-icon" href="../Images/Tarpaulin_Logo_Alt_2.png">
</head>
<body>
    <script src="../Scripts/headerLoggedIn.js"></script>

    <script src="../Scripts/loadSidebar.js"></script>
    
    <section class="mainContainer entireTestContainer">

        <%
        String testId = "";
        
        try {
            testId = (String) session.getAttribute("testId");
        }
        catch(Exception E) {
            out.println(E);
        }
        %>
        
        <p class="title"><%=testId%> - Results</p>

        <%
        try {
            String query = 
            "SELECT t_prompt, a, b, c, d " + "\n" + 
            "FROM TARP_QUESTION " + "\n" + 
            "WHERE test_id='" + testId + "'";
            PreparedStatement preparedStmt = con.prepareStatement(query);
            
            ResultSet result = preparedStmt.executeQuery();

            String question = "question";
            
            while(result.next()) {
        %>

                <div class="questionContainer">
                    <p class="">Another question prompt could possibly go here.</p>

                    <label><input type="radio" name="question2" disabled>Option A</label>

                    <label class="incorrectAnswer">-<input type="radio" name="question2" checked disabled>Option B</label>

                    <label><input type="radio" name="question2" disabled>Option C</label>

                    <label class="correctAnswer">+<input type="radio" name="question2" disabled>Option D</label>
                </div>

        <%
            }

            result.close();
            preparedStmt.close();
        }
        catch(Exception E) {
            out.println(E);
        }
        %>

        <!-- can use JS redirect like this because no data would change when viewing test results, 
        and the session attributes for courseView.jsp to get data would still be the same -->
        <button class="buttonAccent" onclick='window.open("courseView.jsp", "_self")'>Go Back</button>

    </section>
</body>
</html>