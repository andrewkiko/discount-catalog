jQuery(document).ready(function() {
  jQuery('body').addClass('background_default');

  jQuery('.change_background').on('click', function () {
    if (jQuery('.background_default')) {
      jQuery('body').removeClass('background_default');
      jQuery('body').addClass('background-1');
    }
    if (jQuery('.background-1')) {
      console.log('test');
      jQuery('body').removeClass('background-1');
      jQuery('body').addClass('background-2 ');
    }
  });
});