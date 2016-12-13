$(function () {

    $("#product ul li").click(function () {
        var str = "<div id='myCarousel' class='carousel slide carousel-fit' data-ride='carousel' data-interval='60000'>" +
        "<ol class='carousel-indicators'>" +
            "<li data-target='#myCarousel' data-slide-to='0' class='active'></li>" +
            "<li data-target='#myCarousel' data-slide-to='1'></li>" +
            "<li data-target='#myCarousel' data-slide-to='2'></li>" +
            "</ol>" +
            "<div class='carousel-inner'>" +
            "<div class='item active'> " +
            "<img src='http://localhost:22644/image/scr/c_p1014754.jpg' />" +
            "<div class='carousel-caption'>" +
            "<h3>First slide label</h3>" +
            "<p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>" +
            "</div>" +
            "</div>" +
            "<div class='item'> " +
            "<img src='http://localhost:22644/image/scr/c_sam_1499.jpg' />" +
            "<div class='carousel-caption'>" +
            "<h3>Second slide label</h3>" +
            "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>" +
            "</div>" +
            "</div>" +
            "<div class='item'> " +
            "<img src='http://localhost:22644/image/scr/MKP1.JPG' />" +
            "<div class='carousel-caption'>" +
            "<h3>Third slide label</h3>" +
            "<p>Praesent commodo cursus magna, vel scelerisque nisl consectetur.</p></div></div></div><a class='left carousel-control' href='#myCarousel' data-slide='prev'><span class='glyphicon glyphicon-chevron-left'></span></a><a class='right carousel-control' href='#myCarousel' data-slide='next'><span class='glyphicon glyphicon-chevron-right'></span></a> </div>"
        $(".myModala").html(str);
        $('.carousel').carousel({
            interval: 5000
        });
    });

});


