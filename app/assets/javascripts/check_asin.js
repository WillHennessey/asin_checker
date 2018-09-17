$.ajaxSetup({
    headers: {
        'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    }
});

$(document).ready(function(){
    $('#submitButton').click(function(){
        var asin = $("#asinInput").val();
        $.post("/check_asin", { asin: asin, format: 'js' });
    });

    $('#asinInput').keypress(function(e) {
        if(e.which == 13) {
            var asin = $("#asinInput").val();
            $.post("/check_asin", { asin: asin, format: 'js' });
            return false;
        }
    });

    $('#resetButton').click(function() {
        console.log('here');
       $('#asinInput').val('');
       $('.result-row').hide();
    });
});