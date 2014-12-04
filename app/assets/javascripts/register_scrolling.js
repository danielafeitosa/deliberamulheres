/*** Register and update Scrolledheight for CSS *****************************/
function registerScrolling() {
  var doc = jQuery(document.documentElement);
  var scrollTop = jQuery(document).scrollTop();
  if(scrollTop<1) doc.addClass('not-scrolled').removeClass('scrolled');
  else doc.addClass('scrolled').removeClass('not-scrolled');
  for ( var i=10; i<=500; i+=10 ) {
    doc.removeClass('scrolled-gt'+i).removeClass('scrolled-lt'+i);
    if (scrollTop<i) doc.addClass('scrolled-lt'+i);
    else doc.addClass('scrolled-gt'+i);
  }
}
registerScrolling(); // run now and init the right layout size
jQuery(registerScrolling); // run onload, and adjust to the scroll
jQuery(document).bind('scroll', registerScrolling); // run when page scroll
