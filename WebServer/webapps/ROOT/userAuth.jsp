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


// create a hiddent p element that can be used by headerLoggedIn.js to get the user's username
String usernameForHeader = "You";

try{
    usernameForHeader = (String) session.getAttribute("username");
}
catch(Exception E) {
    usernameForHeader = "You";
}
%>
<p id="usernameForHeader" style="display: none;"><%=usernameForHeader%></p>