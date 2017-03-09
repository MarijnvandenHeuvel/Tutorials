# Java - Conditional Statements

## What are they?

We've previously seen how to give our applications structure using methods. However, we currently have no way of manipulating the **flow** of our applications. No matter what happens, our program will always execute from top to bottom, and we have no way to branch out into different paths.

For that we need conditional statements.

There's two you need to know about:

* The `if / then / else` statement
* The `switch` statement

But before we can actually use these, we need to learn about conditional and relational operators.

## Operators

The relational and conditional operators allow us to compare values to each other, providing input for the conditional statements, thus influencing the flow of our program.

None of these should really surprise you. Here's a list:

|Operator|   |
|---|---|
||**Relational Operators**|
|`==`| Equal to |
|`!=`| Not equal to |
|`>`| Greater than |
|`>=`| Greater than or equal to |
|`<`| Less than |
|`<=`| Less than or equal to |
||**Logical Operators**|
|`!`| Conditional NOT |
|`&&`| Conditional AND |
|`||`| Conditional OR |
|`^`| Conditional / Bitwise XOR |

For those unfamiliar with the last three, the `&&`, `||` and `^` operators perform Conditional-AND, Conditional-OR and Conditional-XOR operations on two boolean expressions.

They behave like this:

|AND|||Result||OR|||Result||XOR|||Result|
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
||false|false|false|||false|false|false|||false|false|false|
||true|false|false|||true|false|**true**|||true|false|**true**|
||false|true|false|||false|true|**true**|||false|true|**true**|
||true|true|**true**|||true|true|**true**|||true|true|false|

A last small note on these:  Both `||` and `&&` operators exhibit "short-circuiting" behavior, which means that the second operand is evaluated only if needed.

