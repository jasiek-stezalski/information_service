$(function() {

    $('.lesserPictureContainer').hover(
        function() {$('img',this).addClass('hover')},
        function() {$('img',this).removeClass('hover')});
});