# Java - Loops

## What Are They

Previously, we saw how to apply flow control using conditional statements. But how do we actually repeat something in our code? We know how to reuse functionality by putting them in separate methods, but let's look at this:

```java
public static void main(String[] args) {
	shout();
	shout();
	shout();
	shout();
	shout();
}

private static void shout() {
	System.out.println("HELLO WORLD!");
}
```

Do I really have to manually call my method five separate times here? And what if I want to `shout()` based a certain amount of times based on user input? How would that work?

That's why we need loops!

We'll be introducing 4 types of loops:

* `while`
* `do while`
* `for`
* `for each`

## A Quick Note On Incrementing and Decrementing

Something you'll often see when it comes to loop examples is the following form:

```java
int x = 0;
x++; <--- THIS
```
or

```java
x--;
```

These are the `++` and `--` operators. These are the increment and decrement operators. `x++` increases the value of the variable by 1, and `x--` decreases its value by 1.

There is, however, an important subtlety you need to be aware of. You see, all the forms below are valid.

```java
x++;
x--;
++x;
--x;
```
But there is a big difference between the two first and the last two.
If the `++` or `--` is written **before** the variable name (like so `++x` `--x`), the variable is incremented/decremented **before it is evaluated**. If it is written **after** the variable name (like so `x++` `x--`), then it is incremented/decremented **after it is evaluated**.

You can see the effects in the following example:

```java
int test = 0;
if (test++ == 1) {
	System.out.println("It's equal!");
}
```
If you run this, you'll notice that nothing is printed out. That's because when `test` is evaluated, it has not been incremented yet. So you are checking `0 == 1`.

To fix this, change the code to

```java
int test = 0;
if (++test == 1) {
	System.out.println("It's equal!");
}
```
Now you'll that it prints `It's equal!`, because `test` is incremented before it is evaluated.

## While

The `while` loop is a very simple programming construct, and you probably already have an idea how it works. Essentially, you will use it to tell your program to repeat a block of code while a certain statement remains `true`.

It takes the following form:

```java
while (<Conditional Expression>) {
	// Code to execute
}
```

So if you want to continue shouting forever, you would simply write:

```java
while (true) {
	// Code to execute
}
```

You probably don't want to do that though. It gets annoying fast. So, what if we want to shout based on user input?

```java
public static void main(String[] args) {
	shout(5);
}

private static void shout(int times) {
	while (times > 0) {
		System.out.println("HELLO WORLD!");
		times--;
	}
}
```

## Do While

The `do while` loop is essentially a variation on the `while` loop. It looks like this:

```java
do {
	// Code to execute
} while (<Conditional Expression>)
```
You can probably see the difference already. The difference is that the evaluation of the condition takes place at the end of the loop. This means that the loop is always executed **at least once**!

Let's take a look at the example we used for the `while` loop, but refactor it to make use of the `do while` loop.

```java
public static void main(String[] args) {
	shout(5);
}

private static void shout(int times) {
	do {
		System.out.println("HELLO WORLD!");
		times--;
	} while (times > 0);
}
```

You might think it is the same, but it's not. When you call `shout(5)`, it will indeed shout 5 times. But when you call `shout(0)` or `shout(-1)` or even `shout(-100)`, it will still shout once, because it will only evaluate the condition after the very first shout.

## For

The `for` statement, or `for` loop, is generally used to iterate over a range of values.

This one is a little more involved than the previous two, but it is still a rather simple concept. Let's take a look at the general form:

```java
for (<Initialization>; <Termination>; <Increment>) {
    // Code to execute
}
```

This may look a a little strange, so let's explain it:

1. The initialization expression initializes the loop; it's executed once, as the loop begins.
2. When the termination expression evaluates to false, the loop terminates.
3. The increment expression is invoked after each iteration through the loop; it is perfectly acceptable for this expression to increment or decrement a value.

Alright, so what if we want to shout five times again? It would look something like this:

```java
public static void main(String[] args) {
	shout(5);
}

