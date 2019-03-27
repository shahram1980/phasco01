/*jshint jquery:true */
/*global $:true */

var $ = jQuery.noConflict();



$(document).ready(function ($) {

   

    $('body').append('<div id="toTop" class="btn btn-info"><span class="fa fa-chevron-up"></span> بازگشت به اول صفحه</div>');
    $(window).scroll(function () {
        if ($(this).scrollTop() != 0) {
            $('#toTop').fadeIn();
        } else {
            $('#toTop').fadeOut();
        }
    });
    $('#toTop').click(function () {
        $("html, body").animate({ scrollTop: 0 }, 600);
        return false;
    });

    var current = location.pathname.toLowerCase();
    $('.navbar-nav li a').each(function () {

        var $this = $(this);
        var href = $this.attr('href').toLowerCase();

        // if the current path is like this link, make it active
        if (current.toLowerCase().indexOf(href) > -1) {
            $this.addClass('active');
        }

        if (current.indexOf("video") > -1 || current.indexOf("article") > -1 || current.indexOf("atlas") > -1 || current.indexOf("makequiz") > -1
            || current.indexOf("questionsbank") > -1 || current.indexOf("slideshow") > -1) {

            $("#elmi-menu").addClass('active');
        }
        if (current.indexOf("bazar") > -1) {
            $(".bazar-menu").addClass('active');
        }
        if (current.indexOf("faq") > -1) {
            $(".faq-menu").addClass('active');
        }

        if (current.indexOf("blog") > -1) {
            $(".blog-menu").addClass('active');
        }
    })
    function goBack() {
        window.history.back();
    }

    ul = $('#my-ul'); // your parent ul element
    ul.children().each(function (i, li) { ul.prepend(li) })



    $('body').persiaNumber();

    


    $('.carousel[data-type="multi"] .item').each(function () {
        var next = $(this).next();
        if (!next.length) {
            next = $(this).siblings(':first');
        }
        next.children(':first-child').clone().appendTo($(this));

        for (var i = 0; i < 3; i++) {
            next = next.next();
            if (!next.length) {
                next = $(this).siblings(':first');
            }

            next.children(':first-child').clone().appendTo($(this));
        }
    });
    "use strict";

    /*-------------------------------------------------*/
    /* =  portfolio isotope
    /*-------------------------------------------------*/

    var winDow = $(window);
    // Needed variables
    var $container = $('.portfolio-container');
    var $filter = $('.filter');

    try {
        $container.imagesLoaded(function () {
            $container.show();
            $container.isotope({
                filter: '*',
                layoutMode: 'masonry',
                animationOptions: {
                    duration: 750,
                    easing: 'linear'
                }
            });
        });
    } catch (err) {
    }

    winDow.bind('resize', function () {
        var selector = $filter.find('a.active').attr('data-filter');

        try {
            $container.isotope({
                filter: selector,
                animationOptions: {
                    duration: 750,
                    easing: 'linear',
                    queue: false,
                }
            });
        } catch (err) {
        }
        return false;
    });

    // Isotope Filter 
    $filter.find('a').click(function () {
        var selector = $(this).attr('data-filter');

        try {
            $container.isotope({
                filter: selector,
                animationOptions: {
                    duration: 750,
                    easing: 'linear',
                    queue: false,
                }
            });
        } catch (err) {

        }
        return false;
    });


    var filterItemA = $('.filter li a');

    filterItemA.bind('click', function () {
        var $this = $(this);
        if (!$this.hasClass('active')) {
            filterItemA.removeClass('active');
            $this.addClass('active');
        }
    });

    /*-------------------------------------------------*/
    /* =  fullwidth carousell
    /*-------------------------------------------------*/
    try {
        var fullCarousell = $("#owl-demo");
        fullCarousell.owlCarousel({
            navigation: true,
            afterInit: function (elem) {
                var that = this;
                that.owlControls.prependTo(elem);
            }
        });
    } catch (err) {

    }

    /*-------------------------------------------------*/
    /* =  fullwidth carousell
    /*-------------------------------------------------*/
    try {
        $.browserSelector();
        // Adds window smooth scroll on chrome.
        if ($("html").hasClass("chrome")) {
            $.smoothScroll();
        }
    } catch (err) {

    }

    /*-------------------------------------------------*/
    /* =  Scroll to TOP
    /*-------------------------------------------------*/

    var animateTopButton = $('.go-top'),
        htmBody = $('html, body');

    animateTopButton.click(function () {
        htmBody.animate({ scrollTop: 0 }, 'slow');
        return false;
    });

    /*-------------------------------------------------*/
    /* =  flexslider
    /*-------------------------------------------------*/
    try {

        var SliderPost = $('.flexslider');

        SliderPost.flexslider({
            animation: "slide",
            slideshowSpeed: 3000,
            easing: "swing",
            direction: "vertical"
        });
    } catch (err) {

    }

    /* ---------------------------------------------------------------------- */
    /*	Contact Map
    /* ---------------------------------------------------------------------- */
    var contact = { "lat": "51.51152", "lon": "-0.104198" }; //Change a map coordinate here!

    try {
        var mapContainer = $('.map');
        mapContainer.gmap3({
            action: 'addMarker',
            latLng: [contact.lat, contact.lon],
            map: {
                center: [contact.lat, contact.lon],
                zoom: 14
            },
        },
            { action: 'setOptions', args: [{ scrollwheel: true }] }
        );
    } catch (err) {

    }

    /* ---------------------------------------------------------------------- */
    /*	magnific-popup
    /* ---------------------------------------------------------------------- */

    try {
        // Example with multiple objects
        $('.zoom').magnificPopup({
            type: 'image'
        });
    } catch (err) {

    }

    try {
        // Example with multiple objects
        $('.zoom.video').magnificPopup({
            type: 'iframe'
        });
    } catch (err) {

    }

    /* ---------------------------------------------------------------------- */
    /*	Accordion
    /* ---------------------------------------------------------------------- */
    var clickElem = $('.accord-elem');

    clickElem.bind('hover', function (e) {
        e.preventDefault();

        var $this = $(this),
            parentCheck = $this.parents('.accord-elem'),
            accordItems = $('.accord-elem'),
            accordContent = $('.accord-content');

        if (!$this.hasClass('active')) {

            //accordContent.slideUp(400, function () {
            //    accordItems.removeClass('active');
            //});
            $this.find('.accord-content').slideDown(400, function () {
                $this.addClass('active');
            });
        }
        //} else {

        //    accordContent.slideUp(function () {
        //        accordItems.removeClass('active');
        //    });

        //}
    });

    clickElem.bind('mouseleave', function (e) {
        e.preventDefault();

        var $this = $(this),
            accordContent = $('.accord-content');

        if ($this.hasClass('active')) {

            $this.find('.accord-content').slideUp(function () {
                $this.removeClass('active');
            });

        }

    });

    /* ---------------------------------------------------------------------- */
    /*	Tabs
    /* ---------------------------------------------------------------------- */
    var clickTab = $('.tab-links li a');

    clickTab.bind('click', function (e) {
        e.preventDefault();

        var $this = $(this),
            hisIndex = $this.parent('li').index(),
            tabCont = $('.tab-content'),
            tabContIndex = $(".tab-content:eq(" + hisIndex + ")");

        if (!$this.hasClass('active')) {

            clickTab.removeClass('active');
            $this.addClass('active');

            tabCont.fadeOut(400);
            tabCont.removeClass('active');
            tabContIndex.delay(400).fadeIn(400);
            tabContIndex.addClass('active');
        }
    });

    /*-------------------------------------------------*/
    /* = slider Testimonial
    /*-------------------------------------------------*/

    var slidertestimonial = $('.bxslider');
    try {
        slidertestimonial.bxSlider({
            mode: 'vertical'
        });
    } catch (err) {
    }

    /*-------------------------------------------------*/
    /* = skills animate
    /*-------------------------------------------------*/

    var animateElement = $(".meter > span");
    animateElement.each(function () {
        $(this)
            .data("origWidth", $(this).width())
            .width(0)
            .animate({
                width: $(this).data("origWidth")
            }, 1200);
    });

    /*-------------------------------------------------*/
    /* =  Shop accordion
    /*-------------------------------------------------*/

    var AccordElement = $('a.accordion-link');

    AccordElement.bind('click', function (e) {
        e.preventDefault();
        var elemSlide = $(this).parent('li').find('.accordion-list-content');

        if (!$(this).hasClass('active')) {
            $(this).addClass('active');
            elemSlide.slideDown(200);
        } else {
            $(this).removeClass('active');
            elemSlide.slideUp(200);
        }
    });

    /*-------------------------------------------------*/
    /* =  price range code
    /*-------------------------------------------------*/

    try {

        for (var i = 100; i <= 10000; i++) {
            $('#start-val').append(
                '<option value="' + i + '">' + i + '</option>'
            );
        }
        // Initialise noUiSlider
        $('.noUiSlider').noUiSlider({
            range: [0, 1600],
            start: [0, 1000],
            handles: 2,
            connect: true,
            step: 1,
            serialization: {
                to: [$('#start-val'),
                $('#end-val')],
                resolution: 1
            }
        });
    } catch (err) {

    }

    /*-------------------------------------------------*/
    /* =  Single page
    /*-------------------------------------------------*/

    var windowHeight = $(window).height();
    $('.home-box').css('height', windowHeight);

    $(window).resize(function () {
        var windowHeight = $(window).height();
        $('.home-box').css('height', windowHeight);
    });

    /* ---------------------------------------------------------------------- */
    /*	Contact Form
    /* ---------------------------------------------------------------------- */

    //var submitContact = $('.submit_contact');

    //submitContact.on('click', function(e){
    //    e.preventDefault();

    //    var $this = $(this),
    //        message = $('.msg');

    //    if ( !$this.hasClass('main-form') ){

    //        $.ajax({
    //            type: "POST",
    //            url: 'contact.php',
    //            dataType: 'json',
    //            cache: false,
    //            data: $('.contact-work-form').serialize(),
    //            success: function(data) {

    //                if(data.info !== 'error'){
    //                    $this.parents('form').find('input[type=text],textarea,select').filter(':visible').val('');
    //                    message.hide().removeClass('success').removeClass('error').addClass('success').html(data.msg).fadeIn('slow').delay(5000).fadeOut('slow');
    //                } else {
    //                    message.hide().removeClass('success').removeClass('error').addClass('error').html(data.msg).fadeIn('slow').delay(5000).fadeOut('slow');
    //                }
    //            }
    //        });
    //    } else {

    //        message = $('.msg2');
    //        $.ajax({
    //            type: "POST",
    //            url: 'contact.php',
    //            dataType: 'json',
    //            cache: false,
    //            data: $('.contact-work-form2').serialize(),
    //            success: function(data) {

    //                if(data.info !== 'error'){
    //                    $this.parents('form').find('input[type=text],textarea,select').filter(':visible').val('');
    //                    message.hide().removeClass('success').removeClass('error').addClass('success').html(data.msg).fadeIn('slow').delay(5000).fadeOut('slow');
    //                } else {
    //                    message.hide().removeClass('success').removeClass('error').addClass('error').html(data.msg).fadeIn('slow').delay(5000).fadeOut('slow');
    //                }
    //            }
    //        });
    //    }
    //});

    /* ---------------------------------------------------------------------- */
    /*	Header animate after scroll
    /* ---------------------------------------------------------------------- */

    (function () {

        var docElem = document.documentElement,
            didScroll = false,
            changeHeaderOn = 200;
        document.querySelector('header');
        function init() {
            window.addEventListener('scroll', function () {
                if (!didScroll) {
                    didScroll = true;
                    setTimeout(scrollPage, 250);
                }
            }, false);
        }

        function scrollPage() {
            var sy = scrollY();
            if (sy >= changeHeaderOn) {
                $('header').addClass('active');
            }
            else {
                $('header').removeClass('active');
            }
            didScroll = false;
        }

        function scrollY() {
            return window.pageYOffset || docElem.scrollTop;
        }

        init();

    })();

});
