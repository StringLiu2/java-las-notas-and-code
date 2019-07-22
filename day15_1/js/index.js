//隔行换色
var table = document.getElementById('table'),
arr = table.rows;
for(var i = 0;i<arr.length;i++) 
    arr[i].bgColor = i%2 == 0? '#888888':'white';

//多选
// var checkbox =  document.getElementById('checkbox'),
// check = document.getElementsByName('check');
//jq实现全选
$('#checkbox').click(function () {
    // for(var i=0;i<check.length;i++)
    //     check[i].checked =  checkbox.checked;
$('td input').prop('checked', $('#checkbox').prop('checked'));
});