// PSEUDOCODE
// function that takes a string as a parameter and reverses the string
// returns string in reverse
// input: string
// steps:
// define new variable to store reversed string
// go through each letter
// add it to string in front of anything stored in the letter. 
// output: reversed string


var str = "bubu"

function reverse(str){
	var new_str = "";
	for (var i = 0; i < str.length; i++){
		var new_str = str[i] + new_str;
	}
	return new_str
}

// DRIVER CODE
// driver code that calls the function in order to reverse a string of your choice (as long as it's not a palindrome!), and stores the result of the function in a variable.
// Add driver code that prints the variable if some condition is true. 
var reverse_str = reverse(str);
console.log(reverse_str);

if (reverse_str.length > 2) {
	console.log(reverse_str + "!!");
} else {
	console.log("too small to reverse!");
}











