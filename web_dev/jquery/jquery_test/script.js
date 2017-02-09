$( document ).ready(function() {

	console.log( "ready!" );
	alert("I know how to alert");

$("#button").click(function(){
	$("#image").fadeOut(1000);
	$("#image").fadeIn(1000);


});

var position = $('#image').offset().left;

$("#image").dblclick(function(){
	$(this).animate({
		left: '1000px'
	}, 'slow'); 	
	console.log(position);
	$("#helloyall").slideDown("slow");
	
	$(this).animate({
		left: '8px'
	})
	console.log(position);
	$(this).toggle(1000);
});


// Got it from the internet, but it's pretty cool
$("#button2").click(function(){
        var img = $("#image");
        img.animate({height: '300px', opacity: '0.4'}, "slow");
        img.animate({width: '300px', opacity: '0.8'}, "slow");
        img.animate({height: '100px', opacity: '0.4'}, "slow");
        img.animate({width: '100px', opacity: '0.8'}, "slow");
    });
});

