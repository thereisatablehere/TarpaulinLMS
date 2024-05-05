<%@include file="../DBconnection.jsp"%>

<%@page import="
    java.sql.*, 
    oracle.jdbc.*
"%>

<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="../Styles/styles.css">
    <title>Tarpaulin - Learn More</title>
<link rel="icon" type="image/x-icon" href="../Images/Tarpaulin_Logo_Alt_2.png">
</head>
<body class="landingBody">
    <script src="../Scripts/headerGuest.js"></script>

    <section class="mainContainer">
        <section class="titleBodySection">
            <p class="bigTitle">What exactly is Tarpaulin?</p>

            <div class="bodyText">
                <p>
                    Tarpaulin is an Online Learning Management System (OLMS) designed to facilitate the creation, management, and delivery of educational courses. Tarpualin provides a user-friendly interface for students and instructors, allowing efficient handling of course materials, assessments, and student progress tracking. 
                </p>
            </div>
        </section>

        <section class="titleBodySection">
            <p class="bigTitle">FAQ</p>

            <div class="faq">
                <div>
                    <label>
                        <input type="checkbox">
                        <p class="questionText">What type of content is there?</p>
                        <p class="questionTextArrow">^</p>
                    </label>
                    <p class="answer">Virtually anything! All of the content on Tarpaulin is created by various instructors who teach whatever courses they specialize in.</p>
                </div>

                <div>
                    <label>
                        <input type="checkbox">
                        <p class="questionText">How does learning work?</p>
                        <p class="questionTextArrow">^</p>
                    </label>
                    <p class="answer">Students are able to enroll in any course they want, which grants them access to an array of lecture videos they can watch and tests they can take. Additionally, students are able to see their grade for each course they are enrolled in, as well as a cumulative grade report.</p>
                </div>

                <div>
                    <label>
                        <input type="checkbox">
                        <p class="questionText">Is there a way I can connect with my friends?</p>
                        <p class="questionTextArrow">^</p>
                    </label>
                    <p class="answer">Yes! On Tarp students can find, and create, various communities in which students can compete with one another to see who is the better student through a leaderboard. The points students get which influences their position in the leaderboard is determined from their performance on tests and the number of lectures they have completed.</p>
                </div>

                <div>
                    <label>
                        <input type="checkbox">
                        <p class="questionText">Can anyone be an instructor></p>
                        <p class="questionTextArrow">^</p>
                    </label>
                    <p class="answer">Yes! Anyone who wants to teach others are able to sign up for an instructor account and start creating right away!</p>
                </div>
            </div>
        </section>
    </section>

    <!-- copied from landing.jsp -->
    <footer>
        <%
        String dateInfo = "";

        try {
            String query = "SELECT sysdate FROM DUAL";
            
            PreparedStatement preparedStmt = con.prepareStatement(query);

            ResultSet result = preparedStmt.executeQuery();

            while(result.next()) {
                dateInfo = result.getString(1);

                try {
                    String yearQuery = "SELECT SUBSTR('" + dateInfo + "', 1, 10) FROM DUAL";
                    
                    PreparedStatement yearPreparedStmt = con.prepareStatement(yearQuery);

                    ResultSet yearResult = yearPreparedStmt.executeQuery();

                    while(yearResult.next()) {
                        dateInfo = yearResult.getString(1);
                        
                        break;
                    }
                }
                catch(Exception D) {
                    out.println("INNER FAIL: " + D);
                }

                break;
            }

            result.close();
            preparedStmt.close();
        }
        catch(Exception E) {
            out.println("OUTER FAIL: " + E);
            dateInfo = "";
        }

        if(dateInfo.length() > 0) {
        %>
            <p id="copyright">&copy <%=dateInfo%></p>
        <%        
        }

        String version = "";

        try {
            String query = "SELECT * FROM v$version";

            PreparedStatement preparedStmt = con.prepareStatement(query);

            ResultSet result = preparedStmt.executeQuery();

            while(result.next()) {
                version = result.getString(1);
                
                break;
            }

            result.close();
            preparedStmt.close();
        }
        catch(Exception E) {
            version = "";
        }

        if(version.length() > 0) {
        %>
            <p><%=version%></p>
        <%
        }
        %>
    </footer>

    <script src="../Scripts/faqAccordian.js"></script>
</body>
</html>