$(document).ready(function() {

    var button = $("#commentButton");

    $.fn.scrollView = function () {
        return this.each(function () {
            $('html, body').animate({
                scrollTop: $(this).offset().top - 80
            }, 1000);
        });
    }

    button.on("click", function(event){
        event.preventDefault();
        $('.commentsTitle').scrollView();
    });

});