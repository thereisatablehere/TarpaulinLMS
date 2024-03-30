if(localStorage.getItem("userType") == null) {
    localStorage.setItem("userType", "guest");
}

function logout() {
    localStorage.setItem("userType", "guest");
    window.open("../../index.html", "_self");
}

function setUserTypeToStudent() {
    localStorage.setItem("userType", "student");
    window.open("../../index.html", "_self");
}