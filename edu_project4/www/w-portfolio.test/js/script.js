function Prepare() {
    if ('\v'=='v') {
        $('#v-line').hide();
        $('.content img').css('width','550px');        
    }
    
    $('.content img').hide();
    
    $('#menu li').click(function() {
        $('#menu li').removeClass('selected');
        $(this).addClass('selected');
        var div=$(this).attr('data-div');
        $('.content').hide();
        $('.content[data-div='+div+']').fadeIn(500);
    });
    
    $('.content .image').click(function() {
        $(this).next().slideToggle();
    });

    $('#main-menu a').removeClass('selected');
    var url=document.documentURI;
    if (url.indexOf('practice')!=-1)
        $('#a-practice').addClass('selected');
    else if (url.indexOf('contact')!=-1)
        $('#a-contact').addClass('selected');
    else $('#a-index').addClass('selected');

}