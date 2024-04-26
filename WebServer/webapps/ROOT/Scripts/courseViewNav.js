let tabs = document.getElementsByClassName("tab");
let navs = document.getElementById("nav").children;

function changeTab(request) {
    let tab = (request.innerText).toLowerCase();

    localStorage.setItem("courseViewTab", tab);
    localStorage.setItem("courseViewCourseId", document.getElementById("courseTitle").innerText);

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

let goToTab = localStorage.getItem("courseViewTab");
let checkCourseId = localStorage.getItem("courseViewCourseId");

if(goToTab != null && document.getElementById("courseTitle").innerText == checkCourseId) {
    for(let t of tabs) {
        if(t.id == goToTab) {
            t.style.display = "flex";
        }
        else {
            t.style.display = "none";
        }
    }

    for(let n of navs) {
        n.style.fontWeight = "500";

        if((n.innerText).toLowerCase() == goToTab) {
            n.style.fontWeight = "bold";
        }
    }
}

document.body.style.display = "flex";