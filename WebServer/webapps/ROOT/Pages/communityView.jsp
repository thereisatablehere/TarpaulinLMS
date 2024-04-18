<%@include file="../userAuth.jsp"%>

<%@include file="../DBconnection.jsp"%>

<%@page import="
    java.sql.*, 
    oracle.jdbc.*, 
    java.util.ArrayList, 
    java.util.Collections
"%>

<%
    // get username (needed for calculating rank)
    String username = "username";

    try{
        username = (String) session.getAttribute("username");
    }
    catch(Exception E) {
        username = "username";
    }

    // get community id from session attribute
    String communityId = "";
    try {
        communityId = (String) session.getAttribute("communityId");
    }
    catch(Exception E) {
        out.println(E);
    }

    String description = "description";
    String size = "-1";
    String rank = "-1";

    try {
        // get description
        String query = 
        "SELECT c_description " + "\n" + 
        "FROM TARP_COMMUNITY" + "\n" + 
        "WHERE comm_id='" + communityId + "'"; 
        PreparedStatement preparedStmt = con.prepareStatement(query);
        
        ResultSet result = preparedStmt.executeQuery();

        while(result.next()) {
            description = result.getString(1);
            break;
        }

        result.close();
        preparedStmt.close();

        // get size
        query = 
        "SELECT num_students " + "\n" + 
        "FROM TARP_COMMUNITY" + "\n" + 
        "WHERE comm_id='" + communityId + "'"; 
        preparedStmt = con.prepareStatement(query);
        
        result = preparedStmt.executeQuery();

        while(result.next()) {
            size = result.getString(1);
            break;
        }

        result.close();
        preparedStmt.close();

        // get rank
        query = 
        "SELECT username " + "\n" + 
        "FROM TARP_JOINED_BY" + "\n" + 
        "WHERE community_id='" + communityId + "'"; 
        preparedStmt = con.prepareStatement(query);
        
        result = preparedStmt.executeQuery();

        String currentUser = "";
        ArrayList<Integer> scores = new ArrayList<Integer>();
        int myIndex = 0;
        int myScore = 0;

        while(result.next()) {
            currentUser = result.getString(1);

            // then get the score of each student
            String queryInnerInner = 
            "SELECT" + 
            "    e.username, " + 
            "    (count_student_completed_lectures(e.username) * 10)  " + 
            "    + sum_student_tests(e.username) AS total_score " + 
            "FROM" + 
            "    tarp_enrolls e " + 
            "INNER JOIN" + 
            "    tarp_course c ON e.course_id = c.course_id " + 
            "WHERE" + 
            "    e.username='" + currentUser + "'";
            PreparedStatement preparedStmtInnerInner = con.prepareStatement(queryInnerInner);
            
            ResultSet resultInnerInner = preparedStmtInnerInner.executeQuery();

            int score = 0;
            while(resultInnerInner.next()) {
                // add the score of student to arrayList
                score = Integer.parseInt(resultInnerInner.getString(2));
                scores.add(score);

                // if the current user looking at is the actual user, keep track of their score
                String nameCheck = resultInnerInner.getString(1);
                if(nameCheck.equals(username)) {
                    myScore = score;
                }
                
                break;
            }

            resultInnerInner.close();
            preparedStmtInnerInner.close();
        }

        result.close();
        preparedStmt.close();

        // sort arrayList of scores to easily calculate rank
        Collections.sort(scores);

        // find rank my getting the index of sorted scores arrayList, based off of actual user score
        myIndex = scores.indexOf(myScore);
        rank = String.valueOf(myIndex + 1);
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
    <title>Tarpaulin - View a Community</title>
  <link rel="icon" type="image/x-icon" href="../Images/Tarpaulin_Logo_Alt_2.png">
</head>
  <body class="studentHomeBody">
    <script src="../Scripts/headerLoggedIn.js"></script>

    <img class="openNavbar" src="../Images/menu.svg">

    <script src="../Scripts/loadSidebar.js"></script>

    <section class="mainContainer">
      
      <p class="bigTitle communityViewTitle"><%=communityId%></p>

        <section class="communityView">
            <p class="bigDescription"><%=description%></p>

            <div style="margin-top: 0.5em;">
                <p>Members: </p>
                <p><%=size%></p>
            </div>

            <div style="margin-bottom: 0.2em;">
                <p>Your Rank:</p>
                <p><%=rank%></p>
            </div>

            <!-- TODO -->
            <div class="controls">
                <button class="buttonNormal">Invite Another Student</button>
                <button class="buttonAccent">Leave Community</button>
            </div>

            <!-- TODO -->
            <p class="title">Leaderboard</p>

            <div class="leaderboard">
                <div class="person">
                    <div>
                        <p>1.</p>
                        <p>Not</p>
                    </div>
                    
                    <p>123 pts</p>
                </div>
                
                <div class="person">
                    <div>
                        <p>2.</p>
                        <p class="you">Yet</p>
                    </div>

                    <p>100 pts</p>
                </div>
                
                <div class="person">
                    <div>
                        <p>3.</p>
                        <p>Finished</p>
                    </div>

                    <p>50 pts</p>
                </div>
                
            </div>

        </section>

    </section>

    <script src="../Scripts/navbarToggle.js"></script>
  </body>
</html>