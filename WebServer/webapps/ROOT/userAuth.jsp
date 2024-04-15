<%

try {
    int userCheck = (int) session.getAttribute("userType");
    
    if(userCheck != 1 && userCheck != 2) {
        response.sendRedirect("index.jsp");
    }
}
catch(Exception E) {
    response.sendRedirect("index.jsp");
}
%>