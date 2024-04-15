function getHeader() {
    let header = 
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

    return header;
}

function goToHome() {
    let home = "../Pages/landing.jsp";

    window.open(home, "_self");
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