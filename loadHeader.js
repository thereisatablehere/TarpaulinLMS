import userData from "user.js";

const header = 
`<header>
    <div class="logoContainer">
        <img draggable="false" src="Images/Tarpaulin_Logo_Alt_2.png">
        <p>Tarpaulin</p>
    </div>

    <div id="navLoginSignUp">
        <button class="buttonNormal">Login</button>
        <button class="buttonAccent">Sign Up</button>
    </div>
</header>`;

function goToHome() {
    window.open(userData.homePage, "_self");
}

document.write(header);
document.getElementsByClassName("logoContainer")[0].addEventListener("click", goToHome);

window.onload = () => document.body.style.visibility = "visible";