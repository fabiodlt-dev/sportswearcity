function signIn() {
    let a = document.getElementById("sign-in");
    let b = document.getElementById("sign-up");
    let c = document.getElementById("sign-in-content");
    let d = document.getElementById("sign-up-content"); 
    a.style.backgroundColor = "#87062D"; 
    d.style.display = "none"; 
    c.style.display = "block";
    b.style.backgroundColor = "transparent";
}

function signUp() {
    let a = document.getElementById("sign-in");
    let b = document.getElementById("sign-up");
    let c = document.getElementById("sign-in-content");
    let d = document.getElementById("sign-up-content"); 
    a.style.backgroundColor = "transparent"; 
    d.style.display = "block"; 
    c.style.display = "none";
    b.style.backgroundColor = "#87062D";
}