function onclickCourseDay(day){
  $(".way_list"+day).each(function(){
    $(this).toggleClass('d-none');
  });
};