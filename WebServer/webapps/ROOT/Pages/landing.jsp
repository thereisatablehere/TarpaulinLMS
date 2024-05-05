<!DOCTYPE html>

<%@include file="../DBconnection.jsp"%>

<%@page import="
    java.sql.*, 
    oracle.jdbc.*
"%>

<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="../Styles/styles.css">
    <title>Tarpaulin</title>
  <link rel="icon" type="image/x-icon" href="../Images/Tarpaulin_Logo_Alt_2.png">
</head>
  <body class="landingBody">
    <script>
      let check = localStorage.getItem("userType");
      
      if(check == "student" || check == "instructor") {
        window.open("../../index.jsp", "_self");
      }
    </script>

    <script src="../Scripts/headerGuest.js"></script>

    <section class="mainContainer mainContainerHorizontal">
      <div class="landingIntro">
        <p class="giantTitle">Tarpaulin</p>

        <p class="bigDescription">Gain access to a large array of educational content that can be accessed at anytime, from anywhere.</p>

	<%
            try {
                // SQL query
                String sql = "SELECT new_addition((SELECT COUNT(*) FROM tarp_student), (SELECT COUNT(*) FROM tarp_instructor)) AS total_users FROM dual";

                // Execute query
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery(sql);

                // Fetch result
                if (rs.next()) {
                    int totalUsers = rs.getInt("total_users");
                    out.println("<p>Total Active Users: " + totalUsers + "</p>");
                }

                // Close resources
                rs.close();
                stmt.close();
            } catch (Exception e) {
                out.println("EXCEPTION encountered");
                out.println(e);
            }
        %>

        <button class="buttonNormal" onclick="window.open('learnMore.jsp', '_self')">Learn More</button>
      </div>

      <div class="landingIconCollage">
        <div>
          <img draggable="false" src="../Images/exchange-rate.png">
          <img draggable="false" src="../Images/online-learning.png">
        </div>

        <div>
          <img draggable="false" src="../Images/knowledge.png">
          <img draggable="false" src="../Images/webinar.png">
        </div>

        <div>
          <img draggable="false" src="../Images/communities.png">
          <img draggable="false" src="../Images/chat.png">
        </div>

        <div>
          <img draggable="false" src="../Images/best-customer-experience.png">
          <img draggable="false" src="../Images/conversation.png">
        </div>
      </div>
    </section>

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
  </body>
</html>
