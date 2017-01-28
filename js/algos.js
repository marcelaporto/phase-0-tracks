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


// RELEASE 1
// function that takes two objects and checks to see if the objects share at least one key-value pair. 
// input: object1, object2
// steps: iterate through keys of object1, so you have access to the key-value pair of both. Then, see if object2 shares the same key
// and, if so, see if they share the same value.
// output: string
function keyValueMatch(object1,object2){
	number_matches = 0;
	matches = [];
	for (var key1 in object1){
		for (var key2 in object2){
			if ((key1 == key2) && (object1[key1] == object2[key2])){ // see if they share the same key && same value
					number_matches ++;
					// matches.push(key1 + " -> " + object1[key1]); // Bonus: we can store matches into an array and print them in the end if we wish				
			}
		}
	}

	if (number_matches > 0) {
		// console.log("There were matches between the objects: " + matches);
		return true
	} else {
		// console.log("The objects did't have new key value match");
		return false
	}
}	

// RELEASE 2
// function that takes an integer for length, and builds and returns an array of strings of the given length
// inputs: length desired
// steps: create an empty array -> do a loop the number of times equal the length; 
// inside the loop, create another loop with a random number (length of the word) between 1 and 10;
// choose random letters of the alphabet from and alphabet array. Push it to the array.  
// output: Array of strings



function gnrtRandomWords(length) {
	alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","w","x","y","z"];
	randomWords = [];

	for (i = 0; i < length; i ++){
	random_number = 0;
	random_word = "";
		random_number = getRandomInt(1,10);
		for ( x = 0; x < random_number; x++){
			random_word = random_word + alphabet[getRandomInt(0,23)];
		}
	randomWords.push(random_word);
	}
	return randomWords;
}

// function to generate a random integer between two values
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random
// Since the Math.random returns a random number between 0 and 1, (0,1], multiplying it by [(max - min + 1) + min]
// allows the numbers to be between min and max, rounded to an integer(Math.floor).
function getRandomInt(min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

// DRIVER CODE
// Longest Phrase function
var fruits = ["Banana", "Oranges", "Apple", "Mango"];
var test = ["long phrase","longest phrase","longer phrase"];

console.log(longest_phrase(fruits));
console.log(longest_phrase(test));

// Key Value Matches function
var kid1 =  {name: 'Spot', 'age': 3, isGoodKid: true};
var kid2 =  {name: 'Kate', 'age': 5, isGoodKid: true};
var kid3 =  {name: 'Spot', 'age': 5, isGoodKid: false};
var kid4 =  {name: 'Spot', 'age': 5, isGoodKid: false};
var kid5 =  {name: 'Bob', 'age': 5, isGoodKid: false};

console.log(keyValueMatch(kid1, kid2));
console.log(keyValueMatch(kid1, kid3));
console.log(keyValueMatch(kid3, kid2));
console.log(keyValueMatch(kid3, kid4));
console.log(keyValueMatch(kid1, kid5));

// Generate Random Test Data
console.log(gnrtRandomWords(4));
console.log(gnrtRandomWords(2));
console.log(gnrtRandomWords(7));