public static void shout(int times) {
	for (int counter = 0; counter < times; counter++) {
		System.out.println("HELLO WORLD!");
	}
}
```

So we're saying:

1. We want a counter, and we want to set it to 0.
2. We want to keep repeating this while our counter is less than the amount of times we want to loop (this might look similar to our `while` loop of before).
3. Every time we finish a single loop, we want our counter to increase its value by 1.

> ### Note
> Oddly enough, these three expressions are actually optional. Though you'll rarely use this, you can effectively create an infinite loop by using the following form:

>```java
for ( ; ; ) {
    // Code to execute
}
```


A classic for-loop you might often see is iterating over an array.

```java
int[] numbers = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
for (int index = 0; index < numbers.length; index++) {
	System.out.println(numbers[index]);
}

```

A for loop allows us to both `break` and `continue`

`break` effectively tells the loop to terminate immediately.

```java
for (int i = 0; i < 10; i++) {
	System.out.println("HELLO WORLD!");
	if (counter == 6)
		break;
}
```
The example about would print:

```
HELLO WORLD!
HELLO WORLD!
HELLO WORLD!
HELLO WORLD!
HELLO WORLD!
HELLO WORLD!
HELLO WORLD!
```

`continue` allows you to skip the current iteration you are performing.

```java
for (int i = 0; i < 10; i++) {
	if (counter == 6)
		continue;
	System.out.println("HELLO WORLD!");
}
```

```
HELLO WORLD!
HELLO WORLD!
HELLO WORLD!
HELLO WORLD!
HELLO WORLD!
HELLO WORLD!
HELLO WORLD!
HELLO WORLD!
HELLO WORLD!
```
As you can see, we only shouted 9 times here. That's because the 7th loop was effectively skipped by the `continue` statement.

Be careful when using these special statements. They often make code harder to understand, it's easier to make mistakes and most loops often just don't require this.


## For Each

For each can be treated like a special form of the `for` loop, but it's actually quite a different beast.

This form is sometimes referred to as the enhanced for statement, and can be used to make your loops more compact and easy to read. You'll learn more about Collections (more specifically, something that implements an Iterable) at a later point.

It takes the following form:

```java
for (<Declaration> : <Expression>) {
	System.out.println(number);
}
```

1. Declaration: A newly declared variable, is of a type compatible with the elements of the array or collection you are accessing. The variable will be available within the for block and its value would be the same as the current array element.
2. Expression: This evaluates to the array or collection you need to loop through. The expression can be an array variable or method call that returns an array.

Remember when we iterated over our array in the example above? We can actually write this in a much cleaner fashion:

```java
int[] numbers = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
for (int number : numbers) {
	System.out.println(number);
}

```

You should use the `for-each` loop whenever possible. It is generally considered to be cleaner and more readable than its counterpart.

# Labs

Time for some exercises!

## Lab 1

Write a two methods, one called `sum`, and one called `average`. Both should take an argument `n` to produce the sum of 1, 2, 3, ..., to n. This sum is known as the 'Triangle Number' of a number. The method `sum` should return the sum of those numbers, and the method `average` should return the average of that sum.

> Hint: e.g. For n = 100,  `sum` should return 5050, and `average` should return 50.5.

## Lab 2

Write a program that creates the following output:

```
*******
******
*****
****
***
**
*
```

If you have time, you can expand on this by taking user input. For example, if the user inputs 7, then it you will generate a triangle with height 7, like the one shown above.

## Lab 3

Write a method called `countLetters` that, given a string, counts the number of words ending in 'y' or 'z'. So the 'y' in "heavy" and the 'z' in "fez" count, but not the 'y' in "yellow" (not case sensitive). We'll say that a y or z is at the end of a word if there is not an alphabetic letter immediately following it. 

> Hint: Character.isLetter() tests if a character is an alphabetic letter.

> e.g.: 

> ```
> countLetters("may day") : 2
countLetters("yay day") : 2
countLetters("hello world") : 0
countLetters("fozzy bear") : 1
```