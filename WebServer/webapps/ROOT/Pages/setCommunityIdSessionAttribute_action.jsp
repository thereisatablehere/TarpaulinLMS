<%
String communityId = request.getParameter("communityId");

session.setAttribute("communityId", communityId);
response.sendRedirect("communityView.jsp");
%>