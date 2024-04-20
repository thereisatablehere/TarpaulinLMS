<%
String courseId = request.getParameter("courseId");

session.setAttribute("courseId", courseId);
response.sendRedirect("courseViewAsInstructor.jsp");
%>