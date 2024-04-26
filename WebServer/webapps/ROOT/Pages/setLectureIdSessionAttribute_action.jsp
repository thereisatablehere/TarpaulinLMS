<%
String courseId = request.getParameter("courseId");
String lectureId = request.getParameter("lectureId");

session.setAttribute("courseId", courseId);
session.setAttribute("lectureId", lectureId);
out.println(courseId + "<br>" + lectureId);
response.sendRedirect("viewLecture.jsp");
%>