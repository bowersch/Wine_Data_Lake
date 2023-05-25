// Popup logic
const modal = document.getElementById("myModal");
const closeBtn = document.getElementsByClassName("close")[0];
const yesBtn = document.getElementById("yesBtn");
const noBtn = document.getElementById("noBtn");

// Clicking outside the popup area to close the popup
window.onclick = function (event) {
    if (event.target === modal) {
        modal.style.display = "none";
    }
};

// Click the close button to close the popup
closeBtn.onclick = function () {
    modal.style.display = "none";
};

// The callback function for the 'yes' button click
function handleYes() {
    // The logic for handling the 'yes' button
    console.log("Yes button clicked");
    modal.style.display = "none";
}

// The callback function for the 'no' button click
function handleNo() {
    // The logic for handling the 'no' button
    console.log("No button clicked");
    modal.style.display = "none";
}

// Bind the button click event
yesBtn.addEventListener("click", handleYes);
noBtn.addEventListener("click", handleNo);

// Display the popup
function showModal() {
    modal.style.display = "block";
}

// Example: Display the popup after the page has finished loading
window.onload = function () {
    showModal();
};

function showHamburgerMenu() {

    const hamburgerMenu = document.querySelector(".hamburgerMenu");
    const bars = document.querySelector("#bars");
    const xmark = document.querySelector("#xmark");

    //display the hamburger icon, no menu
    if(hamburgerMenu.classList.contains("showHamburgerMenu")){
        hamburgerMenu.classList.remove("showHamburgerMenu");
        xmark.style.display = "none";
        bars.style.display = "block";
    }
    //display the menu with close icon (x)
    else{
        hamburgerMenu.classList.add("showHamburgerMenu");
        xmark.style.display = "block";
        bars.style.display = "none";
    }
}