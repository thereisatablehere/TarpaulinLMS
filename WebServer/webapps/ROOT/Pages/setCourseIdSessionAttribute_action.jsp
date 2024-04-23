<%
String courseId = request.getParameter("courseId");
boolean loadBackToSearch = false;
try {
    loadBackToSearch = Boolean.parseBoolean(request.getParameter("loadBackToSearch"));
}
catch(Exception E) {
    out.println(E);
}
out.println(loadBackToSearch);

if(loadBackToSearch) {
    session.setAttribute("loadBackToSearch", request.getParameter("loadBackToSearch"));
}

session.setAttribute("courseId", courseId);
response.sendRedirect("courseView.jsp");
%>