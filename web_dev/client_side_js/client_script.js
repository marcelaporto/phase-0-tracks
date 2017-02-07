var gif = document.getElementById('gif');
gif.hidden = true;

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

function popUp (event){
	gif.hidden = false;
}




var photo = document.getElementById("lizard-photo");
photo.addEventListener("click", changeColor);


var buttons = document.getElementsByTagName('button');
var button = buttons[1];
button.addEventListener("click", popUp);