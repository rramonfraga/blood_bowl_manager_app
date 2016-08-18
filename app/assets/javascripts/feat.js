(function main () {
  "use strict";

$(document).on('change', '.js-kind-selector', function (event) {
  var $select = $(event.currentTarget);
  var feat = $select.val();

  if( feat == 'injury' ){
    $('.js-casuality-selector').prop('disabled', false);
  }else{
    $('.js-casuality-selector').value = "";
    $('.js-casuality-selector').prop('disabled', true);
  };

});

})();