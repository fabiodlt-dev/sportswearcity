function showOrHide() {
    let icon = document.getElementById("angle-down2"); 
    let sizesContainer = document.getElementById("sizes-container"); 
    if(sizesContainer.style.display == "none") {
        sizesContainer.style.display = "block"; 
        icon.style.transform = "rotate(180deg)";
    }
    else {
        sizesContainer.style.display = "none"; 
        icon.style.transform = "rotate(0deg)";
    }
    }   

function showOrHide2() {
    let icon = document.getElementById("angle-down1");
    let teamsContainer = document.getElementById("nba-teams-container"); 
    if(teamsContainer.style.display == "none") {
        teamsContainer.style.display = "block"; 
        icon.style.transform = "rotate(180deg)";
    }
    else {
        teamsContainer.style.display = "none"; 
        icon.style.transform = "rotate(0deg)";
    }
}