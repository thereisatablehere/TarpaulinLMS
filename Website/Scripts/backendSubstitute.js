if(localStorage.getItem("userType") == null) {
    localStorage.setItem("userType", "guest");
}

function logout() {
    localStorage.setItem("userType", "guest");
    window.open("../../index.html", "_self");
}

function setUserType(input) {
    let type = "";

    if(input.toLowerCase() == "student" || input.toLowerCase() == "instructor") {
        type = input.toLowerCase();
        
        localStorage.setItem("userType", type);
        window.open("../../index.html", "_self");
    }
}