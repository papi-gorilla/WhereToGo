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

//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require rails-ujs
//= require activestorage
// require turbolinks
//= require_tree .

function initMap(){
  var DS = new google.maps.DirectionsService();
  var DR = new google.maps.DirectionsRenderer();

  // Google mapを表示する
  var map = new google.maps.Map(document.getElementById("map"),{
    center: {lat: 35.170981, lng: 136.881556},
    zoom: 15
  });

  DR.setMap(map);

  // フォームに入力された情報から経路を表示する
  document.getElementById("course-btn").onclick = function search(){
    var departure = document.getElementById("departure").value;
    var arrival = document.getElementById("arrival").value;

    // 経由地1から8までの入力された情報を空の配列に入れる
    var waypoint = document.getElementsByClassName("waypoint");
    waypointlist = [];

    for (var i = 0; i<waypoint.length; i++){
      waypointlist.push({location: waypoint[i].value, stopover: true});
    };

    var request = {
      origin: departure,
      destination: arrival,
      waypoints: waypointlist,
      travelMode: google.maps.TravelMode.DRIVING
    };

    DS.route(request, function(result, status){
      DR.setDirections(result);
    });
  };
};

// 経由地のフォームを表示させる
var j = 1;
function addForm(){
  if (j < 9){
    $('#way-point-' + j).removeClass('d-none');
    $('#way-point-' + j).addClass('waypoint');
    j++ ;
  };
}