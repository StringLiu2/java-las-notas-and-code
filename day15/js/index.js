var img = document.getElementById('img1');
var i = 2;
document.getElementById('button').onclick=function(){
    setInterval(function(){
        if(i>3){
           i = 1;
        }else{
            img.src = './image/'+i+'.jpg';
            i++;
        }
    },2000);
}
var clock = document.getElementsByClassName('clock')[0];
var height = clock.offsetHeight;
var heigthAdd=0;
var drop = document.getElementById('drop');
var heightMinus=0;
clock.style.height = '0px';
setInterval(
    function(){
        clock.style.height = ((heigthAdd++)%height)+'px';
    }
,800);
setInterval(
    function(){
        drop.style.top=heightMinus+++'px';
        if(heightMinus == height-heigthAdd%height){
            heightMinus=0;
        }
    }
,1);