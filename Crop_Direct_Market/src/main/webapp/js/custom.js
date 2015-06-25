(function ($) {

	new WOW().init();
	
	/* ////////////////////////// nivoLightbox ////////////////////////// */
	$('.owl-carousel .item a').nivoLightbox({
		effect: 'fadeScale',                        // Effect when showing lightbox
		theme: 'default',                           // Theme to use
		keyboardNav: true,                          // Enable/Disable keyboard(left/right/escape) navigation
		clickOverlayToClose: true,                  // false restrict to click the "close" to close lightbox
		onInit: function(){},                       // Lightbox has loaded
		beforeShowLightbox: function(){},           // Before the lightbox is shown
		afterShowLightbox: function(lightbox){},    // After the lightbox is shown
		beforeHideLightbox: function(){},           // Before the lightbox is hidden
		afterHideLightbox: function(){},            // After the lightbox is hidden
		onPrev: function(element){},                // When the lightbox gallery goes to previous item
		onNext: function(element){},                // When the lightbox gallery goes to next item
		errorMessage: 'The requested content cannot be loaded. Please try again later.' // Error message when content can't be loaded
	});



	/* ////////////////////////// owlCarousel ////////////////////////// */
	$('#owl-works').owlCarousel({
            items : 4,
            itemsDesktop : [1199,5],
            itemsDesktopSmall : [980,5],
            itemsTablet: [768,5],
            itemsTabletSmall: [550,2],
            itemsMobile : [480,2],
        });
	
	/* ////////////////////////// Collapse navbar on scroll ////////////////////////// */
	$(window).scroll(function() {
		if ($(".navbar").offset().top > 50) {
			$(".navbar-fixed-top").addClass("top-nav-collapse");
		} else {
			$(".navbar-fixed-top").removeClass("top-nav-collapse");
		}
	});
	
	/* ////////////////////////// Page scroll ////////////////////////// */
	$(function() {
		$('.navbar-nav li a').bind('click', function(event) {
			var $anchor = $(this);
			$('html, body').stop().animate({
				scrollTop: $($anchor.attr('href')).offset().top
			}, 1500, 'easeInOutExpo');
			event.preventDefault();
		});
		$('.page-scroll a').bind('click', function(event) {
			var $anchor = $(this);
			$('html, body').stop().animate({
				scrollTop: $($anchor.attr('href')).offset().top
			}, 1500, 'easeInOutExpo');
			event.preventDefault();
		});
	});

        if ($('#parallax1').length  || $('#parallax2').length)
        {
			$(window).stellar({
				responsive:true,
                scrollProperty: 'scroll',
                parallaxElements: false,
                horizontalScrolling: false,
                horizontalOffset: 0,
                verticalOffset: 0
            });

        }
})(jQuery);
