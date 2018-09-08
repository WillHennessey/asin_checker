$.ajaxSetup({
    headers: {
        'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    }
});

$(document).ready(function(){
    $("button").click(function(){
        var asin = $("#asinInput").val();
        $.post("/check_asin", { asin: asin, format: 'js' });
    });
});