<%@include file="../userAuth.jsp"%>

<%@include file="../DBconnection.jsp"%>

<%@page import="
    java.sql.*, 
    oracle.jdbc.*, 
    java.util.ArrayList, 
    java.util.Collections
"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="../Styles/styles.css">
    <title>Tarpaulin - Join a Community</title>
    <link rel="icon" type="image/x-icon" href="../Images/Tarpaulin_Logo_Alt_2.png">
</head>
    <body class="studentHomeBody">
        <script src="../Scripts/headerLoggedIn.js"></script>

        <script src="../Scripts/loadSidebar.js"></script>

        <section class="mainContainer">
            <%
            Boolean joinedCommunityFailed = false;

            try{
                joinedCommunityFailed = Boolean.parseBoolean((String) 
                session.getAttribute("failedToJoinCommunity"));
            }
            catch(Exception E) {
                joinedCommunityFailed = false;
            }

            if(joinedCommunityFailed) {
                session.setAttribute("failedToJoinCommunity", "false");
            %>
                <div id="createCourseFailedMessage" style="
                margin-top: -14em;
                transform: none;
                width: 20em;
                ">
                    <img class="errorIcon" src="../Images/exclamation-outline.svg">
                    <p>Failed to join community</p>
                    <img class="closeIcon" src="../Images/close.svg" 
                    onclick="this.parentNode.style.display='none'">
                </div>
            <%
            }
            %>
            
            <p class="bigTitle" style="text-align: center;">Join a Community</p>
            
            <form id="joinCourseContainer" action="joinCommunity_action.jsp" method="post">
                <input type="text" name="communityName" placeholder="Enter Community Name">

                <button type="submit" class="buttonNormal backNav">
                    <img src="../Images/arrow-outline-right.svg">
                </button>
            </form>
            
        </section>
    </body>
</html>