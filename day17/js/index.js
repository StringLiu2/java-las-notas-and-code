var save = ['广东省','福建省','湖南省','广西省','湖北省','陕西省'],
 city= [
    ['广州市','潮州市','江门市','深圳市','佛山市','云浮市','惠州市','韶关市','河源市','汕头市','揭阳市','汕尾市'],
    ['福州市','龙岩市','厦门市','泉州市','三明市'],
    ['长沙市','常德市','怀化市','岳阳市','常宁市','永州市'],
    ['百色市','南宁市','桂林市','贵港市'],
    ['襄阳市','武汉市','咸宁市','襄阳市','天门市','荆州市'],
    ['西安市','延安市','商洛市','安康市','汉中市']
];
var city1 = {

};
$(function(){
    $('.save > option:gt(0)').remove();
    $(save).each(function(index,province){
        $('.save').append(
            "<option value = "+index+">"+province+"</option>"
        );
    });
});
$('.save').change(
    function(){
        $('.city > option:gt(0)').remove();
        $(city[$(this).val()]).each(
            function(index,cityLevel){
                $('.city').append(
                    "<option>"+cityLevel+"</option>"
                );
            }
        );
    }
);