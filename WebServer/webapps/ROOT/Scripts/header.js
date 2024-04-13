function getHeader() {
    let header = "";
    
    switch(localStorage.getItem("userType")) {
        // instructors and students should have the same header
        case "instructor":
        case "student":
            header = 
            `<header>
                <div class="logoContainer">
                    <img draggable="false" src="../Images/Tarpaulin_Logo_Alt_2.png">
                    <p>Tarpaulin</p>
                </div>

                <div>
                    <button class="buttonNormal" onclick='logout()'>Logout</button>
                    <img class="profile" draggable="false" src="../Images/user.svg" onclick="goToProfile()">
                </div>
            </header>`;
            break;
        
        default: 
            header = 
            `<header>
                <div class="logoContainer">
                    <img draggable="false" src="../Images/Tarpaulin_Logo_Alt_2.png">
                    <p>Tarpaulin</p>
                </div>
            
                <div id="navLoginSignUp">
                    <button class="buttonNormal" onclick='goToLogin()'>Login</button>
                    <button class="buttonAccent" onclick='goToSignup()'>Sign Up</button>
                </div>
            </header>`;
    }

    return header;
}

function goToHome() {
    let home = "../Pages/";

    switch(localStorage.getItem("userType")) {
        case "student":
            home += "studentHome.jsp";
            break;
        case "instructor":
                home += "instructorHome.jsp";
                break;
        default:
            home += "landing.jsp";
    }

    window.open(home, "_self");
}

function goToProfile() {
    window.open("../Pages/profile.jsp", "_self");
}

document.write(getHeader());
document.getElementsByClassName("logoContainer")[0].addEventListener("click", goToHome);

window.onload = () => document.body.style.visibility = "visible";

function goToLogin() {
    window.open("../Pages/login.jsp", "_self");
}

function goToSignup() {
    window.open("../Pages/signup.jsp", "_self");
}