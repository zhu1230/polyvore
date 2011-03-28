$(window).load(function(){
	var top=$('.set').position().top+40;
	var left=$('.set').position().left+40;
	// top=222;
	// left=148;
	// alert(top+"|"+left);
$('.set div.img').each(function(){

	var top2=$(this).css('top');
	var left2=$(this).css('left');
	// alert(top2.substring(top2.length-2)+"|"+left2.substring(left2.length-2));
	 // alert(top2);
	// alert()
	// alert(top+"|"+top2+"|"+(top+split_px(top2)));
	// alert(left+split_px(left2));
	$(this).css('top',top+split_px(top2)).css('left',left+split_px(left2));
		fnSetRotation(this,$(this).attr('angle'));
	$('.set div.img').hover(function(){
		$(this).addClass('imgover');
	},function(){$(this).removeClass('imgover');});
	
	
});
if($('#upload').size()!=0){
	$('.set').css('height',400);}
$('.write_comment form').submit(function(event){
	$.post($(this).attr('action'),$(this).serialize(),function(data){
		// alert(data);
		$('.write_comment').before(data);
		$('.comments .comment').last().effect('highlight');
		// alert($('.write_comment').parent().html());
	});
	// event.preventDefault();
	return false;
});

$('.vote-up-off').click(function(){
	var id=$(".vote input[type='hidden']").val();
	$.ajax({url:'/sets/'+id+"/voteup",success:function(data){
		if(data=='ok'){
			$('.vote .vote-count-post').html(function(){
				return parseInt($(this).html())+1;
			});
		}else if(data == 'already')
		{
			jAlert('You have already voted for this set!');
		}else{
			jAlert(data);
		}
	}});
});
$('.vote-down-off').click(function(){
	var id=$(".vote input[type='hidden']").val();
	$.ajax({url:'/sets/'+id+"/votedown",success:function(data){
		if(data=='ok'){
		$('.vote .vote-count-post').html(function(){
			return parseInt($(this).html())-1;
		});
	}else if(data == 'already')
	{
		jAlert('You have already voted for this set!');
	}else{
			jAlert(data);
		}
	}});
});
	
});
function split_px(str){
	var s2=parseInt(str.substring(0,str.indexOf('px')));
	// alert(s2);
	return s2;
}