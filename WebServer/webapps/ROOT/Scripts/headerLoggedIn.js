function getHeader() {
    let header = 
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

    return header;
}

function goToHome() {
    let home = "../index.jsp";

    window.open(home, "_self");
}

function goToProfile() {
    window.open("../Pages/profile.jsp", "_self");
}

document.write(getHeader());
document.getElementsByClassName("logoContainer")[0].addEventListener("click", goToHome);

window.onload = () => document.body.style.visibility = "visible";

function logout() {
    window.open("../Pages/logout.jsp", "_self");   
}