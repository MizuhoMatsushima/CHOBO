/* global $*/
// $(document).ready(function () {
//   console.log("test");
//   $('.detail_price, .point').change(function() {
//     let detail_price = $('.detail_price').val();
//     console.log(detail_price)
//     let point = $('.point').val();
//     console.log(point)
//     let sub_price = parseInt(detail_price);
//     let sub_point = parseInt(point)|0;
//     let total_price = sub_price - sub_point;
//     $('.total_price').val(total_price);
//   });

  $(document).ready(function () {
    console.log("test2");
    if( $('.total-price').length ){
	var total_price = 0;
	$('.total_price').html( total_price );
	var current_detail_price = 0;
	$("detail_price").change(function() {
		if( countTimer !== null ){ clearInterval(countTimer); }
		current_detail_price = 0;
		for(var i = 0; i < $("detail_price").length; i++){
			var detail_price = $("detail_price").eq(i).val();
			current_detail_price = current_detail_price + Number( detail_price );
		}
        var counter = setInterval(function(){
            if( total_price != current_detail_price ){
                if( total_price > current_detail_price ){
                    total_price = total_price - Math.round((total_price - current_detail_price) / 2);
                    $('.total_price').html( total_price );
                }
				if( total_price < current_detail_price ){
                    total_price = total_price + Math.round((current_detail_price - total_price) / 2);
                    $('.total_price').html( total_price );
                };
            }else{
                clearInterval( counter );
            }
        }, 17);
	});
}


  $('.detail_price').change(function() {
    let detail_price = $('.detail_price').val();
    $('.detail_total_price').val(detail_price);
  });
});