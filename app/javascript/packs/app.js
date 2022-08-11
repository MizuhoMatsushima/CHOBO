// $(document).ready(function () {
//   $('.detail_price').change(function() {
//     console.log("test");
//     let detail_price = $('.detail_price').val();
//     let point = $('.point').val();
//     let sub_price = parseInt(detail_price,10);
//     let sub_point = parseInt(point,10);
//     let total_price = sub_price - sub_point;
//     $('.total_price').val(total_price);
//   });
// });

$(document).ready(function () {
  console.log("test");
  $('.detail_price, .point').change(function() {
    let detail_price = $('.detail_price').val();
    console.log(detail_price)
    let point = $('.point').val();
    console.log(point)
    let sub_price = parseInt(detail_price);
    let sub_point = parseInt(point);
    let total_price = sub_price - sub_point;
    $('.total_price').val(total_price);
  });
});


/* global $*/
// $(document).ready(function () {
//   console.log("test");
//   $('.jquery').on('click', function(){
//     $(this).css('color','red');
//   });
// });