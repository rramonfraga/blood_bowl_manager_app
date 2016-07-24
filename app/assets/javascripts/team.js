(function main () {
  "use strict";

function calculate_treasury() {
  var treasury = $('.js-treasury').data("treasury");

  $('.js-cost').each( function () {
    treasury = treasury - this.dataset.cost;
  });

  $('.js-treasury').val(treasury);
}

$(document).on('change', '.js-team-selector', function (event) {
  var $select = $(event.currentTarget);
  var teamId = $select.val();
  var request = $.get('/api/templates/teams/' + teamId);
  
  request.fail(function () {
    alert("Couldn’t find this team. Try later.")
  });

  request.done(function (team) {
    var htmlPlayer = ""

    $('.js-player-selector').empty();
    $('.js-player-attributes').find('.field').empty();
    $('.js-cost').attr('data-cost', 0);
    $('.js-player-selector').append( $('<option></option>'));
    team.players.forEach( function (player) {
      $('.js-player-selector').append($('<option value='+ player.id +'>'+ player.title +'</option>'));
    });

    calculate_treasury();

  });
});

$(document).on('change', '.js-player-selector', function (event) {
  var $select = $(event.currentTarget);
  var playerId = $select.val();
  var request = $.get('/api/templates/players/' + playerId);
  
  request.fail(function () {
    alert("Couldn’t find this player. Try later.")
  });

  request.done(function (player) {
    var htmlSkill = "";
    player.skills.forEach( function (skill) {
      htmlSkill = htmlSkill + '<a href="#" class="js-skill" data-skill-id="' + skill.id + '">' +skill.name + "</a>, "
    });
    htmlSkill = htmlSkill.slice(0, -2);

    $select.closest('.js-player').find('.js-player-attributes').find('.field').empty();
    $select.closest('.js-player').find('.js-ma').append(player.st);
    $select.closest('.js-player').find('.js-st').append(player.st);
    $select.closest('.js-player').find('.js-ag').append(player.ag);
    $select.closest('.js-player').find('.js-av').append(player.av);
    $select.closest('.js-player').find('.js-cost').attr('data-cost', player.cost);
    $select.closest('.js-player').find('.js-cost').append(player.cost);
    $select.closest('.js-player').find('.js-skills').append(htmlSkill);

    calculate_treasury();

  });
});


$(document).on('click', '.js-skill', function (event){
  var $select = $(event.currentTarget);
  var skillId = $select.data("skill-id");
  var request = $.get('/api/templates/skills/' + skillId);

  request.fail(function () {
    alert("Couldn’t find the skills. Try later.")
  });

  request.done(function (skill) {
    $(".modal-title").html($("<p>"+ skill.name +"</p>"));
    $(".modal-body").html($('<p><i>"'+ skill.description +'"<i></p>'));
    $("#smallModal").modal("show");
  });
});

})();