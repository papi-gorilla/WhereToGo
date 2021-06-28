function onclickCourseDay(day){
  $(".way_list"+day).each(function(){
    $(this).toggleClass('d-none');
  });

  $(".to"+day).each(function(){
    $(this).toggleClass('d-none');
  });

  $(".arrival"+day).each(function(){
    $(this).toggleClass('d-none');
  });

  $(".departure"+day).each(function(){
    $(this).toggleClass('d-none');
  });

  var DS = new google.maps.DirectionsService();
  var DR = new google.maps.DirectionsRenderer();

  var map = new google.maps.Map(document.getElementById("map"),{
    center: {lat: 35.170981, lng: 136.881556},
    zoom: 15
  });

  DR.setMap(map);

  var dchild = document.getElementsByClassName("d"+day);
  var achild = document.getElementsByClassName("a"+day);
  var wchild = document.getElementsByClassName("w"+day);
  waypointlists = [];

  for (var i = 0; i<wchild.length; i++){
    waypointlists.push({location: wchild[i].innerHTML, stopover: true});
  };

  var requests = {
    origin: dchild[0].innerHTML,
    destination: achild[0].innerHTML,
    waypoints: waypointlists,
    travelMode: google.maps.TravelMode.DRIVING
  };

  DS.route(requests, function(result, status){
    DR.setDirections(result);
  });
};