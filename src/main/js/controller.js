$(function() {
    $('.date').each(function (index, dateElem) {
        var $dateElem = $(dateElem);
        $dateElem.text(moment.utc($dateElem.text()).fromNow());
    });
    $("#searchbox").autocomplete({
        source: "/xquery/suggest.xqy",
        minLength: 2
     });
    $("#search-go" )
        .button()
        .keypress(function(event) {
            var keycode = (event.keyCode ? event.keyCode : event.which);
            if(keycode == '13') {
            $("#searchform").submit();    
        }
        .click(function( event ) {
        /*event.preventDefault(); */
            $("#searchform").submit();
    });
    $("#searchbox").focus();
}); 