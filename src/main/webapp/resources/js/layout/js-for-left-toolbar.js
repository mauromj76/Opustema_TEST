var leftMenuWidth;
$(document).ready(function(){
    leftMenuWidth=$('#left-menu').width();
    $('.container-menu').on('click', function(){
        $(this).expandCollapse();
    });
});
function openLeftMenu(){    
    var $mainContainer=$('#main-container');
    var $target=$('#left-menu'),
        animIn = function () {
            $target.addClass('active').show().css({
                left: -(leftMenuWidth)
            }).animate({
                left: 0
            }, 500);
            $mainContainer.css({
                left: 0
            }).animate({
                left: leftMenuWidth
            }, 500);
        };
        
    if($target.hasClass('active')) {
        $target.removeClass('active').animate({
            left: -leftMenuWidth
        }, 500);
        $mainContainer.animate({
            left: 0
        }, 500);
    }else{
        animIn();
    }   
}

function doRequest(url){
    
}

(function( $ ){
    $.fn.expandCollapse = function() {
        var div=$(this).next();
        if($(div).hasClass('expand')){
            $(div).slideUp(300, function(){
                $(div).addClass("hidden");
            });
            $(div).removeClass('expand').addClass('compress');
        }else{
            $(div).css({top:$('#left-menu').height()})
            $(div).css({left:$('#left-menu').position().left})
            $(div).removeClass("hidden");
            $(div).slideDown(300);
            $(div).removeClass('compress').addClass('expand');
        }
    }; 
})( jQuery );