function onclickCourseDay(day){
  $(".way_list"+day).each(function(){
    $(this).toggleClass('d-none');

    const DSs = new google.maps.DirectionsService();
    const DRs = new google.maps.DirectionsRenderer();

    const departures = document.getElementsByClassName("departure"+day).value;
    const arrivals = document.getElementsByClassName("arrival"+day).value;

    const requests = {
      origin: departures,
      destination: arrivals,
      travelMode: google.maps.TravelMode.DRIVING
    };

    DSs.route(requests, function(result, status){
      DRs.setDirections(result);
    });

  });
};

// function onclickCourseDay(day){
//   $(".way_list"+day).each(function(){
//     $(this).toggleClass('d-none');

//   });
// };

// function initMap(){
//   const DS = new google.maps.DirectionsService();
//   const DR = new google.maps.DirectionsRenderer();

//   // Google mapを表示する
//   const map = new google.maps.Map(document.getElementById("map"),{
//     center: {lat: 35.170981, lng: 136.881556},
//     zoom: 15
//   });

//   DR.setMap(map);

//   // フォームに入力された情報から経路を表示する
//   document.getElementById("course-btn").onclick = function search(){
//     const departure = document.getElementById("departure").value;
//     const arrival = document.getElementById("arrival").value;

//     // 経由地1から8までの入力された情報を空の配列に入れる
//     const waypoint = document.getElementsByClassName("waypoint")
//     waypointlist = [];

//     for (var i = 0; i<waypoint.length; i++){
//       waypointlist.push({location: waypoint[i].value, stopover: true});
//     };

//     const request = {
//       origin: departure,
//       destination: arrival,
//       waypoints: waypointlist,
//       travelMode: google.maps.TravelMode.DRIVING
//     };

//     DS.route(request, function(result, status){
//       DR.setDirections(result);
//     });
//   };
// };