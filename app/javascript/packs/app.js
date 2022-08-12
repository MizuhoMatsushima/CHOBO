/* global $*/
$(document).ready(function () {
  console.log("test");
  $('.detail_price, .point').change(function() {
    let detail_price = $('.detail_price').val();
    console.log(detail_price)
    let point = $('.point').val();
    console.log(point)
    let sub_price = parseInt(detail_price);
    let sub_point = parseInt(point)|0;
    let total_price = sub_price - sub_point;
    $('.total_price').val(total_price);
  });

  $('.detail_price').change(function() {
    let detail_price = $('.detail_price').val();
    $('.detail_total_price').val(detail_price);
  });
});