// RELEASE 0
// function that takes an array of words or phrases and returns the longest word or phrase in the array
// inputs: array
// steps: to do so, I need to compare the length of the strings => to do that, I need to get the length of each
// array member => to do so, I need to access each value of the array separately: 3 steps
// 1) access each value of the array separately: iterate through the array
// 2) get length of each array member => inside the iteration, use the method to get the length
// 3) compare: use a conditional to compare
// output: string 

function longest_phrase(array) {
	var max_numb = 0;
	var longest_phrase = "";

	for (var i = 0; i < array.length; i++){
		phrase = array[i];
		if (phrase.length > max_numb){
			max_numb = (phrase.length);
			longest_phrase = phrase;	
	}
	}
	return longest_phrase;
}

// DRIVER CODE
var fruits = ["Banana", "Oranges", "Apple", "Mango"];
var test = ["long phrase","longest phrase","longer phrase"];

console.log(longest_phrase(fruits));
console.log(longest_phrase(test));