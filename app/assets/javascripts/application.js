// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require prototype
//= require rails-ujs
//= require_tree .
Event.observe(window, 'load', function () {
  array_net_votes = $$('.netVotes');
  max_net_votes = array_net_votes.max(function(net_votes) {return net_votes.innerHTML * 1;});
  max_net_votes = Math.abs(max_net_votes);
  if (max_net_votes == 0) {
    max_net_votes = 1;
  };
  array_net_votes.each(function(net_votes) {
    ratio = net_votes.innerHTML / max_net_votes;
    if (ratio > 0) {
      r = Math.round(255 - ratio * 100);
      g = Math.round(255 - ratio * 50);
      b = Math.round(255 - ratio * 100);
    } else {
      ratio = ratio * -1;
      r = Math.round(255 - ratio * 50);
      g = Math.round(255 - ratio * 100);
      b = Math.round(255 - ratio * 100);
    };
    net_votes.setStyle({backgroundColor: 'rgb('+r+','+g+','+b+')'});
  });
});

function beforeVote (item_id) {
  Element.hide('promoteDemote_' + item_id);
};

function afterVote (item_id, vote_value) {
  net_votes = $('netVotes_' + item_id);
  net_votes.innerHTML = net_votes.innerHTML * 1 + vote_value;
};
