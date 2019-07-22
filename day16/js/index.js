// $(function(){
//     $('.box').hide(2000);
//     $('.box').show(2000);
//     $('.box').slideUp(2000);
//     $('.box').slideDown(3000);
//     $('.box').animate(
//         {
//             width:'200px',
//             height:'200px'
//         },
//         4000
//     );
//     $('.box').animate(
//         {
//             width:'0px',
//             height:'0px'
//         },
//         4000
//     );
// });


// var boxWidth = 100 , boxHeight = 100;
// $('.box').click(function () { 
//     setInterval(function(){
//         boxWidth+=100;
//         boxHeight+=100;
//         $('.box').css({
//             background:'rgba(red, green, blue, alpha)',
//             width:boxWidth+'px',
//             height:boxHeight+'px'
//         });
//         if(boxWidth == 300 &&boxHeight == 300){
//             boxWidth = 100;
//             boxHeight  = 100;
//         }
//     },2000);
// });
//层级选择器
$('.button').click(
    function(){
        $('.box2 ~ div').css('background','red');
    }
);
//在p标签内部添加input的所有value内容
$("p").append( $("input").map(function(){
    return $(this).val();
  }).get().join(", ") );