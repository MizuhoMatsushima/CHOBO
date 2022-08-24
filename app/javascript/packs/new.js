/* global $*/
  $(document).ready(function () {
    var total_price = 0;
    if( $('#bop_subject_price').length ){
	    $('#bop_subject_price').val( total_price );
	    $('#bop_subject_total_price').val( total_price );
	    $('#bop_subject_point').val(0);
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

    $('.bop_group .bop_btn').click(function() {
    	var index = $('.bop_group .bop_btn').index(this);
    	$('.bop_group .bop_btn, .bop_group .bop_form').removeClass('active');
    	$(this).addClass('active');
    	$('.bop_form').eq(index).addClass('active');
    });

    if ($(".active").length == 3) {
      var index = $('.bop_group .bop_btn').index(this);
    	$('.bop_group .bop_btn, .bop_group .bop_form').removeClass('active');
    	$(this).addClass('active');
    	$('.bop_form').eq(index).addClass('active');
      $('#bop_subject_bop_payments').prop('checked', false);
      console.log(checked_false)
      if ($(".active").length == 2) {
        console.log(22)
        $('#bop_subject_bop_payments').prop('checked', true);
      }
    }

    // if ($("#bop_subject_bop_balance").prop("checked") == true) {
    //   $('#bop_subject_bop_payments').prop('checked', false);
    //   if ($("#bop_subject_bop_balance").prop("checked") == false) {
    //     $('#bop_subject_bop_payments').prop('checked', true);
    //   }
    // }
    // if ($("input[type=radio][name=bop_subject[bop]][value=balance]:checked").is(':checked')) {
    //   $('input[value="payments"]').prop('checked', false);
    // }
    // $('#new_balance_btn').click(function() {
    //   console.log(ckick_new)
    // 	$('.bop_group .bop_btn, .bop_group .bop_form').removeClass('active');
    // 	$(this).addClass('active');
    // 	$('.bop_form').eq(index).addClass('active');
    // });


});