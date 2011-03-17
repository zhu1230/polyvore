$(
	function(){
		$('#category').change(function(){
			$.ajax('/products/cagegory_mix',{
				data:'id='+$('#category').val(),
				success:function(data){
					$('#items_content').html(data);
					// paginate_ajax();
					drag_and_drop();
				}
			})
		
		});

		
		
		
	paginate_ajax();
	drag_and_drop();
	$(".dropimg").click(function(){
		// alert($(this).find(".active"));
		$(this).find(".active").removeClass("active");
	});
	// $(".dragged").live('click',function(){
	// 	this.addClass('active')
	// });

	
	
	
	$('.rotateh_img').live('click',function(){
		var av=(parseInt($('.active').attr('angle')) || 0)+45;
		$('.active').rotate({angle:av});
		$('.active').attr('angle',av)
		
		// $('.active').rotateLeft();
		return false;
	});
	$('.rotatev_img').live('click',function(){
		var av=(parseInt($('.active').attr('angle')) || 0)-45;
		$('.active').rotate({angle:av});
		$('.active').attr('angle',av)
		// $('.active').rotateRight(45);
		return false;
	});
	$('.remove_img').live('click',function(){
		
		// $('.active').rotate(-45);
		$('.active').remove();
		return false;
	});
	$('.new_img').live('click',function(){
		// $('.active').rotate(-45);
		$('.dropimg').empty();
		// $('.active').rotateRight(45);
		return false;
	});
	$('.zoomin_img').live('click',function(){
	 var nw=$('.active').attr('width')/2;
	var nh=$('.active').attr('height')/2;
		$('.active').animate({width: nw,height: nh},700);
		$('.active').parent().css('width',nw);
		$('.active').parent().css('height',nh);
	});
	$('.zoomout_img').live('click',function(){
	 var nw=$('.active').attr('width')*2;
	var nh=$('.active').attr('height')*2;
		$('.active').animate({width: nw,height: nh},700);
		$('.active').parent().css('width',nw);
		$('.active').parent().css('height',nh);
	});
});
	
function paginate_ajax() {
	$('.pagination a').live('click',function(){  
		            $.ajax(this.href,{
			success:function(data){
				$('#items_content').html(data);
				// paginate_ajax();
			}
		});  
		

		            return false;  
		    });
}
function drag_and_drop() {
	$('.dropimg').droppable({ drop: function(event, ui) { 
		
		if(ui.draggable.hasClass('dragged'))
		{
			// alert("111");
		}
		else
		{
			var clone = $(ui.helper).clone();
			clone.appendTo(this);
			// 	clone.resizable({ghost:true,autoHide: true ,handles:'all' });
				clone.resizable({ghost:true,autoHide: true ,handles:'all' }).parent('.ui-wrapper').draggable({clone:false}).addClass('dragged').removeClass('ui-draggable-dragging');
				clone.removeClass('ui-draggable-dragging');
				clone.click(function(event){
					$('.dropimg .active').removeClass('active');
					clone.addClass('active');
					 event.stopPropagation();
				});
				$('.dropimg .active').removeClass('active');
				clone.addClass('active');
				// alert("222");
			    // clone
				// clone.addClass('dragged');
				
			    // this assumes the mouse grabbed in the middle of the div
			    // (so now we need .cursorAt on the draggable)
			    // var width = clone.width();
			    // var height = clone.height();
			    // clone.offset({'top':event.pageY-height/2 ,
			    //               'left':event.pageX-width/2 });
			
		
		}
		
	}});
	$('div#items_content.dress img.dragimg').draggable({scroll: false,helper: 'clone' ,revert:'invalid'});
}

