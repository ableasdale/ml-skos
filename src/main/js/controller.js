$(function() {
    // Initialise search
    var request = $.ajax({
        url : "/xquery/populate.xqy",
        type : "get",
        dataType : "html"
     });
    request.done(function (response, textStatus, jqXHR) {
        $("#recent-concepts-table > tbody").html(response);
        $('.date').each(function (index, dateElem) {
            var $dateElem = $(dateElem);
            $dateElem.text(moment.utc($dateElem.text()).fromNow());
        });
    });

    
    $("#searchbox").autocomplete({
        source: "/xquery/suggest.xqy",
        minLength: 2
     });
    $("#search-go" )
        .button()
        .click(function( event ) {
        /*event.preventDefault(); */
            $("#searchform").submit();
    });
    
    $("#search-go" )
        .keypress(function(event) {
            var keycode = (event.keyCode ? event.keyCode : event.which);
            if(keycode == '13') {
            $("#searchform").submit();    
        }
    });  
       
    $('.pagination').jqPagination({
        max_page : Math.ceil(parseInt($('#total').text()) / 20),
        paged: function(page) {
      
            var request = $.ajax({
                url : "/xquery/populate.xqy?p=" + page,
                type : "get",
                dataType : "html"
            /*    success: function(respose, textStatus, jqXHR) {console.log(response)} */
            });
        
            request.done(function (response, textStatus, jqXHR) {
            
            $("#recent-concepts-table > tbody").html(response);
            $('.date').each(function (index, dateElem) {
                var $dateElem = $(dateElem);
                $dateElem.text(moment.utc($dateElem.text()).fromNow());
            });
        });        
        
        }
});
    $("#searchbox").focus();
    $("search\\:highlight").css('background-color', 'yellow');
}); 
