$(function() {
    function ratingEnable() {        
		
		$('.starrating').each(function (e){
			var currentRating = $(this).data('current-rating');

			$('.starrating .current-rating')
				.find('span')
				.html(currentRating);

			$('.starrating .clear-rating').on('click', function(event) {
				event.preventDefault();

				$('#starrating')
					.barrating('clear');
			});
			
			$(this).barrating({
				theme: 'fontawesome-stars-o',
				showSelectedRating: false,
				initialRating: currentRating,
				onSelect: function(value, text) {
					if (!value) {
						$(this)
							.barrating('clear');
					} else {
						$('.stars-starrating .current-rating')
							.addClass('hidden');

						$('.stars-starrating .your-rating')
							.removeClass('hidden')
							.find('span')
							.html(value);
					}
				},
				onClear: function(value, text) {
					$('.stars-starrating')
						.find('.current-rating')
						.removeClass('hidden')
						.end()
						.find('.your-rating')
						.addClass('hidden');
				}
			});
		});

        // $('.starrating').barrating({
            // theme: 'fontawesome-stars-o',
            // showSelectedRating: false,
            // initialRating: currentRating,
            // onSelect: function(value, text) {
                // if (!value) {
                    // $('#starrating')
                        // .barrating('clear');
                // } else {
                    // $('.stars-starrating .current-rating')
                        // .addClass('hidden');

                    // $('.stars-starrating .your-rating')
                        // .removeClass('hidden')
                        // .find('span')
                        // .html(value);
                // }
            // },
            // onClear: function(value, text) {
                // $('.stars-starrating')
                    // .find('.current-rating')
                    // .removeClass('hidden')
                    // .end()
                    // .find('.your-rating')
                    // .addClass('hidden');
            // }
        // });
    }

    function ratingDisable() {
        $('select').barrating('destroy');
    }

    $('.rating-enable').click(function(event) {
        event.preventDefault();

        ratingEnable();

        $(this).addClass('deactivated');
        $('.rating-disable').removeClass('deactivated');
    });

    $('.rating-disable').click(function(event) {
        event.preventDefault();

        ratingDisable();

        $(this).addClass('deactivated');
        $('.rating-enable').removeClass('deactivated');
    });

    ratingEnable();
});
