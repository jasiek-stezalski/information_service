$(function() {

    var stickySidebar = $('#menu').offset().top;

    $(window).scroll(function () {
        if ($(window).scrollTop() > stickySidebar) {
            $('#menu').addClass('affix');
            $('#container').addClass('affix2');
        }
        else {
            $('#menu').removeClass('affix');
            $('#container').removeClass('affix2');
        }
    });
});
