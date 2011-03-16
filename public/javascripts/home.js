$(
	function(){
		$('#category').change(function(){
			$.ajax('/products/cagegory_mix',{
				data:'id='+$('#category').val(),
				success:function(data){
					$('#items_content').html(data);
					// paginate_ajax();
					$('.dropimg').droppable({ drop: function() { alert('dropped'); }});
					$('.dragimg').draggable({scroll: false,helper: 'clone' ,opacity: 0.35,revert: 'invalid'  });
				}
			})
		
		});

		
		
		
	paginate_ajax();

	$('.dropimg').droppable({ drop: function(event, ui) { 
		var clone = ui.helper.clone();
		if(ui.draggable.hasClass('ui-draggable-dragging'))
		{
			
		}
		else
		{
				clone.draggable();
			    clone.appendTo(this);

			    // this assumes the mouse grabbed in the middle of the div
			    // (so now we need .cursorAt on the draggable)
			    var width = clone.width();
			    var height = clone.height();
			    clone.offset({'top':event.pageY-height/2 ,
			                  'left':event.pageX-width/2 })
		
		}
		
	}});
	$('.dragimg').draggable({scroll: false,helper: 'clone' ,revert:'invalid'});
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
