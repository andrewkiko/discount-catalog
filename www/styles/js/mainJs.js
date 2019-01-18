jQuery(document).ready(function() {
  // jQuery('body').addClass('background_default');

  jQuery('.change_background').on('click', function () {
    var bodyClass = jQuery('body').attr('class');
    if (bodyClass == 'background_default') {
      jQuery('body.background_default').addClass('background-1').removeClass('background_default');

    }
    else if (bodyClass == 'background-1'){
      jQuery('body').removeClass('background-1');
      jQuery('body').addClass('background-2');
    }
    else if (bodyClass == 'background-2'){
      jQuery('body').removeClass('background-2');
      jQuery('body').addClass('background-3');
    }
    else {
      jQuery('body').removeClass('background-3');
      jQuery('body').addClass('background_default');
    }
  });
});
//