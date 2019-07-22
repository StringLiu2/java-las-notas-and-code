var i = 1,
//自动轮播图
clock = setInterval('rotate(1)',2000),
//图片切换方法
rotate = function(num){
    i+=num;
    if(0 == i%6) num==1?i=1:i=5;
    // img.src="./image/"+(i%6)+".jpg";
    $("#img").attr("src","./image/"+(i%6)+".jpg");
    radius();
};
var radius = function(){
    for(var j = 0;j < $('.list li').length;j++){
        $('.list li').get(j).style.backgroundColor = i == j+1? 'orangered': 'rgb(97, 94, 94)';
    }
}
$('.list li').get(i-1).style.backgroundColor = 'orangered';
//点击事件
$('#arrow-left').click(
    function(){
        rotate(-1);
    });
$('#arrow-right').click(
    function(){
        rotate(1);
    }
);
//鼠标移入
$('#box').mouseover(
    function(){
        clearInterval(clock);
        $('#arrow-left').css('display','inline');
        $('#arrow-right').css('display','inline');
    }
);
//鼠标移出
$('#box').mouseleave(
    function(){
        clock = setInterval('rotate(1)',2000);
        $('#arrow-left').css('display','none');
        $('#arrow-right').css('display','none');
    }
);
//点击小图标切换图片。
for(var select = 0;select<$('.list li').length;select++){
    liSelect(select);
}
// li.forEach(ele,index){
//     liSelect(index);
// };
function liSelect(select){
    $('.list li').get(select).click(function(){
        $('.list li').get(select).style.backgroundColor = 'orangered';
        for(var j  = 0;j< $('.list li').length;j++){
            if(j != select){
                $('.list li').get(j).style.backgroundColor = 'rgb(97, 94, 94)';
                $("#img").attr("src","./image/"+(select+1)+".jpg");
                // img.src="./image/"+(select+1)+".jpg";
            }
            i = select+1;
        }
    });
}