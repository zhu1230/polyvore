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
	$(".dragged").live('click',function(event){

				$('.dropimg .active').removeClass('active');
						$(this).addClass('active');
						// $(this).find('.ui-resizable-handle').css('display','block');
				 event.stopPropagation();
	});
	
	
	
	$('.rotateh_img').click(function(){
		var av=(parseInt($('.active').attr('angle')) || 0)+45;
		// $('.active img,.active span').rotate(av);
			fnSetRotation($('.active').get(0),av);
		$('.active').attr('angle',av);
		// $('.active span > .rvml > .rvml').css('border','1px solid red');
		// $('.active span > .rvml > .rvml').resizable({ghost:false,autoHide: false ,handles:'all'  ,grid: [50, 50],stop: function(event, ui) { 
		// 	alert($('.active').parent().html());
		// 	 }});
		// // 
		// $('.active span').resizable('destroy');
		// $('.active').removeClass('ui-resizable-autohide');

	
		// $('.active').rotateLeft();
		// return false;
	});
	$('.rotatev_img').click(function(){
		var av=(parseInt($('.active').attr('angle')) || 0)-45;
		// $('.active img,.active span').rotate({angle:av});
			fnSetRotation($('.active').get(0),av);
		$('.active').attr('angle',av);
		// $('.active').rotateRight(45);
		return false;
	});
	$('.remove_img').live('click',function(){
		
		// $('.active').rotate(-45);
		$('.active img , .active span').remove();
		$('div.active').remove();

		return false;
	});
	$('.new_img').live('click',function(){
		// $('.active').rotate(-45);
		$('.dropimg').empty();
		// $('.active').rotateRight(45);
		return false;
	});
	$('.copy_img').click(function(){
		var newimg=$('.active img').clone().css('left',$('.active').offset().left-15).css('top',$('.active').offset()-15);
		newimg.appendTo($('.dropimg'));
		
		add_draggable(newimg)
		return false;
	});
	$('.zoomin_img').live('click',function(){
	 var nw=$('.active').width()/2;
	var nh=$('.active').height()/2;
	// alert($('.active span > .rvml').parent().html());
		$('.active img').css('width', nw).css('height', nh);
		
		$('.active').width(nw+2);
		$('.active').height(nh+2);
	});
	$('.zoomout_img').live('click',function(){
	 var nw=$('.active').width()*2;
	var nh=$('.active').height()*2;
		$('.active img').css('width', nw).css('height', nh);
		$('.active').width(nw+2);
		$('.active').height(nh+2);
	});
	$('.publish').click(function(){
	if($('.dropimg .dragged').length==0)
	{
		jAlert("you have not create any item.");
		
	}else if($(document).data('logged'))
	{
	$('#publish_box').dialog({ title:'Publish Set',zIndex: 9998 , modal: true,width:400,buttons: { "Ok": function() { 
		submit_set($('#MakeUp_title').val(),$('#MakeUp_notes').val());
		} } });
	

	}else{
		$('#login_box').dialog({title:'Please Login:',zIndex:9999, width:400,modal: true,buttons:{"OK":function(){
			 $.post('/user_session.text',$('#login_box form').serialize(),function(data) { 
				var d=data.split(':');
				if(d[0]=='ok'){$(document).data('logged',true);$(this).dialog('close');$('.publish').click();}else if(d[0]=='error'){$('#login_error').html(d[1]).show();}});
		},"New User":function(){
			window.open('/users/new', 'register', '');
			  return false;
		}}})
	}});
		return false;
	
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
			$(ui.helper).click();

		}
		else
		{
			var clone = $(ui.helper).clone();
			clone.attr('src',clone.attr('src').replace('medium','home')).attr('width','200').attr('height','200');
			// clone.appendTo($("<div class='rotater_layer'></div>")).parent().appendTo(this); 
			 clone.appendTo(this); 
			// 	clone.resizable({ghost:true,autoHide: true ,handles:'all' });
			add_draggable(clone);
			}}});
	$('div#items_content.dress img.dragimg').draggable({scroll: false,helper: 'clone' ,revert:'invalid'});
}
function submit_set(title, notes) {
    var left = $('.dropimg ').offset().left;
    var top = $('.dropimg ').offset().top;
    var a = [];
    function product(id,top, left, width, height, angle)
    {
		this.id=id
        this.top = top;
        this.left = left;
        this.width = width;
        this.height = height;
        this.angle = angle;
        this.toString = function() {
            return this.id+","+this.top + ',' + this.left + ',' + this.width + ',' + this.height + ',' + this.angle
        }
    }
    $('.ui-wrapper').each(function(index, element) {
        a.push(new product($(element).find('img').attr('id'),$(element).offset().top - top, $(element).offset().left - left, $(element).width(), $(element).height(), ($(element).attr('angle') || 0)));

    });

    $.post('/sets/', {
        "da[]": a,
        'title': title,
        'notes': notes
    },function(url) {
		    $(location).attr('href',url)
		   });
    $('.ui-dialog-buttonset .ui-button-text').html('Sending...');
	// $('#publish_box').dialog("close"); 
}
function add_draggable(clone) {
		clone.resizable({handles:'ne, se, sw, nw',aspectRatio:true,resize:function(event, ui){
			// alert(ui.size.width+"|"+ui.size.height);
			// alert(ui.helper.parent().html());
			$('.active img').attr('width',$('div.active').css('width')).attr('height',$('div.active').css('height'));
			
		},stop:function(event, ui){
			// alert($('.active').parent().html());
			
		},start:function(event,ui){
$('.active img').width($('div.active')).height($('div.active').css('height'));
		}}).parent('.ui-wrapper').css('width',clone.width()+10).css('height',clone.height()+10).draggable({clone:false , zIndex: 2700,cancel:'.rotater'}).addClass('dragged').removeClass('ui-draggable-dragging');
		clone.removeClass('ui-draggable-dragging');
		clone.parent().click();
		// clone.parent().rotate(0);
		// alert(clone.parent().parent().html());
		// Your original element
		var ele = clone.parent();
		ele.find('.ui-resizable-handle').css('display','');
// ele.css('position', 'absolute');
		// Create handle dynamically
		$('<div></div>').appendTo(ele).addClass('rotater').css({
		    'position': 'absolute',
		    'bottom': 15,
		    'right': 15,
		    'height': 20,
		    'width': 20,
		    'background-color': 'orange'
		}).draggable({
		    // handle: '#handle2',
		    opacity: 0.01, 
		    helper: 'clone',
		    drag: function(event, ui){
		        var rotateCSS = 'rotate(' + ui.position.left + 'deg)';

		        // $(this).parent().css({
		        //     '-moz-transform': rotateCSS,
		        //     '-webkit-transform': rotateCSS
		        // });
		// alert($(this).parent().html());
		        // var angle=parseInt(ui.position.left+($(this).parent().attr('angle') || 0));
			 // $(this).parent().parent().attr('')
			// $(this).parent().find('img').rotate(0);
			// cssSandpaper.setTransform($(this).parent().get(0),"rotate("+(angle/100)+"deg)");
			var x1=event.pageX;
			var y1=event.pageY;
			var img=$(this).parent().find('img');
			var x2=img.width()/2+img.offset().left;
			var y2=img.height()/2+img.offset().top;
			  var angle = Math.atan2((x1 - x2), (y2 - y1))/(Math.PI/180) + 180;
			// console.log(angle+"     |"+x1+"|"+x2+"|"+y1+"|"+y2);
			// alert($(this).parent().parent().parent().html());
			fnSetRotation($(this).parent().get(0),angle);
			// alert("1");
			// $(this).parent().parent().transform({rotate:'＋＝10deg'});
			 // $(this).parent().attr('style',+$(this).parent().attr('style')+'-sand-transform:rotate(30deg)');
			// $(this).parent().css('border','1px solid red');
			// alert($(this).parent().parent().html());
		// if($(this).parent().find('span').length!=0)
		// 			{
		// 				// alert($(this).parent().html());
		// 					$(this).parent().find('span').rotate(angle);
		// 					$(this).parent().rotate(angle);
		// 			}else
		// 			{
		// 				
		// 					$(this).parent().rotate(angle);
		// 			}
			
				$(this).parent().attr('angle',angle);
				
				
		    },
			stop:function(event,ui){
				// alert($(this).parent().parent().html());
				// $(ui.helper).parent().find('img').resizable({handles:'ne, se, sw, nw',aspectRatio:true,resize:function(event, ui){
				// 	// alert(ui.size.width+"|"+ui.size.height);
				// 	// alert(ui.helper.parent().html());
				// }})
			},
			start:function(event,ui){
				$(this).addClass('dragged');
				// $(this).parent().parent().attr('id','t1');
			}
		});
		ele.attr("style",ele.attr('style')+";position:absolute;filter:progid:DXImageTransform.Microsoft.Matrix(sizingMethod='auto expand');").attr("onfilterchange","fnSpin(this)");
		// alert(ele.parent().html());
		// $('#cur').clone().appendTo(ele).attr('id','');

		// clone.parent().click(function(event){
		// 		$('.dropimg .active').removeClass('active');
		// 		clone.parent().addClass('active');
		// 		 event.stopPropagation();
		// 	});
		// 	$('.dropimg .active').removeClass('active');
		// 	clone.parent().addClass('active');
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




