$(document).ready(function () {
  $('.detail_price').change(function() {
    var detail_price = $('.detail_price').val();
    var point = $('.point').val();
    var sub_price = parseInt(detail_price);
    var sub_point = parseInt(point);
    var total_price = sub_price - sub_point
    $('.total_price').val(total_price)
  });
});

/* global $*/
$(document).ready(function () {
  $('.jquery').on('click', function(){
    $(this).css('color','red');
  });
});