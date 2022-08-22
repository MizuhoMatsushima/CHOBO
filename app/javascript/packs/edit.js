/* global $*/
  $(document).ready(function () {
	  total_price =  0;
	  current_detail_price = 0;
	  for(var i = 0; i < $(".detail_price").length; i++){
		  var detail_price = $(".detail_price").eq(i).val();
		  current_detail_price = current_detail_price + Number( detail_price );
	  }
    if( total_price != current_detail_price ){
      $('#bop_subject_price').val( current_detail_price );
      var pattern = /^\d*$/
      if ( pattern = ('#bop_subject_point') ){
        $('#bop_subject_total_price').val(current_detail_price );
      }
    }

	  var current_detail_price;
	  $(document).on('change','.detail_price',function() {
	    total_price =  $('#bop_subject_price').val();
		  current_detail_price = 0;
		  for(var i = 0; i < $(".detail_price").length; i++){
			  var detail_price = $(".detail_price").eq(i).val();
			  current_detail_price = current_detail_price + Number( detail_price );
		  }
      if( total_price != current_detail_price ){
        $('#bop_subject_price').val( current_detail_price );
        var pattern = /^\d*$/
        if ( pattern = ('#bop_subject_point') ){
          $('#bop_subject_total_price').val(current_detail_price );
        }
      }


      $('#bop_subject_point').change(function() {
        let total_detail_price = $('#bop_subject_price').val();
        let subject_point = $('#bop_subject_point').val();
        $('#bop_subject_total_price').val(total_detail_price-subject_point);
      });
	  });

});