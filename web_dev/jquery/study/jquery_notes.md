## Plan to takle JQuery
1. Beggin with basic explanation (40min)
	* https://jquery.com/
	* https://learn.jquery.com/
	* http://www.w3schools.com/jquery/
	* https://pt.wikipedia.org/wiki/JQuery
2. See documentation (10min)
	* https://api.jquery.com/
3. Watch Live code (40min)
	* http://www.w3schools.com/jquery/jquery_examples.asp
	* https://www.youtube.com/watch?v=hMxGhHNOkCU (introduction)
	* https://www.youtube.com/watch?v=G-POtu9J-m4 (event biding)
	* https://www.youtube.com/watch?v=Cc3K2jDdKTo (writing better, smarter code)
	* https://www.youtube.com/watch?v=1nWrIBB_bMA (Ex: tab creation)
	* https://www.youtube.com/watch?v=KkzVFB3Ba_o (Ex: image slider)
4. Do quiz then exercise (30 min)
	* http://www.w3schools.com/jquery/jquery_quiz.asp
	* https://www.codecademy.com/pt/courses/javascript-beginner-en-x1onO/0/1?curriculum_id=50b91eda28c2fb212300039e
	* https://www.codecademy.com/pt/courses/web-beginner-en-X7bpO/0/1?curriculum_id=50b91eda28c2fb212300039e
	* https://www.codecademy.com/pt/courses/web-beginner-en-de7ew/0/1?curriculum_id=50b91eda28c2fb212300039e


## Theory
jQuery, at its core, is a DOM (Document Object Model) manipulation library. jQuery is a cross-platform JavaScript library designed to simplify the client-side scripting of HTML. jQuery simplifies the syntax for finding, selecting, and manipulating these DOM elements. For example, jQuery can be used for finding an element in the document with a certain property.

It makes things like HTML document traversal and manipulation, event handling, animation, and Ajax much simpler with an easy-to-use API that works across a multitude of browsers. 

1.

To make it all work, we need to tell our HTML file to include the jQuery library. This is done by using a script tag inside the head section of the HTML document. To call jQuery in the HTML document, we write 

In the terminal: `npm install jquery`

```<script src = "node_modules/jquery/dist/jquery.min.js"> </script> // jquery script always first!!
<script src="jquery.js"></script>
```

2.

A page can't be manipulated safely until the document is "ready." jQuery detects this state of readiness for you. 
Code included inside ** ` $( document ).ready() `** will only run once the page Document Object Model (DOM) is ready for JavaScript code to execute. 

$() -> tells js we'll be using jQuery.
document tells jQuery to work with our HTML
.ready -> makes the jQuery wait untill the page is completely loaded.

The code you put inside this function will run as soon as your browser has loaded your page.
Ex:
```$( document ).ready(function() {
    console.log( "ready!" );
});
```
The jQuery library exposes its methods and properties via two properties of the window object called jQuery and $. $ is simply an alias for jQuery and it's often employed because it's shorter and faster to write.

In practice, it is better to place your code ina a separte JS file and load it on the page with a <//script> element's src attribute.

3.

* Adding and Removing an HTML Class
Add: $("<element>").addClass("<class/style>")
Remove: $("<element>").removeClass("<style/class>")

* Callbacks and Functions
JavaScript enables you to freely pass functions around to be executed at a later time. A callback is a function that is passed as an argument to another function and is executed after its parent function has completed. Callbacks are special because they patiently wait to execute until their parent finishes.
	* Callback without Arguments
	ex: `$.get( "myhtmlpage.html", myCallBack );`
	When `$.get()` finishes getting the page `myhtmlpage.html`, it executes the `myCallBack()` function, which is just a regular function.
	* Callback with Arguments
	To defer executing myCallBack() with its parameters, you can use an anonymous function as a wrapper. 
	```$.get( "myhtmlpage.html", function() {
		myCallBack( param1, param2 );
    });
    ```

## Documentation

1. Category: Events
	* *.change()*: The change event is sent to an element when its value changes. This event is limited to <input> elements, <textarea> boxes and <select> elements. For select boxes, checkboxes, and radio buttons, the event is fired immediately when the user makes a selection with the mouse. Ex:
	```$( "input[type='text']" ).change(function() {
			// what happens when it changes
  		});
	*  *.dblclick()*: The dblclick event is sent to an element when the element is double-clicked. Any HTML element can receive this event. Ex:
	```$( "#target" ).dblclick(function() {
  			alert( "Handler for .dblclick() called." );
		});
	To trigger the event manually, call .dblclick() without an argument
	* *.hover()*: The .hover() method binds handlers for both mouseenter and mouseleave events. You can use it to simply apply behavior to an element during the time the mouse is within the element. Ex:
	```$( "li.fade" ).hover(function() {
 		 $( this ).fadeOut( 100 );
  		$( this ).fadeIn( 500 );
		});
	```


## Extras

1. Putting jQuery in no conflict mode with other libraries: https://learn.jquery.com/using-jquery-core/avoid-conflicts-other-libraries/
2. By default, all HTML elements have a static position, and cannot be moved. To manipulate the position, remember to first set the CSS position property of the element to relative, fixed, or absolute!

