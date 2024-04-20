<%@include file="../userAuth.jsp"%>

<%@include file="../DBconnection.jsp"%>

<%@page import="
    java.sql.*, 
    oracle.jdbc.*
"%>

<%
String courseId = "";

try {
  courseId = (String) session.getAttribute("courseId");
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
    <title>Tarpaulin - Test</title>
  <link rel="icon" type="image/x-icon" href="../Images/Tarpaulin_Logo_Alt_2.png">
</head>
  <body class="testBody">
    <form class="mainContainer entireTestContainer" 
    action="testSubmit_action.jsp" method="post">

        <%
        String testId = "";
        
        try {
          testId = (String) session.getAttribute("testId");
        }
        catch(Exception E) {
          out.println(E);
        }
        %>
        
        <p class="title"><%=testId%></p>

        <%
        int count = 0;

        try{
            String query = 
            "SELECT t_prompt, a, b, c, d " + "\n" + 
            "FROM TARP_QUESTION " + "\n" + 
            "WHERE test_id='" + testId + "'" + " AND " + 
              "course_id='" + courseId + "'";
            PreparedStatement preparedStmt = con.prepareStatement(query);
            
            ResultSet result = preparedStmt.executeQuery();

            String question = "question";
            
            while(result.next()) {
              ++count;
              String questionPromptNameValue = question + count + "prompt";
              String questionAnswerNameValue = question + count + "answer";
              
              String prompt = result.getString(1);
              String a = result.getString(2);
              String b = result.getString(3);
              String c = result.getString(4);
              String d = result.getString(5);
        %>

              <div class="questionContainer">
                  <input type="text" name="testId" value=<%="\"" + testId + "\""%> style="display: none;">
                  <input type="text" name="courseId" value=<%=courseId%> style="display: none;">
                  <input type="text" name=<%=questionPromptNameValue%> value=<%="\"" + prompt + "\""%> style="display: none;">
                  
                  <p><%=prompt%></p>

                  <label><input type="radio" name=<%=questionAnswerNameValue%> value="A">
                      <%=a%>
                  </label>

                  <label><input type="radio" name=<%=questionAnswerNameValue%> value="B">
                      <%=b%>
                  </label>

                  <label><input type="radio" name=<%=questionAnswerNameValue%> value="C">
                      <%=c%>
                  </label>

                  <label><input type="radio" name=<%=questionAnswerNameValue%> value="D">
                      <%=d%>
                  </label>
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

        <input type="text" name="questionCount" value=<%=count%> style="display: none;">

        <button class="buttonAccent" onclick='window.open("courseView.jsp", "_self")'>Submit</button>

    </form>
  </body>
</html>