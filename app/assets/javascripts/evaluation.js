// when the page is ready for manipulation
$(document).ready(function () {
    var page = 1;
    // when the load more link is clicked
    $('a.load-more').click(function (e) {
        page += 1;
        var url =  window.location.href
        var order = purl(url).param().order
        // prevent the default click action
        e.preventDefault();

        // hide load more link
        $('.load-more').hide();

        // show loading gif
        $('.loading-gif').show();

        // make an ajax call passing along our last user id
        $.ajax({

            // make a get request to the server
            type: "GET",
            // get the url from the href attribute of our link
            url: $(this).attr('href'),
            // send the last id to our rails app
            data: {
                page:  page,
                order: order
            },
            // the response will be a script
            dataType: "script",

            // upon success
            success: function () {
                // hide the loading gif
                $('.loading-gif').hide();
                // show our load more link
                $('.load-more').show();
            }
        });

    });
});