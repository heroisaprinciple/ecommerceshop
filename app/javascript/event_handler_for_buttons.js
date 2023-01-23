
$(document).ready(function(){
    $(".add-to-carts").click(function(){
        console.log('$button');
        $('.add-to-carts').addClass('active');

        setTimeout(function () {
            $('.add-to-carts').addClass('success');
        }, 3700);

        setTimeout(function () {
            $('.add-to-carts').removeClass('active');
            $('.add-to-carts').removeClass('success');
        }, 5000);
    });
});