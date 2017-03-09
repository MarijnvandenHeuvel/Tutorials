


# Methods

We've got the following chunk of code that literally prints money:

```
public static void main(String args[]) {
	System.out.println("_______");
	System.out.println("[$ 5 $]");
	System.out.println("¯¯¯¯¯¯¯");
}
```

Printing only one bill per execution is a bit slow, so let's print a bunch of em:

```
public static void main(String args[]) {
	System.out.println("_______");
	System.out.println("[$ 5 $]");
	System.out.println("¯¯¯¯¯¯¯");
	System.out.println("_______");
	System.out.println("[$ 5 $]");
	System.out.println("¯¯¯¯¯¯¯");
	System.out.println("_______");
	System.out.println("[$ 5 $]");
	System.out.println("¯¯¯¯¯¯¯");
	System.out.println("_______");
	System.out.println("[$ 5 $]");
	System.out.println("¯¯¯¯¯¯¯");
	System.out.println("_______");
	System.out.println("[$ 5 $]");
	System.out.println("¯¯¯¯¯¯¯");
}
```

That's quite the block of code for only $25, so we'll probably want to print more valuable bills like $100 instead... except we now have to change the amount in 5 places and fix the formatting in 10 more places.

Luckily, there's an easier way. Enter methods.

## What is a method?

A method is a piece of code that can be called by name.

In our example we can make our lives easier by writing a method that prints a bill and call that method 5 times, instead of writing that unmaintainable monolith of println statements.

```
public static void main(String args[]) {
	printBill();
	printBill();
	printBill();
	printBill();
	printBill();
}

public static void printBill() {
	System.out.println("_______");
	System.out.println("[$ 5 $]");
	System.out.println("¯¯¯¯¯¯¯");
}
```

Whenever the compiler sees "printBill();", it quietly swaps it for the code in the printBill() method.  
In other words, to the computer this code and the previous code are more or less the same, but to us humans this code is much more readable and easier to maintain.  
After all: 
* When we read printBill somewhere, we know a bill will be printed without having to figure out what a block of code does.
* When we wish to change anything about the bill, we only have to change it in one place.
* No need to copy/paste chunks of code, as we can just write the name of a method instead.

