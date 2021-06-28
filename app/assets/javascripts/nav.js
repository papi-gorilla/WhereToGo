// ハンバーガーメニューの表示
$(function(){
  $('.nav-icon').on('click', function(event) {
    $(this).toggleClass('active');
    $('.nav-menu').fadeToggle();
    event.preventDefault();
  });
});