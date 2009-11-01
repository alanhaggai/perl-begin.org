function position_divs() {
    var client_w = document.body.clientWidth ;
    var width = client_w - 780;
    document.getElementById("js-site-name").style.left   = width / 2 + 20 + "px";
    document.getElementById("js-site-slogan").style.left = width / 2 + 20 + "px";
    // Commenting out because it no longer exists.
    // document.getElementById("js-nav-global").style.right = width / 2 - 20 + "px";
    if ( document.getElementById("right-sidebar") == null ) {
        document.getElementById("content").style.width = client_w - 250 + "px";
    }
    else {
        document.getElementById("content").style.width = client_w - 410 + "px";
    }
}

$(document).ready( function() {
        position_divs();
} );

$(window).resize( function() {
        position_divs();
} );
