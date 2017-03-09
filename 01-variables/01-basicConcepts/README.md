# Variables

## Table of contents
1. [In Short](#inshort)
2. [Primitive Data Types](#primitivedatatypes)
	1. [The data types](#dataTypes)
	2. [Over and underflow](#overAndUnderflow)
3. [Reference types](#referenceType)
4. [Mathematical statements](#math)
5. [Labs](#labs)

## In Short <a name="inshort"></a>
Variables are used to save and access values from the memory.
They have a specific data type which can be:
* Primitive
* Reference/Object

## Primitive Data type <a name="primitivedatatypes"></a>
### The data types <a name="dataTypes"></a>
Java has eight basic data types known as primitive types shown in the table below.
You can initialise the variables by using the '=' and the specific datatype.

```java
int exampleInt = 5;
boolean exampleBoolean = true;
char exampleChar = 'u';
```

If you don't assign a value to the variable of the primitive data type you will create a variable with a default value.

|Type|Value|Default|Size|Range|Used for|Initialisation|
|---|---|---|---|---|---|---|
| boolean | true, false | false | 1 bit | n/a | Logical decisions | true, false | 
| char | Unicode character | \u0000 | 16 bits | \u0000 to \uFFFF | Representing a single character | 'a' or '\u0061' |
| byte | Signed integer | 0 | 8 bits | -128 127 | Very small natural numbers | 1 |
| short | Signed integer | 0 | 16 bits | -32768 32767 | Small natural numbers | 1 |
| int | Signed integer | 0 | 32 bits | -2147483648 214748647 | Natural numbers | 1 |
| long | Signed integer | 0 | 64 bits | -9223372036854775808 9223372036854775807 | Large natural numbers | 1L |
| float | IEEE 754 floating point | 0.0 | 32 bits | 1.4E-45 to 3.4028235E+38 | Decimals | 1f or 1.0f |
| double | IEEE 754 floating point | 0.0 | 64 bits | 4.9E-324 to 1.7976931348623157E+308 | Large Decimals | 1.0 |

For the Long and Float datatype we always use the suffix L or f. If we do not use this suffix the jvm will assume we wanted to use an int or a double. Also if you want to use a double, always use the 1.0 notation. This has almost no impact when assigning a single number. But when you are doing calculations, this can have a huge impact.<a name="doubleVsInt"></a>

What do you think will happen in the next block of code ?
```java
double result = 1/2;
System.out.println(result);
```
<details><summary>Click for the answer</summary>
Because java assumed you wanted to use 2 integers, which are whole numbers, the result is surprisingly 0.0 .
If we altered the code and gave one of the numbers a decimal notation, the result would be 0.5 like we expect. 
</details>

### Over and underflow <a name="overAndUnderflow"></a>
As seen in the previous table, all data types have a limited range. But what will happen if we exceed this range ?
In short, we start again from the oposite site of the range.

Take for instance the byte variable 127, if we add 1 to it we won't have the value 128 but we will have the number -128.
This is called overflow.

If we try it again but the other way around decreasing the number -128 by 1 we will have the value 127 instead of the number -129.
This is called underflow.

There are some great examples how this can affect you program. Take for instance the game "Sid Meier's Civilizations". In the first edition of the game they used an unsigned variant of the byte (range 0 to 255) for the aggression rating. One of the playable characters ("Ghandi") had a very low aggression rating. Unfortunately when the country became a democracy the aggression rating would decrease with 2 points, creating an underflow that made "Ghandi" to most aggresive character out there.

Try to find other examples and discuss them. 
If you take the under/overflow in consideration why would you use other datatypes than long or double?

## Reference types  <a name="referenceType"></a>
Unlike the primitive data types, the reference datatype is based upon a class. This makes that any other variable, selfmade or not, that isn't a primitive is called a reference type.

Some of the impact will be discussed later on.
The only relevant differences for now are the following:
* Initialising requires the keyword new.
* The defualt value for all reference types is null. This is the same as saying it doesn't exist and will create nullpointers upon usage. 

Some examples of initialising:
```java
String hello = new String("hello");
String helloWithout = "hello";
ArrayList list = new ArrayList();
int[] integers = { 1, 2, 3, 4, 5, 6, 7, 8, 9};
String emptyString;
```

Do note that in the previous example we created a String and an array without a new statement. This is an optimisation in the language. So although we cannot see it we will use the new statement.

## Mathematical statements<a name="math"></a>
The initialisation of a variable can be done by using a mathematical calculation. 
```java
int a = 5;
int b = 5 + a;
int c = b*a;
int d = 5 ;
d += c;
```
As you can see the last statement is a bit different than the other ones. What will be the result for the variable d ?

this is a short notation for `d = d + c;`

For adding or removing 1 from a variable you may also use the 
```java
d++;
++d;
d--;
--d;
```
notations.

Do note that 
```java
d++;
++d;
```
are fundamental different from each other.
The first notation will use the value from d and than add 1. The other will first add 1 to d and than use it.

What do you think will be the result of the following code ?
```java
int a = 0;
a++;
System.out.println(a++);
System.out.println(++a);
```

<details><summary>Click for the answer</summary>
The first line will give a the value 0.
The second will give it the value 1, because we aren't doing something extra to a it doesn't matter if we use `a++ or ++a`.
Now it gets interesting, because we use the a++ notation, we will first use a for printing so we will print 1 and than we will increase its value to 2.
The next line we will first increase the value to 3 than we will print it so we will print a 3.

1
3
</details>



## Labs <a name="labs"></a>
### Lab 1
Try to familiarise yourself in initialisation of the different Data types.

### Lab 2
Using the formula `(1/2) + (4/5)` and initialising a double make sure you have next results:
* 0.0
* 0.5
* 0.8
* 1.3

<details><summary>Hint</summary>
Try to use the fact that [java assumes](#doubleVsInt) you are using integers to your advantage.
</details>

### Lab 3
Use under and overflow to achive the tested values.

### Lab 4
Search and discuss some bugs where the root cause was an under or overflow.
Why would you use a byte/short or a float ? 

### Lab 5
Print the correct calculated items as described in the unit tests.
Try to use different strategies.