So in this example: `false && true`, only the left-hand side needs to be evaluated, because the result can NEVER be true after a `false` has been encountered with the `&&` operator (if you don't get this, refer to the table above).

They also each have a non-short-circuiting variant in the form of `&` and `|`. You won't be using these very often.


## If / Then / Else

Imagine you want to execute a piece of code only under certain conditions. Well, it's easy using the if statement. It takes the following form:

```java
if (<Conditional Expression>) {
	// code to be executed
}
```

Here's a concrete example:

```java
public static void yawn(int hour) {
	if (hour > 22) {
		// It's getting late, we're tired
		System.out.println("*YAWN*");
	}
}
```

But now we're only added a single condition. Surely there are more conditions we can add? Yes we can, using `else if`. Let's have a look.

```java
public static void yawn(int hour) {
	if (hour < 9) {
		// We're still sleeping at this point
		System.out.println("*Zzzzzz*");
   	else if (hour > 22) {
   		// It's getting late, we're tired
   		System.out.println("*YAWN*");
	}
}
```

There, now you can clearly see that we are actively branching the flow of our program. But there's still one more catch. What if we want to do something only when neither of the above conditions is true? For that, we use `else`.

```java
public static void yawn(int hour) {
	if (hour < 9) {
		// We're still sleeping at this point
		System.out.println("*Zzzzzz*");
   	else if (hour > 22) {
   		// It's getting late, we're tired
   		System.out.println("*YAWN*");
	}
	else {
		// The rest of the day, we're hard at work
   		System.out.println("I'm working!");
	}
}
```

That's more or less it. Do keep in mind that the conditional statements can be more complex than what we showed here. For example, what if I only want to print out `"I'm working!"` between 9:00h and 22:00h? We could do it like this:

```java
public static void yawn(int hour) {
	if (hour < 9 && hour > 22) {
   		System.out.println("I'm working!");
	}
}
```

> ### Note
The If statement also has a slightly shorter form without curly braces which you can use if the body of the if statement is only a **single** line of code. For example, the last code snippet can be rewritten like this:

> ```java
public static void yawn(int hour) {
	if (hour < 9 && hour > 22)
   		System.out.println("I'm working!");
}
```
Be careful when using this notation. It is important that you indent you code properly so that it remains clearly readable. For example, check out the snippet below:

>```java
public static void yawn(int hour) {
	if (hour < 9 && hour > 22)
   		System.out.println("I'm working!");
   		System.out.println("*Sigh* I wish it was weekend already...");
}
```
The line `System.out.println("*Sigh* I wish it was weekend already...");` is actually incorrectly indented, so you might not realise that it is in fact **not** part of the if-body! Always format your code properly, or avoid this shorthand form altogether.

## The Switch Statement

The switch statement has the same purpose as the If-Then-Else statement, but it's used in different situations. The main difference is that `switch` is not used for evaluating conditional statements, but actually operates on values. A quick example will make this easier to understand:

```java
switch (age) {
	case 0:  
    	System.out.println("You were just born!");
    	break;
	case 1:  
    	System.out.println("You are one year old!");
    	break;
	case 2:  
    	System.out.println("You are two years old!");
    	break;
	case 3:  
    	System.out.println("You are three years old!");
    	break;
	case 4:
    	System.out.println("You are four years old!");
    	break;
	case 5: 
    	System.out.println("You are five years old!");
    	break;
	default: 
    	System.out.println("You are one year old!");
    	break;
}
```

There's two things to note here:

1. The last line, `default` is called when none of the values above match with `age`.
2. You have probably noticed the numerous `break;` statements. These are necessary to stop our code from 'falling through'. Essentially, if there are no breaks, our program will keep executing the code paths that are *below* the path that was matched. So in the example above, if `age` was `3`, it would print out `"You are three years old!"`. But if we modified our program to look like this:

```java
switch (age) {
	case 0:  
    	System.out.println("You were just born!");
	case 1:  
    	System.out.println("You are one year old!");
	case 2:  
    	System.out.println("You are two years old!");
	case 3:  
    	System.out.println("You are three years old!");
	case 4:
    	System.out.println("You are four years old!");
	case 5: 
    	System.out.println("You are five years old!");
    	break;
	default: 
    	System.out.println("You are one year old!");
    	break;
}
```

It would then print out:

```
"You are three years old!"
"You are four years old!"
"You are five years old!"
```
The switch statement also has some heave restrictions. A switch works with the byte, short, char, and int primitive data types. It also works with enumerated types (discussed later), the String class, and a few special classes that wrap certain primitive types: Character, Byte, Short, and Integer.

## A shorthand notation: `?:`

If you are trying to assign a value based on a condition, `?:` will be your best friend. Here's an example:

```java
String allowed = (age >= 18) ? "Yes" : "No"
```

* The part before the `?` is the conditional statement. It's what we are evaluating to be true or false.
* The part between the `?` and `:` is the result if the conditional is true.
* The part after the `:` is the result if the conditional is false.

We could have also written it like this:

```java
String allowed;

if (age >= 18) {
	allowed = "Yes";
} else {
	allowed = "No";
}
```

But I'm sure you'll agree that the example above is more concise and perhaps also much clearer. Moreover, we never have to create `allowed` without assigning a value! How nice!

# Labs

Now: time for some questions and exercises.

## Lab 1

Consider the following piece of code:

```java
if (aNumber >= 0)
    if (aNumber == 0)
        System.out.println("first string");
else System.out.println("second string");
System.out.println("third string");
```

### Lab 1.1

What output do you think the code will produce if aNumber is 3? Is it what you predicted? Explain why the output is what it is; in other words, what is the control flow for the code snippet?


### Lab 1.2

Using only spaces and line breaks, reformat the code snippet to make the control flow easier to understand.

### Lab 1.3

Use braces, { and }, to further clarify the code.

## Lab 2

Write Java program to allow the user to input his/her age. Then the program will show if the person is eligible to vote. A person who is eligible to vote must be older than or equal to 18 years old.

You will have a few tests that you can run to see if your program is valid.

## Lab 3

Write a method called checkOddEven which returns "Odd" if the int variable number is odd, or “Even” otherwise. 

You will have a few tests that you can run to see if your program is valid.

> Hint: Don't forget to make sure your casing is right! Strings are case-sensitive.

## Lab 4

Write a method called largestNumber. Given three values, x, y, and z, determine the largest value return it.

Once again you will have a few tests that you can run to see if your program is valid.

## Lab 5

Write a method that calculates the amount of discount a person receives based on the age.
* Children between 0 and 3 doesn't have to pay
* Children between 3 and 6 only pay 5 euro.
* Children between 6 and 12 only pay 10 eurs.
* Teens between 12 and 18 pay 15 euro.
* Adults pay 20 euro.
* Seniors starting from 65 pay 10 euro.

Also try to write some tests for this usecase !
> Hint: You should have at least 13 test cases !

## Lab 6

Write a method and tests for the following.
* When a number can be divided by 3 you should return "FIZZ"
* When a number can be divided by 5 you should return "BUZZ"
* When you can divide it by 3 and 5 you should return "FIZZBUZZ"
* otherwise you should return the number itself

## Lab 7

In Belgium the Modulo 97 is very popular to use as a digit check. 
We use it for the NISS number (INSZ/rijksregisternummer at the back of your identity card) and for bank account numbers.

Try to implement those 2 checks with some tests.

## Lab 8

This is an extra lab. Only start this if you are ahead of the group, or at home when you have some time.
This lab is not configured in gradle.

Create a method that returns a number in text format.
For instance 20 should return twenty.
999 999 999 is the largest number you should be able to calculate.

Also implement this in Dutch.