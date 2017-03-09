# Introduction to OO

What is Object Orientation?

A different way to structure your code, centered around objects with an ```identity``` that represent some ```state``` (attributes) together with some ```behavior``` (methods) to access and modify that data.

## Objects

Let's start with a simple object: a point in an XY coordinate system. It is called a Point object. The state of a Point object is stored in its attributes ```x``` and ```y```, which are integers (```int```).

#### Creation
To create a new Point object, Java provides the *new-operator* with keyword ```new```:

```
new Point(3,1)
```

The new-operator returns a new Point object, which we normally assign to a variable, otherwise the Point object will immediately stop existing. We can only assign a Point object to a variable of similar type. Each newly created Point returns another object, even if it's created from the same x and y. We deal with object equivalence (identity) later in this session. 

```
Point point = new Point(3,1);
Point anotherPoint = new Point(4,7);
Point yetAnotherPoint = new Point(3,1);
```

#### Attributes
Once we have an object, we can inspect its attributes with the *dot-operator* with symbol ```.```:
 
```
int x = point.x;                    // assigns 3 to x
System.out.println(anotherPoint.y); // prints 7
```

#### Behavior
An object comes with behavior that directly interacts with its attributes. For instance, the point object has a number of methods to access and modify its attributes. Invoking a method on an object is done using the *dot-operator* as well.

- ```translate(int dx, int dy)```
- ```move(int newX, int newY)```
- ```equals(Point point)```
- ```toString()```
- ...

