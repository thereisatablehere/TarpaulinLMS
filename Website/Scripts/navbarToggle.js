if(localStorage.getItem("userType") == "student") {
    let navbarRef = document.getElementsByClassName("sidebar")[0];
    
    // add event listeners
    
    let closeRef = document.getElementsByClassName("close")[0];
    closeRef.addEventListener("click", closeNavbar);
    let openRef = document.getElementsByClassName("openNavbar")[0];
    openRef.addEventListener("click", openNavbar);
    
    function closeNavbar() {
        navbarRef.style.display = "none";
        openRef.style.display = "block";
    }
    
    function openNavbar() {
        navbarRef.style.display = "block";
        openRef.style.display = "none";
    }
}