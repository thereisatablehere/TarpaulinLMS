<%@include file="../DBconnection.jsp"%>

<%@page import="
    java.sql.*, 
    oracle.jdbc.*
"%>

<%
String username = "Null";

try{
    username = (String) session.getAttribute("username");
}
catch(Exception E) {
    out.println(E);
}

String testId = (String) request.getParameter("testId");
String courseId = (String) request.getParameter("courseId");

int count = Integer.parseInt((String) request.getParameter("questionCount"));
int correct = 0;

// get answers and check if each answer is correct or not
for(int i = 1; i <= count; i++) {
    String prompt = (String) request.getParameter("question" + i + "prompt");
    String answer = (String) request.getParameter("question" + i + "answer");

    out.println(prompt + " | " + testId + " | " + courseId + " | " + answer + "<br>");

    CallableStatement callStmt = con.prepareCall(" {? = call CORRECT_ANSWER(?,?,?,?)}");
    callStmt.setString(2, prompt);

    callStmt.setString(3, testId);

    callStmt.setString(4, courseId);

    callStmt.setString(5, answer);


    callStmt.registerOutParameter(1, Types.INTEGER);

    callStmt.execute();

    int result = callStmt.getInt(1);
    correct += result;

    out.println("correct? " + result + "<br>");
}

// calculate score
out.println("<br>Total Score:<br>");
int score = (int) Math.floor((((double) correct) / count) * 100);
out.println(correct + " / " + count + " = " + score + "%");

// update DB
String query = 
"INSERT INTO TARP_TAKEN_BY (test_id, course_id, username, score) " + "\n" + 
"VALUES(" + "'" + testId + "'" + "," + "'" + courseId + "'" + "," + "'" + username + "'" + "," + "'" + score + "'" + ")";
PreparedStatement preparedStmt = con.prepareStatement(query);

preparedStmt.execute();

out.println("<br><br>DB updated!");

response.sendRedirect("courseView.jsp");
%>