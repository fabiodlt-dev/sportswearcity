window.addEventListener("load",backgroundAnimation);
window.addEventListener("load",buttonAnimation);
let ID1 = setInterval(backgroundAnimation,40); 
let ID2 = setInterval(buttonAnimation,20);
let opacity = 0,val = 0;    

function hamburgerMenu() {
    let mobileNavbar = document.getElementsByClassName("mobile-navbar")[0];
    const cssObj = window.getComputedStyle(mobileNavbar,null); 
    let display = cssObj.getPropertyValue("display");
    if(display == "none")  
        mobileNavbar.style.display = "block";
    else {
        mobileNavbar.style.display = "none";
    }
}

function backgroundAnimation() {
    let cardElements = document.getElementsByClassName("card");
    for(let i = 0; i < cardElements.length; i++) {
        if(val >= 0.6) {
            clearInterval(ID1);
        }
        else {
            val = val + 0.01;
            cardElements[i].style.backgroundColor = "rgba(0,0,0," + val + ")"; 
        }
    }
}

function buttonAnimation() {
    let buttonElements = document.getElementsByClassName("shop-now-btn");
    for(let i = 0; i < buttonElements.length; i++) {
        if(opacity >= 1)
            clearInterval(ID2); 
        else {
            opacity = opacity + 0.007;
            buttonElements[i].style.opacity = opacity;
        }
    }
}   