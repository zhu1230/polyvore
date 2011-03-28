
	var deg2radians = Math.PI * 2 / 360;
var that;
var txt = '';
 
 
 
function fnSetRotation(obj, deg)
{
	// txt = '';
	// dumpAbs( txt );	
	// txt += 'Degrees: ' + deg + '<br />deg2radians :' + deg2radians;
	rad = deg * deg2radians;
    costheta = Math.cos(rad);
    sintheta = Math.sin(rad);
	// txt += '<Br />Cosine: '+ costheta + '<br />Sine: '+sintheta;
	
	// dumpAbs( txt );	
 
	a = parseFloat(costheta).toFixed(8);
	c = parseFloat(-sintheta).toFixed(8);
	b = parseFloat(sintheta).toFixed(8);
	d = parseFloat(costheta).toFixed(8);
 
 	var top=$(obj).css('top');
	var left=$(obj).css('left');
	var width=$(obj).css('width');
	var height=$(obj).css('height');
	var position=$(obj).css('position');
	if (obj.filters) {
	    obj.filters.item(0).M11 = costheta;
	    obj.filters.item(0).M12 = -sintheta;
	    obj.filters.item(0).M21 = sintheta;
	    obj.filters.item(0).M22 = costheta;
	} else {

		$(obj).attr("style","position:absolute;filter:progid:DXImageTransform.Microsoft.Matrix(sizingMethod='auto expand'); -moz-transform:  matrix(" + a + ", " + b + ", " + c + ", " + d + ", 0, 0); -webkit-transform:  matrix(" + a + ", " + b + ", " + c + ", " + d + ", 0, 0); -o-transform:  matrix(" + a + ", " + b + ", " + c + ", " + d + ", 0, 0);");
		// $(obj).css('width',200).css('height',200);
		$(obj).css({
			'margin-left': $(obj).css('margin-left'),
			'margin-top':  $(obj).css('margin-top'),
			'margin-right':  $(obj).css('margin-right'),
			'margin-bottom':  $(obj).css('margin-bottom'),
			'position':  position,
			'top':  top,
			'left':  left,
			'width':  width,
			'height':  height
		});

	}

	// writeCode( a, b, c, d );
 
}
 
 
function writeCode(a,b,c,d) {
 
	document.getElementById('iecss').innerHTML = "filter: progid:DXImageTransform.Microsoft.Matrix(M11=" + a + ", M12=" + b + ", M21=" + c + ", M22=" + d + ");";
	document.getElementById('ffcss').innerHTML = "-moz-transform:  matrix(" + a + ", " + c + ", " + b + ", " + d + ", 0, 0);";
	document.getElementById('wkcss').innerHTML = "-webkit-transform:  matrix(" + a + ", " + c + ", " + b + ", " + d + ", 0, 0);";
	
}
 
 
function dumpAbs(txt) {
 
	// document.getElementById('abs').innerHTML = txt;
	
	
}