As [Bill Gates](https://en.wikipedia.org/wiki/Bill_Gates) once said:

> Measuring programming progress by lines of code is like measuring aircraft building progress by weight.

A few things to note about methods:
* You can call methods inside of other methods.
* You can even call a method inside of the same method. This is called recursion.
* A method does not share its scope with the method that called it. This means that variables declared in the calling method are not available in the called method (and vice-versa).
* Class and instance variables are however available to all methods in the containing class.

## Lab 1

### Common errors and how to fix them

#### Non-static variable cannot be referenced from a static context

Static methods can only access class variables that are static themselves. To fix this error, declare your class variable as static.  
ex: `public static int aNumber = 0;`

#### Non-static method cannot be referenced from a static context

Static methods can only call other static methods. To fix this error, add the static keyword to your method declaration.  
ex: `public static void aMethod() {`

#### Modifier 'static' not allowed here

You are likely trying to make a local variable static. Either move the variable outside of the method to make it a class variable or remove the static keyword to make it a local one.

### Lab 1.1

Let's start out simple by printing "Hello world!" in a method, then call said method from the main method.  
Open the project from the lab1.1 folder in intellij and open the Main class in the src folder. Complete the main and printHelloWorld methods so the application prints out "Hello world!".

Once you're done, verify the lab was completed successfuly by running MainTest in the test folder.  
If the printHelloWorldPrintsHelloWorld test fails but the helloWorldGetsPrinted test succeeds, that usually means you are printing "Hello world" in the main method but not in the printHelloWorld method.  
If the opposite is true, it usually means that you are not calling printHelloWorld from the main method.

### Lab 1.2

Next up is a refactoring lab. Refactoring is the art of restructuring code without changing its behaviour in order to increase its readability and reduce its complexity.

Open up the project from the lab1.2 folder and you'll see a big chunk of repetitive code in the main method.  
The code is supposed to add a video game, a lego set and two board games to a bill and print the total after each action. There's a 10% discount on the lego set and a "buy 1 get 1 free" action on board games.

Your job is to split this code into methods where appropriate while making sure the tests stay green. Try to aim for under 13 lines of code (with proper formatting, no cheating by putting everything on one line) in every method (including the main method). The required variables are declared in class scope, so they will be accessible in your methods.

### Lab 1.3

A good method name should describe what a method does. This often requires more than one word, so it's good form to use camelCase to achieve this.  
Sentences in camelCase look as follows: `thisSentenceIsWrittenInCamelCase`

As the final lab for this chapter, write a [haiku](https://en.wikipedia.org/wiki/Haiku_in_English) (a poem composed of three lines of 5-7-5 syllables each) using 3 methods.  
The method names should be in camelCase and each method should print out their line in proper formatting.

For example:
```
public static void main(String[] args) {
	littleSemicolon();
	thatMakesMeNotCompileThis();
	whereAreYouMissing()
}

output:
Little semicolon
that makes me not compile this,
where are you missing?
```

## Parameters

You probably noticed lab 1.2 using class variables to make those variables accessable inside of a method's scope.  
A much cleaner and more flexible way to achieve this is by adding parameters to your methods.

Parameters are variables that can be passed into the method's local scope when the method is called.  
The syntax is as follows:

```
public static void printBill(int value) {
	System.out.println("________");
	System.out.println("[$ " + value + " $]");
	System.out.println("¯¯¯¯¯¯¯¯");
}
```

Note the (int value) we added to our printBill method. This tells the method that we can expect an integer as parameter, and that said parameter will be called "value" in our local scope.  
You can add as many parameters of as many different kinds as you need for your method. ex: `public static void aMethod(int para1, int para2, String para3, double[] para4, int para5) {`

When you call the method, simply supply a variable for each of the parameters. Their names do not need to match those in the method declaration.  
ex:
```
public static int globalNumber = 20;

public static void someMethod(int number1, double number2) {
	//some code...
}

public static void main(String args[]) {
	double localNumber = 10;
	someMethod(globalNumber, localNumber);
}
```
Your parameters don't need to be passed inside of a variable per se. In fact, whenever you printed something to the console, you passed a String as parameter to the println method.

Note that primitive types (those that start with lowercase, like int or double) have their value assigned to the parameter while object types (those that start with uppercase, like String) have their reference assigned.  
This means that:
* For both types reassigning the parameter inside the method does not change them in the calling method.
* For primitive types modifying the value does not change them in the calling method (as this counts as reassigning).
* For object types, modifying their internal state DOES carry over.
* Arrays are passed by reference, and thus count as object types. This means that changing a value inside of an array DOES carry over.
* While strings are object types, there is no way to change their internal state (well, except by using reflection, but you should probably stay far away from that for now).


## Lab 2

### Common errors and how to fix them

#### Identifier expected

You have forgotten to list a type or name for your parameter.

### Lab 2.1

Let's start things off with another Hello world. Open up lab2.1 in intellij and complete the main and the print methods.  
The print method should print out the string passed to it.  
The main method should call print with "Hello world!" as argument.

### Lab 2.2

Write a method transposeStrings that accepts two Strings as parameters, then prints them out transposed.
For example "test" and "string" would become  
t s  
e t  
s r  
t i  
  n  
  g  

If one string is longer than the other, replace missing characters with spaces. You may assume null will not be passed as parameter for this lab.

### Lab 2.3

Java also supports unlimited parameters. Open up lab2.3 and copy over your solution from lab 2.2, then modify it to work with an unlimited amount of strings as parameters.
  
## Return statements

The question is then, how can we get data created in our called method back into the calling method?  
The answer: a return statement.

A method can return a single primitive or object at the end of its lifecycle.  

First, the type of the return value has to be changed in the method declaration.  
Up until now we have always used a return type of "void", which indicates no value is returned by the method. 
Change the void keyword in your method declaration into the type of the value you wish to return. ex: `public static String aMethod()`
Then, in the method, simply write return followed by the value or variable you wish to return. ex: `return "Now you're thinking with returns!";`
To store the returned value, assign the method to a variable like you would any other value.

```
public static void main(String[] args) {
	int meaningOfLife = returningMethod();
}

public static int returningMethod() {
	int returningValue = 4*3;
	return returningValue;
	//any code after the return will not be executed
}
```

Things to note about return statements:
* You can only return one primitive or object per method call (an array is one object).
* Code after the return statement will not be executed.
* You can have multiple return statements in a method
* In this case the first return statement encountered will end the method.
* All return statements inside a method must return the same type of variable as indicated in that method's declaration.
* All logic paths must end in a return statement.
* Code between the return keyword and the ; is evaluated and its result returned. `return String.valueOf("40") + 2;` thus returns the integer 42.
* If your method has the void return type, an empty return statement (`return;`) is implicitly added to the end of the method. You may add additional empty return statements to exit the method at any point.

## Lab 3

### Common errors and how to fix them

#### Missing return statement

Your method is declared as having a return value, but one (or more) of the logic paths does not end in a return statement.

#### Incompatible types

Either the value you are trying to return does not match the return type in your method declaration, or you are trying to assign the method return value to the wrong variable type.

### Lab 3.1

Another lab, another Hello world. Open up lab3.1 in intellij and complete the main and the getString methods.  
The main method should print out the string gotten from the getString method.  
The getString method should return "Hello world!".

### Lab 3.2

What would a world without final variables look like? Their purpose is to provide us with a constant, so I suppose we could use a method as a make-shift substitute.

Copy over your solution for lab1.2 and replace all final variables with a method that returns their value. The amount of work you'll need to put into this lab will depend on how well you refactored in lab 1.2!

### Lab 3.3

The Fibonacci sequence is a sequence of integer numbers where each number is the sum of the previous two numbers. The first two numbers are either 0 and 1 or 1 and 1.  
The sequence looks like this: `0 1 1 2 3 5 8 13 21 34 ...`

For this lab, you'll be implementing a method that returns the nth number (0-indexed) of the Fibonacci sequence. For example, fibonacci(0) should return 0, fibonacci(1) should return 1 and fibonacci(6) should return 8.  

Here's the twist: you'll be implementing this using recursion. So no using loops, or God forbid, math, to determine the number.

As described on the [Wikipedia page](https://en.wikipedia.org/wiki/Recursion_(computer_science)), recursion is a method where the solution to a problem depends on solutions to smaller instances of the same problem. 
Or in coding terms, a way to achieve the desired functionality in your method by calling the same method with smaller parameters.  
A great way to think about recursive methods is to think about the possible states they can be in. Usually this comes down to 2 states: Processing smaller instances (in which the actual logic of the method happens) and the smallest possible instance (which usually just returns a value).

## Method overloading

Method overloading can be summed up as declaring a method with the same name as a different method, but with different parameters and a different implementation.  
(Note that by different parameters we mean different parameter types. Parameter names are irrelevant here.)

Overloading your methods where appropriate increases your code's readability and flexibility.

As an example, let's say we have a method that appends a String to the end of another String and returns the result. append("One", "Two") would return "OneTwo".  
Now let's say we want to achieve the same effect but on numbers so that (1, 2) would return "12". 
Without method overloading we would either have to convert the numbers into strings before calling append(String, String) or define a new method appendNumbers(int, int) that does the same thing and call the right method depending on our parameters.  
Thanks to method overloading we can just define a new method append(int, int) that performs the correct append (or converts the numbers for us into strings, then calls append(String, String) with them) and always use append() in our code without having to worry about the type of our parameters.

In code it would look like this:

```
public static void main(String[] args) {
	System.out.println(append("One", "Two"));
	System.out.println(append(1, 2));
}

public static String append(String first, String second) {
	return first + second;
}

public static String append(int first, int second) {
	return first + "" + second;
}
```

Other uses for method overloading include providing a method that uses fewer parameters allowing you to call the original method with set default parameters.

Things to note about method overloading:
* The order of your parameters matter. `public static void aMethod(int num1, long num2)` is a valid overload of `public static void aMethod(long num2, int num1)`.
* While the return value of overloaded methods can differ, Java cannot differentiate methods based on their return value alone. Hence `public static int aMethod(double num1, double num2)` is NOT a valid overload of `public static double aMethod(double num1, double num2)`.
* A method can be overloaded by multiple methods, as long as each method has different parameters.
* Parameter names are irrelevant to method overloading. `public static void aMethod(int a, int b)` is NOT a valid overload of `public static void aMethod(int c, int d)`.

## Lab 4

### Common errors and how to fix them

#### methodName(type) is already defined

You are trying to overload a method while using the same parameter types. Changing parameter names does NOT count as different parameters.

#### Incompatible types

If the return types of overloaded methods differ, it is possible you are trying to assign the return value of the wrong overloaded method to your variable.

### Lab 4.1

You guessed it, time for more Hello world!  
Overload the print method with one that accepts a String as parameter and prints out said String.  
Then, call the overloaded method from main with "Hello world!" as argument.

### Lab 4.2

Let's experiment a bit.  
There are 6 primitive types capable of storing numbers, namely (from small to large): byte, short, int, long, float and double.  
You can assign a smaller primitive to a larger primitive (but not the other way around), so it's perfectly ok to supply an int to a method that requires a double as parameter.  
However, if we have a method that requires an int as parameter and we overload it with a method that requires a double, which one will be called if we supply a short as parameter?

Play around a bit with these methods and find out yourself. Change the type and value of the parameter and change the parameter types of the functions. Try out different combinations and form a conclusion about what is happening.

By default any whole number will be regarded as an int and any decimal number as a double, but you can force a conversion by casting it.  
To cast a variable, simply place the type you want it to be in brackets before the variable, like so: `float x = (float) 5.0;`  
Note that some data can get lost in the conversion. For example, casting a float or double to any of the other types will cause the decimal part to be dropped.

### Lab 4.3

Here's a little puzzle:

Open up lab4.3 and you'll see the usual print method, except this time we're trying to print a single character instead of the usual String. 
However, when we run the program we see that a number is printed instead.

Without modifying the existing code, use method overloading to fix this.

## Q&A

Q: Is there a difference between "method" and "function"?  
A: You'll often find those terms used interchangably, but there is a difference.  
A method is used in context of an object, while a function is stand-alone. Java only uses methods.  
In other words, a method belongs to a class and can use the class and instance variables defined inside of that class while a function can only work with the parameters supplied.

Q: What about parameter and argument?  
A: An argument is the value/variable/reference being passed into a method. A parameter is the receiving variable used within the function/block.  
If I were to call `sum(int one, int two)` with `sum(1, 2);`, 1 and 2 would be the arguments while one and two would be parameters.


## Removed exercises

### Lab 1.3

Let's step things up a bit. For this next lab, we'll be sorting an array using the bubble sort algorithm. It's certainly not the fastest sorting algorithm, but it's one of the easier ones to implement.

Bubble sort goes through each element of an array and compares it to the next one. If the next one is smaller than the current one, the two get swapped.  
This is repeated until no swaps have occurred during a loop through the array.  
If you'd like a visualisation of the algorithm, visit [sorting.at](http://sorting.at/), add a new algorithm, select bubble sort and confirm by clicking "visualize algorithm". You can then press the play button to watch bubble sort in action.

As for the the lab itself, open up the lab1.3 project and do the following:  
Implement the bubble sort algorithm in a seperate method.  
In the main method, first print out the original char[], then call the method where you implemented the bubble sort algorithm and finally print the sorted char[].  
Run the tests to see if your implementation is correct.

### Lab 2.2

Let's decode some morse!  
Here's an easy one: ... --- ...  
Yep, that one's SOS, the international distress signal, and usually the only piece of morse that is common knowledge.

Let's expand our knowledge by writing our very own morse decoder. Open lab2.2 and complete the decodeMorse method which takes a char array of length 3, and 3 strings as parameters.  
The three strings will be in morse format, so to use our previous example: "...", "---" and "...". Translate each of these 3 strings to a char and add them to the correct position in the array.  
You can find a tree representation of morse decoding [here](https://upload.wikimedia.org/wikipedia/commons/c/ca/Morse_code_tree3.png).  
Note that while using a buch of if statements is a valid approach to this problem, there might be more programmer friendly ones. The tests will only use the 14 shortest characters (first 3 levels of the tree).

Optional: Java supports unlimited parameters, find out how and modify your code and the tests to allow for unlimited morse code characters.

















