let check = localStorage.getItem("userType")

if(check != "student" && check  != "instructor") {
    window.open("../Pages/landing.jsp", "_self");
}