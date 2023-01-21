
$(document).ready(function(){
    $(".add-to-cart").click(function(){
        console.log('$button');
        $('.add-to-cart').addClass('active');

        setTimeout(function () {
            $('.add-to-cart').addClass('success');
        }, 3700);

        setTimeout(function () {
            $('.add-to-cart').removeClass('active');
            $('.add-to-cart').removeClass('success');
        }, 5000);
    });
});