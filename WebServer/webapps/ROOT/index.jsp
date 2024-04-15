<%
String load = "./Pages/";


try {
    int userCheck = (int) session.getAttribute("userType");
    
    switch(userCheck) {
        case 1:
            load += "instructorHome.jsp";
            break;
        case 2:
            load += "studentHome.jsp";
            break;
        default:
            load += "landing.jsp";
            break;
    }
}
catch(Exception E) {
    load += "landing.jsp";
}

/*
switch(session.getAttribute("userType")) {
    case 1:
        load += "instructorHome.jsp";
        break;
    case 2:
        load += "studentHome.jsp";
        break;
    default:
        load += "landing.jsp";
}*/

response.sendRedirect(load);
%>
