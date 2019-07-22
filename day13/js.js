var select = document.getElementById("d1");
select.onchange = function(){
	
	var v = select.value;
	
	switch(v){
		case 'gd':
			var area = document.getElementById("d2");
			area.innerHTML = 
				'<option>广州</option>'+
				'<option>江门</option>'+
				'<option>潮州</option>';
			break;
		case 'gx':
			var area = document.getElementById("d2");
			
			area.innerHTML = 
				'<option>桂林</option>'+
				'<option>不知道</option>'+
				'<option>不懂</option>';
			break;
		case 'fj':
			var area = document.getElementById("d2");
			
			area.innerHTML = 
				'<option>厦门</option>'+
				'<option>福州</option>'+
				'<option>龙岩</option>';
			break;
			
			
	}
}