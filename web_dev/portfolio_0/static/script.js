$(document).ready(function() {

	console.log("Hello")

$(".tab-links, tab-content").mouseenter(function(){
	var currentAttrValue = $(this).attr('id');
	$(".tab-content #" + currentAttrValue).slideDown("slow").siblings().hide();
});

// $(".tab-content").mouseenter(function(){
// 	$('tab').attr('display', 'inline');
// });

// $(".tab-content").mouseleave(function(){
// 	var currentAttrValue = $(this).attr('id');
// 	$(".tab-content #" + currentAttrValue).slideUp("slow");
// });

$(".tab-links").mouseleave(function(){
	console.log("its in")
	var currentAttrValue = $(this).attr('id');
	$(".tab-content #" + currentAttrValue).mouseleave(function() {
	$(".tab-content #" + currentAttrValue).slideUp("slow");
	});
});



});



