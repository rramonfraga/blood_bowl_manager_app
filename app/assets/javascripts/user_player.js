(function main () {
  "use strict";

  $(document).on('change', '.js-player', function (event) {
    console.log("1");
    var $select = $(event.currentTarget);
    var playerId = $select.val();
    var request = $.get('/api/players/' + playerId);
    request.fail(function () {
    });

    request.done(function (player) {
      var htmlSkill = ""
      player.list_skills.forEach( function (skill) {
        htmlSkill = htmlSkill + skill + ", "
      });
      var htmlParts = [
        '<div class=" col-sm-2 ">',
        '  <div class="row">',
        '    <div class="field col-sm-3 ma">' + player.ma +'</div>',
        '    <div class="field col-sm-3 st">' + player.st +'  </div>',
        '    <div class="field col-sm-3 ag">' + player.ag +'</div>',
        '    <div class="field col-sm-3 av">' + player.av +'</div>',
        '  </div>',
        '</div>',
        '<div class="field col-sm-1 cost">' + player.cost + '</div>',
        '<div class="field col-sm-3 skill">' + htmlSkill +'</div>'
        ];

      $select.parent().next().html(htmlParts.join('\n'));
    });
  });


})();