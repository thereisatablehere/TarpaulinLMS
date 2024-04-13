<%@page import="
    java.sql.*, 
    oracle.jdbc.*
"%>

<%
    Connection con = null;

    try {
        Class.forName("oracle.jdbc.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@//cscioraclerh7srv.ad.csbsju.edu:1521/" +
                                                                "csci.cscioraclerh7srv.ad.csbsju.edu",
                                                                "DBARTNESS001", "900248457");
    }
    catch(Exception E) {
        out.println("EXCEPTION encountered");
        out.println(E);
    }
%>
