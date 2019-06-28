// $(document).ready(function() {
//   AOS.init();
// })

/* ==================================================
   AOS
================================================== */

AOS.init({
  disable: 'mobile',
  duration: 800,
  mirror: false,
  easing: 'ease-in-out'
  // once: true,
  // easing: 'ease-out-back'
});



/* ==================================================
   Navbar
================================================== */

let mainNavLinks = document.querySelectorAll("nav ul li a");
let mainSections = document.querySelectorAll("main section");

let lastId;
let cur = [];

// This should probably be throttled.
// Especially because it triggers during smooth scrolling.
// https://lodash.com/docs/4.17.10#throttle
// You could do like...
// window.addEventListener("scroll", () => {
//    _.throttle(doThatStuff, 100);
// });
// Only not doing it here to keep this Pen dependency-free.

// or event inst of paran
window.addEventListener('scroll', () => {
  const fromTop = window.scrollY;

  mainNavLinks.forEach(link => {
    const section = document.querySelector(link.hash);
    if (
      section.offsetTop <= fromTop && section.offsetTop + section.offsetHeight > fromTop) {
      link.classList.add('current');
    } else {
      link.classList.remove('current');
    }
  });
});

/* ==================================================
  Smooth scrolling
================================================== */

mainNavLinks.forEach(link => {
  link.addEventListener('click', event => {
    event.preventDefault();
    let target = document.querySelector(event.target.hash);
    target.scrollIntoView({
      behavior: 'smooth',
      block: 'start'
    });
  });
});

/* ==================================================
  Colour change
================================================== */
$(document).ready(function(){
    var scroll_pos = 0;
    $(document).scroll(function() {
        scroll_pos = $(this).scrollTop();
        if(scroll_pos > 250) {
            $("section").addClass("changeColor");
            $("section:nth-child(1) h2, section:nth-child(1) p").addClass("changeColortext");
            $("section:nth-child(2) h2").addClass("changeColortitle");

        }
        else {
            $("section").removeClass("changeColor");
            $("section:nth-child(1) h2, section:nth-child(1) p").removeClass("changeColortext");
            $("section:nth-child(2) h2, hr").removeClass("changeColortitle");
        }
    });
});



// $(document).ready(function(){
//   let scroll_pos = 0;
//   $(document).scroll(function() {
//     scroll_pos = $(this).scrollTop();
//     if(scroll_pos < 100) {
//       $(".test").css('background-color', '#D4AF37');
//       $("h3").css('color','white')
//       $("h1").css('color','white')
//     } else {
//       $(".test").css('background-color', 'white');
//       $("h3").css('color', 'black')
//       $("h1").css('color','black')
//     }
//   });
// });
