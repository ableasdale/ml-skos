$(function() {
    $('.date').each(function (index, dateElem) {
        var $dateElem = $(dateElem);
        $dateElem.text(moment.utc($dateElem.text()).fromNow());
    });
    $("#searchbox").autocomplete({
        source: "/xquery/suggest.xqy",
        minLength: 2
     });
}); 