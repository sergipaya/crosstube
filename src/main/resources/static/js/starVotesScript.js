'use strict'

function printStars(avgRating) {
    let star1 = document.getElementById("star1");
    let star2 = document.getElementById("star1");
    let star3 = document.getElementById("star1");
    let star4 = document.getElementById("star1");
    let star5 = document.getElementById("star1");

    let lastFullStarPrinted = Math.trunc(avgRating);
    let lastStarPrint = Math.trunc((avgRating - lastFullStarPrinted) * 24);

    switch (lastFullStarPrinted) {
        case 4:
            star5.style.width=lastStarPrint + 'px';
            break;
        case 3:
            star4.style.width=lastStarPrint + 'px';
            break;
        case 2:
            star3.style.width=lastStarPrint + 'px';
            break;
        case 1:
            star2.style.width=lastStarPrint + 'px';
            break;
    }

    switch (lastFullStarPrinted) {
        case 5:
            star5.style.width='24px';
        case 4:
            star4.style.width='24px';
        case 3:
            star3.style.width='24px';
        case 2:
            star2.style.width='24px';
        case 1:
            star1.style.width='24px';
        default:
            star1.style.width=lastStarPrint + 'px';
    }


}

window.onload = printStars();