let tabs = document.getElementsByClassName("tab");
let navs = document.getElementById("nav").children;

function changeTab(request) {
    let tab = (request.innerText).toLowerCase();

    for(let t of tabs) {
        if(t.id == tab) {
            t.style.display = "flex";
        }
        else {
            t.style.display = "none";
        }
    }

    for(let n of navs) {
        n.style.fontWeight = "500";
    }

    request.style.fontWeight = "bold";
}