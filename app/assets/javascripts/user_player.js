(function main () {
  "use strict";

  $(document).on('change', '.js-player', function (event) {
    var $select = $(event.currentTarget);
    var playerId = $select.val();
    var request = $.get('/api/templates/players/' + playerId);
    
    request.fail(function () {
      alert("Couldn’t find this player. Try later.")
    });

    request.done(function (player) {
      var htmlSkill = ""

      player.skills.forEach( function (skill) {
        htmlSkill = htmlSkill + '<a href="#" class="js-skill" data-skill="' + skill + '">' +skill.name + "</a>, "
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
        '<div class="field col-sm-1 js-cost" data-cost="' + player.cost + '" >' + player.cost + '</div>',
        '<div class="field col-sm-3">' + htmlSkill +'</div>'
        ];


      $select.parent().next().html(htmlParts.join('\n'));
      $('.js-treasury').html(calculate_treasury());

    });
  });
  
  function calculate_treasury() {
    var treasury = $('.js-treasury').data("treasury");

    $('.js-cost').each( function () {
      treasury = treasury - this.dataset.cost;
    });

    return treasury;
  }

  $(document).on('click', '.js-skill', function (event){
      var self = this;
      var $select = $(event.currentTarget);
      var skillName = $select.data("skill");
      var request = $.get('/api/templates/skills/');

      request.fail(function () {
        alert("Couldn’t find the skills. Try later.")
      });

      request.done(function (skills) {
        var skillDescription

        skills.forEach( function (skill) {
          if (skill.name === skillName){
            skillDescription = skill.description;
          }
        });

        $(".modal-title").html($("<p>"+ skillName +"</p>"));
        $(".modal-body").html($('<p><i>"'+ skillDescription +'"<i></p>'));
        $("#smallModal").modal("show");
      });
    });
    
    

})();