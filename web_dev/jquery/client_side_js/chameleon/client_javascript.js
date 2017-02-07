
var colors = ['red', 'green', 'blue'];

function changeColor(event){
	event.target.style.border = "3px solid " + colors[0];

	rotate(colors,1);
}

function rotate( array , times ){
  while( times-- ){
    var temp = array.shift();
    array.push( temp )
   }
}

var photo = document.getElementById("lizard-photo");
photo.addEventListener("click", changeColor);
