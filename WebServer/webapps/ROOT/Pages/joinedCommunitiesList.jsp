<%@include file="../userAuth.jsp"%>

<%@include file="../DBconnection.jsp"%>

<%@page import="
    java.sql.*, 
    oracle.jdbc.*, 
    java.util.ArrayList, 
    java.util.Collections
"%>


<%
String username = "username";

try{
    username = (String) session.getAttribute("username");
}
catch(Exception E) {
    username = "";
}
%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="../Styles/styles.css">
    <title>Tarpaulin - Your Joined Communities</title>
  <link rel="icon" type="image/x-icon" href="../Images/Tarpaulin_Logo_Alt_2.png">
</head>
  <body class="studentHomeBody">
    <script src="../Scripts/headerLoggedIn.js"></script>

    <img class="openNavbar" src="../Images/menu.svg">

    <script src="../Scripts/loadSidebar.js"></script>

    <section class="mainContainer">
      
      <p class="bigTitle">Your Joined Communities</p>

        <section class="communitiesListContainer">

            <%
            try {
                String query = 
                "SELECT community_id " + "\n" + 
                "FROM TARP_JOINED_BY" + "\n" + 
                "WHERE username='" + username + "'"; 
                PreparedStatement preparedStmt = con.prepareStatement(query);
                
                ResultSet result = preparedStmt.executeQuery();
                
                while(result.next()) {
                    String communityId = result.getString(1);

                    // get description
                    String queryInner = 
                    "SELECT c_description " + "\n" + 
                    "FROM TARP_COMMUNITY" + "\n" + 
                    "WHERE comm_id='" + communityId + "'"; 
                    PreparedStatement preparedStmtInner = con.prepareStatement(queryInner);
                    
                    ResultSet resultInner = preparedStmtInner.executeQuery();

                    String description = "";
                    while(resultInner.next()) {
                        description = resultInner.getString(1);
                        break;
                    }

                    resultInner.close();
                    preparedStmtInner.close();

                    // get scores of each student to calculate rank

                    // start by getting each studnet in the community
                    queryInner = 
                    "SELECT username " + "\n" + 
                    "FROM TARP_JOINED_BY" + "\n" + 
                    "WHERE community_id='" + communityId + "'"; 
                    preparedStmtInner = con.prepareStatement(queryInner);
                    
                    resultInner = preparedStmtInner.executeQuery();

                    String currentUser = "";
                    ArrayList<Integer> scores = new ArrayList<Integer>();
                    int myIndex = 0;
                    int myScore = 0;

                    while(resultInner.next()) {
                        currentUser = resultInner.getString(1);

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

                    resultInner.close();
                    preparedStmtInner.close();

                    // sort arrayList of scores to easily calculate rank
                    Collections.sort(scores);

                    // find rank my getting the index of sorted scores arrayList, based off of actual user score
                    myIndex = scores.indexOf(myScore);
            %>
            
                    <form class="community" action="setCommunityIdSessionAttribute_action.jsp" method="post">
                        <p class="title"><%=communityId%></p>

                        <p><%=description%></p>
                        
                        <div>
                            <p>Your Rank:</p>
                            <p><%=myIndex + 1%></p>
                        </div>
                        
                        <input type="text" name="communityId" value=<%=communityId%> style="display: none;">

                        <div class="controls">
                            <button class="buttonNormal" type="submit">View</button>
                        </div>
                    </form>
                    
            <%
                }

                result.close();
                preparedStmt.close();
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