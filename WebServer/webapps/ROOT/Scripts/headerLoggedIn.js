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
            <p id="you"></p>
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
document.getElementById("you").innerText = document.getElementById("usernameForHeader").innerText;
// after get value, don't need p element anymore so can remove
document.getElementById("usernameForHeader").remove();
document.getElementsByClassName("logoContainer")[0].addEventListener("click", goToHome);

window.onload = () => document.body.style.visibility = "visible";

function logout() {
    window.open("../Pages/logout.jsp", "_self");   
}