/* global $*/
  $(document).ready(function () {
	  total_price =  0;
	  current_detail_price = 0;
	  for(var i = 0; i < $('.detail_price').length; i++){
		  var detail_price = $('.detail_price').eq(i).val();
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
		  for(var i = 0; i < $('.detail_price').length; i++){
			  var detail_price = $('.detail_price').eq(i).val();
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

	  $('.bop_group .bop_btn').click(function() {
    	var index = $('.bop_group .bop_btn').index(this);
    	$('.bop_group .bop_btn, .bop_group .bop_form').removeClass('active');
    	$(this).addClass('active');
    	$('.bop_form').eq(index).addClass('active');
    });

    if ( $('#edit_bop').length ){
        var bop = $('#edit_bop').attr('data-type');
        if ( bop == 'balance'){
          $('#tab_balance').addClass('active');
          $('#tab_payment').removeClass('active');
        	$('#payment_form').removeClass('active');
        	$('#balance_form').addClass('active');
        }
        if ( bop == 'payments'){
          $('#tab_balance').removeClass('active');
          $('#tab_payment').addClass('active');
        	$('#payment_form').addClass('active');
        	$('#balance_form').removeClass('active');
        }
    };

});