Check the [Point's API documentation][Point] for further information about these and other methods.

[Point]: http://docs.oracle.com/javase/8/docs/api/java/awt/Point.html

The following line invokes method ```translate``` on Point object ```point``` with integer arguments 1 and 3, to translate our point 1 along the X-axis, and 3 along the Y-axis.
 
```
point.translate(1,3);
```

> **EXERCISE 10.1:** Open the PointTest file in Lab1 and implement the tests, using the methods we listed above.
 
## Primitive type vs. Object type
 
Do you remember the value types int, float, double? In Java, they are called primitive types and they are somewhat special, because a value of one of these types (e.g. the ```int```eger 3) is not an object. However, sometimes we need 3 to be an actual object, maybe because we need to pass 3 as an argument to another piece of code that only accepts objects. For these cases the objects Integer, Float, and Double have been created that can wrap a primitive value into an object. 

Yes, it's needlessly messy, but don't worry about it, just thank Java we have autoboxing. Use int, float and double whenever you can though, as they incur a smaller overhead.

> **EXERCISE 10.2:** Go and experiment with the ```new``` and ```dot``` operator both with primitive types and their object counterparts in the ```Primitive.java``` source file. What works and what doesn't? Be sure to explore the other methods that these objects provide (use dot-notation). Can you compare primitive and object types? The object types Integer, Float and Double also provide a slew of utility methods, for instance to convert from a String to a number object type. Create your own method(s) to implement these experiments. You will probably also need a main method to start things off.

> **EXERCISE 10.3 (source [Think Java][]):** Many encryption algorithms depend on the ability to raise large integers to a power. ```Power.java``` has a method that implements an efficient algorithm for integer exponentiation. The problem with this method is that it only works if the result is small enough to be represented by an int. 
>
> - Rewrite it so that the result is a BigInteger. The parameters should still be integers, though. 
> - You should use the BigInteger methods add and multiply. But don’t use BigInteger.pow; that would spoil the fun.
 
[Think Java]: http://greenteapress.com/wp/think-java/

Besides numerical object types, there's a whole universe of other object types out there, besides Point. To get an idea of the object types that Java comes with, take a look at the [Java Platform API specification][sdk] website where it says *All Classes*. To name a few useful types that ship with Java: ```StringBuilder``` (iteratively build a String), ```Random``` (generate random values), ```Color``` (represents an sRGB color). Furthermore, the internet is full of third party code (stay safe), and in the next session we learn how to build our own object types (with classes).
 
[sdk]: http://docs.oracle.com/javase/8/docs/api/
 
## Variables, References, and Null
We look into variables and how they can contain references, and can be ```null``` (empty).

### Variables
You already know about assigning primitive values to variables: ```int favouriteNumber = 8;```. You have already assigned Strings to variables: ```String favouriteActor = "Jason Statham";```. And since Strings are objects, you already know how to assign an object to a variable. Yet, instead of String, you need to put the type of the object you want the variable to keep right in front of the variable name.
 
```
String aString = "And the twelve points go to ...";
Point point = new Point(3,14);
String pointStr = point.toString(); // "java.awt.Point[x=3,y=14]" (the type of object and its state)
```
 
### References
Unlike a primitive variable, an object variable does not store the actual value. It stores a reference to the object on the Java Heap. This means we can have multiple variables referencing the same object on the heap. 

What is printed out at the end of the following code example? Try to figure out what is going on.

```
Point point_a = new Point(99,45);
Point point_b = point_a;
Point point_c = point_b;

point_c.move(45,205);
System.out.println(point_a.toString()); // what is the output and why?
point_b = new Point(85,99);
System.out.println(point_a.toString()); // what is the output and why?
```

In this example, variables ```point_a```, ```point_b``` and ```point_c``` are all aliases to the same object. Each variable will stay an alias until you assign another object to it.

Note that the ```System.out.println``` method will call an object's ```toString()``` method if you pass it an object that is not of type ```String```.

> **EXERCISE 10.4:** If you haven't already done so, put the above code example in java file ```Points.java``` in Lab2 and test your knowledge about what is going on.

> **EXERCISE 10.5:** In this exercise we create an object of the [Rectangle type][]. A rectangle's state (its attributes) consists of its upper-left point (in terms of x and y), its width and its height. You can find the code in this lab's ```Boxes.java``` source file in Lab2.
>
1. _Take a piece of paper and draw boxes for all the objects that are in play just before the end of the main method, with little boxes inside that show the values of their attributes._
2. _What is the output of the program?_
3. _At the end of the main method, are p1 and p2 aliased? Why or why not? If you think you know the answer, which line of code can you write to make absolutely sure?_

[Rectangle type]: http://docs.oracle.com/javase/8/docs/api/java/awt/Rectangle.html
 
### Null
When you declare an object variable, you can assign it a special value ```null```. This means that it references *no object*:

```
Point point = null;
String str = null;
```

You can print these variables out, but don't try to access their attributes or invoke a method on them because you will be punished with the dreaded ```NullPointerException``` error and —if left unchecked— your program will crash.

> **EXERCISE 10.6:** Open ```Crash``` in Lab3 and write a simple program that crashes with a NullPointerException.

## Object Equality
There two kinds of equality in Java when dealing with objects. You can compare two object type variables using the ```==``` *identity* operator (that you know from primitive types), or using the ```equals(..)``` method that check *equivalence*. To save yourself from a lot of trouble and headaches in the future, it's important you keep these two clearly separated. **Most of the time when you are dealing with objects, you will want to check for *equivalence* with the equals method.**

Given: 
``` 
Point a = new Point(1,2);  
Point b = a;
Point c = new Point(1,2);
```

- Reference equality (identical object), the JVM decides whether references are equal:
   ```
   assert    a == a;   // same object
   assert    a == b;   // same object
   assert !( a == c ); // different objects
   ```

- Object equality (equivalent objects), the object's ```equals(..)``` implementation decides what equivalence means.
    ```
    assert  a.equals(a);  // a Point object is equivalent with itself
    assert  a.equals(b);  // a Point object is equivalent with itself
    assert  a.equals(c);  // a Point object is equivalent to a Point object with the same x and y.
    ```

For a deeper discussion on both equality operations, read up on:

- [Think Java: The equals method](http://greenteapress.com/thinkjava6/html/thinkjava6012.html#sec136)
- Head First Java 2nd Edition: Ch 16, "What makes two objects equal?"

> **EXERCISE 10.7:** Open ```Equality``` in Lab4, and implement the buildLorem method to make the test succeed.
> Are we dealing with reference or object equality here?
> Hints:
>
- _Look up information on StringBuilder, then create an object and use it._
- _It should be possible to add words to the lorem array without modifying the program every time (the test would need to be extended though)._

## Mutable vs. Immutable Objects
When we invoke the translate or move methods on a Point object, were are modifying its attributes. Given what we have learned about multiple aliases, one object may be used throughout your program. If we change the object, every other reference to this object will be affected by this change as well. That's why it is often considered a bad idea to change objects once they have been created.

An object that cannot be changed is called an immutable object. One common example is the String. Once a String object is created, it can never be changed. Every method that is invoked on a String object, and that changes the String, returns a new String object that is based on the old one, with the modification applied.
  
If you want to make an object immutable, you will have to consider and implement this semantic during its design.

> Q: What happens when an unstoppable invocation meets an immutable object?
> A: UnsupportedOperationException

**EXERCISE 10.8:** Create a table with two columns: immutable, mutable. Put all the objects you've come in contact with in Java into this table. If you're not sure, dive into the documentation, or try it out in IntelliJ.

## Object Lifecycle

An object is created. The object in use. Finally, when there is no variable left with a reference to the object, it is marked for removal from memory.

The background JVM process that removes unused objects is called the Garbage Collector.

For more information, go read:

- Think Java: [Garbage collection]. (http://greenteapress.com/thinkjava6/html/thinkjava6011.html#sec124)
- Head First Java 2nd Edition, Ch9, Section "Now we know how an object is born, but how long does an object live?"