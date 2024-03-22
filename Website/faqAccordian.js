const DEFAULT_ANIMATION_TIME = parseFloat(window.getComputedStyle(document.documentElement).getPropertyValue("--defaultAnimationTime"));
let questions = document.getElementsByClassName("faq")[0].children;

const FPS = 60;
const FRAMES = Math.floor(DEFAULT_ANIMATION_TIME * FPS);

for(let question of questions) {
    let checkElem = question.children[0].children[0];
    checkElem.addEventListener("click", function(){toggle(this);});
}

function toggle(checkElem) {
    let labelElem = checkElem.parentNode.parentNode.children[0];
    let answerElem = checkElem.parentNode.parentNode.children[1];
    let questionArrowElem = labelElem.children[2];

    let frame = 0;
    let height = answerElem.scrollHeight;
    let rate = answerElem.scrollHeight / FRAMES;

    if(checkElem.checked) {
        answerElem.style.visibility = "visible";
        answerElem.style.paddingBottom = "0";
        questionArrowElem.style.transform = "rotate(0)";

        height = 0;
    }
    else {
        questionArrowElem.style.transform = "rotate(-180deg)";
        answerElem.style.paddingBottom = "1em";

        rate = 0 - rate;
    }

    let interval = window.setInterval(function() {
        ++frame;
        
        height += rate;
        answerElem.style.height = height + "px";
        
        if(frame == FRAMES) {
            if(!(checkElem.checked)) {
                answerElem.style.visibility = "hidden";
            }
            
            window.clearInterval(interval);
        }
    }, (1000 / FPS));
}