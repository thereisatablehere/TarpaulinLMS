<%@include file="../userAuth.jsp"%>

<%@include file="../DBconnection.jsp"%>

<%@page import="
    java.sql.*, 
    oracle.jdbc.*, 
    java.util.*
"%>

<%
    // get username (needed for calculating rank)
    String username = "";

    try{
        username = (String) session.getAttribute("username");
    }
    catch(Exception E) {
        username = "";
    }

    // get community id from session attribute
    String communityId = "";
    try {
        communityId = (String) session.getAttribute("communityId");
    }
    catch(Exception E) {
        out.println(E);
    }


    // Trigger insert delete community
    String action = request.getParameter("action");
    if ("leave".equals(action)) {
        try {
            String leaveQuery = "DELETE FROM TARP_JOINED_BY WHERE community_id = ? AND username = ?";
            PreparedStatement leaveStmt = con.prepareStatement(leaveQuery);
            leaveStmt.setString(1, communityId);
            leaveStmt.setString(2, username);
            int rowsAffected = leaveStmt.executeUpdate();
            leaveStmt.close();
            
            if (rowsAffected > 0) {
                // Redirect to a confirmation page or display a success message
                out.println("<script>alert('You have successfully left the community.'); window.location.href='studentHome.jsp';</script>");
            } else {
                out.println("<script>alert('Failed to leave the community.'); window.location.href='viewCommunity.jsp';</script>");
            }
            return; // Stop further execution to redirect
        } catch (SQLException e) {
            out.println("Error when leaving community: " + e.getMessage());
        }
    }


    String description = "description";
    String size = "-1";
    String rank = "-1";
    HashMap<Integer, String> scoresMap = new HashMap<Integer, String>();

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
                score = Integer.parseInt(resultInnerInner.getString(2));
                scoresMap.put(score, resultInnerInner.getString(1));
                
                /*
                out.println(
                    resultInnerInner.getString(1) + 
                    " : " + 
                    String.valueOf(score) + "<br>"
                );
                */

                break;
            }

            resultInnerInner.close();
            preparedStmtInnerInner.close();
        }

        result.close();
        preparedStmt.close();

        // probably not the best way of doing this because 
        // go through again below for leaderboard
        List<Integer> keys = new ArrayList(scoresMap.keySet());
        Collections.sort(keys);

        for (int i = keys.size() - 1; i >= 0; i--) {
            if(scoresMap.get(keys.get(i)).equals(username)) {
                rank = String.valueOf(keys.size() - i);
                break;
            }
        }
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
                <div class="comingSoonContainer">
                    <button class="buttonNormal noClick">Invite Another Student</button>
                    <p class="comingSoon" style="
                    margin-left: 3em;
                    ">
                        Coming soon!
                    </p>
                </div>
                
                <form action="" method="post">
                    <input type="hidden" name="action" value="leave">
                    <input type="hidden" name="communityId" value="<%=communityId%>">
                    <button type="submit" class="buttonAccent">Leave Community</button>
                </form>
            </div>

            <!-- TODO -->
            <p class="title">Leaderboard</p>

            <div class="leaderboard">
                <%
                // sort all scores
                if(scoresMap.size() > 0) {
                    List<Integer> keys = new ArrayList(scoresMap.keySet());
                    Collections.sort(keys);

                    for (int i = keys.size() - 1; i >= 0; i--) {
                %>
                    <div class="person">
                        <div>
                            <p><%=keys.size() - i%>.</p>
                            <%
                            if(scoresMap.get(keys.get(i)).equals(username)) {
                            %>
                                <p class="you"><%=scoresMap.get(keys.get(i))%> (You)</p>
                            <%
                            }
                            else {
                            %>
                                <p><%=scoresMap.get(keys.get(i))%></p>
                            <%
                            }
                            %>
                        </div>
                        
                        <p><%=keys.get(i)%> pts</p>
                    </div>
                <%
                    }
                }
                %>
                
            </div>

        </section>

    </section>

    <script src="../Scripts/navbarToggle.js"></script>
  </body>
</html>