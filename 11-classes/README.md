# Classes

In this chapter we will look beyond objects, at classes. We will talk about what a class is, what the parts are that make up a class, and what the purpose of a class is.

What follows is meant as a summary. For more information consult these resources:

- Think Java, [Chapter 11: Classes](http://greenteapress.com/thinkjava6/html/thinkjava6012.html)
- Head First Java 2nd Edition, 
    + Chapter 2: A trip to Objectville
    + Chapter 4: How Objects Behave
    + Chapter 9: Life and Death of an Object

## What is a Class?

A class is a blueprint to an object. More specifically, a blueprint to one particular object type. Objects don't appear out of nowhere. We need some description of which attributes and what methods a particular object should have. When we ask the JVM to create a new object of a particular type, it consults this description to know what it is I'm asking for. While there are other ways to do this (e.g. Prototyping), writing a Class is how it is done in Java and many more object-oriented languages that came before and after it.

Let's start with an example from Think Java. Say we want to have an object that represents a particular time of day, in hours, minutes and seconds. First, we have to be specific about what we are creating, in this case _a class_. Let's name it _Time_.

```java
public class Time {
}
```

Now, what are hour, minute and second to an object representing the time of day?

Right, the attributes that the object needs to represent a specific moment in the time of a day. But think about these attributes for a minute (ha!). Are they objects themselves (they can be), or can they be something else?

It's probably enough for these attributes to be simple primitives at first. Integers (int) for the _hour_ and _minute_ attributes, and a double for the _second_ attribute, to give a little more precision so our object can express time up to a fraction of a second.

Adding these attributes to our Time class, looks like this:

```java
public class Time {
    private int hour;
    private int minute;
    private double second;
}
```

The attributes of an objects are also known under the names _fields_ or _instance variables_. An object of a class is called an _instance_. Hour, minute, second are its _variables_, hence instance variables.

Because we want someone else to be able to use our Time class, we have chosen to make it ```public```. On the other hand, in the best interest of [encapsulation][] (hiding the inner workings of your objects), Time's attributes are ```private```.

[encapsulation]: https://en.wikipedia.org/wiki/Information_hiding

Now we can create Time objects (or instances).

```
Time time = new Time();
```

But there is no way to set ```time``` to the time of day that we want. Because time's attributes are private, ```time.hour = 14``` will throw an error during compilation. 

By default, (only) instance variables are initialized to zero in case of primitive types, and ```null``` for object types. So we have basically created a blueprint for possibly millions of Time objects that all point at the exact same time: "0h, 0m, 0s". If we add colons, we have what every non-technical person's kitchen are flashing at ```0:00:00```.

What we need is a way to initialize each object to the time we need it to be, when it is created. That's where the _Constructor_ comes in.


## Constructors

A constructor is a special kind of method that is called upon when it is time to initialize the object, after it has been created, but before it is returned to the party that uttered ```new Time()```.

We described the constructor as a method, but the Java engineers removed every part of the method that was unnecessary: 

- **We don't need to pick a name, it shares the name of the class**, we don't need to call the constructor by name, ```new``` does that for us.
- **No return type specification**, we can't control what type of object the constructor returns anyway.
- **No return statement in its body**, the constructor always returns the object under construction.
- **We don't need to declare it static**, the constructor is always a member of the class, the constructor can never be invoked on an object.

##### DEFAULT CONSTRUCTOR
The following constructor is called the _default constructor_, it has no arguments and should initialize all instance variables to a sane default:

```java
public class Time {
    private int hour;
    private int minute;
    private double second;

    public Time() {
        hour = 0;
        minute = 0;
        second = 0.0;
    }
}
```

A default constructor is a good thing to have, when the object your are describing allows for one. But this constructor got us exactly nowhere, in this case. We can still only create midnight Time objects. Sometimes, you just need some input from the party that wants to the object created.

That is where overloaded constructors come in. Like with method overloading, we can supply multiple constructors, when they have a combination of arguments that differ in number or types.

The following constructor solves the problem that we had when initializing our Time object:

```java
public class Time {
    private int hour;
    private int minute;
    private double second;

    public Time() {
        hour = 0;
        minute = 0;
        second = 0.0;
    }

    public Time(int hour, int minute, double second) {
        this.hour = hour;
        this.minute = minute;
        this.second = second;
    }
}
```

Because the names of the parameters of our constructor are the same as the names of the instance variables, we need a way to tell them apart. The keyword ```this``` enables us to explicitly access the variables in the scope of this object. These are the object's instance variables.

We can now create a Time object for a specific time of day:

```
Time twoTwentyFiveAndFortySeconds = new Time(14, 25, 40.0);
```

##### REUSING CONSTRUCTORS
Finally, you can call a constructor from the first line of another constructor in order to reduce some code duplication. We applied this principle to our default constructor and a new constructor. Both call the constructor with three parameters to do the initialization of the instance variables. In this case, the ```this``` keyword is used to refer to another constructor. 

```java
public class Time {
    private int hour;
    private int minute;
    private double second;

    public Time() {
        this(0, 0, 0.0);  
    }

    public Time(int hour, int minute) {
        this(hour, minute, 0.0);
    }

    public Time(int hour, int minute, double second) {
        this.hour = hour;
        this.minute = minute;
        this.second = second;
    }
}
```

## Instance methods

Besides instance variables and constructors, a class can also describe instance methods. Remember, these are the methods than can be invoked on an object with the ```dot``` operator.

Say, we are big fans of midnight after all—I know I am. We can add a method to our Time object to reset its state back to 0:00:00. We will call this method ```reset()``` and to make it accessible the method is declared *public*. We don't need to return any value, so the return type is void. Since we also don't need to pass any arguments, the method is parameterless.

```java
public class Time {
    private int hour;
    private int minute;
    private double second;

    // constructors hidden

    public void reset() {
        hour = 0;
        minute = 0;
        seconds = 0.0;
    }
}
```

It performs the same steps as the default constructor, it sets all instance variables to zero.

We can now call this method on a object of type Time.

```
Time time = new Time(6,0);  // that's just too early.
time.reset();
```

##### GETTERS AND SETTERS
In practice, an object will come with a small set of more useful instance methods. One category of these methods is what are typically called getter and setter methods. These provide public read and/or write access to the instance variables of the object. Note that providing this kind of access to your object undermines encapsulation. For every class, and every instance variable you declare, you should carefully consider whether a getter and setter is really necessary.

In the case of our Time object, we are going to hold off on defining any of the getters and setters until we have a need for them.

For a description of getters and setters, go read [Think Java, section 11.4][Getters and setters] Getters and setters. I'll wait here. No, seriously.

[Getters and setters]: http://greenteapress.com/thinkjava6/html/thinkjava6012.html#sec133


## Printing Objects and the toString() method

Printing an object to the screen can be useful if we are debugging an error, if we want to write some action involving an object to a log file, or if we want to show an object in the UI of our program. To do this, we need a String representation of the object.

Java prescribes a standard way to have an object return a String representation. It is done using the ```toString()``` method that is present by default on every object. However, the default implementation of this method does not have a lot of knowledge about your object to return anything useful really.

If we invoke ```toString()``` on our Time object it would return a String that looks something like: ```"Time@60c6f5b"```. Which is the name of the object's class, followed by its location on the Java heap. That could be useful for some debugging scenario (e.g. verifying reference equality), but it's not very pretty, and it doesn't show any of the attributes that are specific to our object.

To this end, we redefine (override) the default toString() implemenation by rolling your own definition:

```java
public class Time {
    // attributes, constructors, methods hidden

    public String toString() {
        return hour+":"+minute+":"+second;
    }
}
```

This results in the following output, if we print it to the screen. Note that println calls the toString() method under the cover, when presented with something else than a String object:

```
Time time = new Time(1,0,1.0/3.0);
System.out.println(time); // outputs: 1:0:0.3333333333333333
```

Granted, it's still not very pretty, but it has all the informtion that we wanted.

For some more information, and a way to makes the output really pretty, read [Think Java, Section 11.5 and 11.6][Pretty printing]: Displaying objects and the toString method.

[Pretty printing]: http://greenteapress.com/thinkjava6/html/thinkjava6012.html#sec134


## Not all objects are created equal

```
// primitive values
assert 3 == 42
assert 3 == 3.0
int i = 1; double d = 1.0;
assert i == d

// object values
Time t1 = new Time(10,10); 
Time t2 = new Time(22,10);
Time t3 = t1;

assert t1.equals(t2);
assert t1 == t3;
assert new Time() == new Time();
assert new Time().equals(new Time());
```

In Java, there are two ways to determine whether two values are the same.

- the identity operator ```==``` that is used mostly for determining wheter primitive values are the _identical_, but can be used on object values.
- the ```equals()``` method of objects that determines whether two objects are _equivalent_. What it means for objects to be equivalent is up to the creator of the object in question.

If we use the identity operator with object values, we are only comparing whether the references of both object variables are identical. This is only the case when both variables are referencing the exact same object. Using the equals method on primitive values is not possible, because primitives aren't objects and don't have methods. However, their object counterparts (Integer, Float, Double, ...) do. They behave exactly like regular objects.

So, as creators of the Time object, how do we define what it means for Time objects to be equivalent as determined by the equals method? Similar to what we did with the toString method, we can override the equals method with our own implementation. And just as with toString, we are encouraged to define our own equals method. _The default equals method uses the identity operator._ We all know that is a terrible way to compare objects.

```java
public class Time {
    private int hour;
    private int minute;
    private double second;

    // attributes, constructors, methods hidden

    public boolean equals(Time other) {
        return this.hour == other.hour
            && this.minute == other.minute
            && this.second == other.second;
    }
}
```

In our own version of the equals method, we compare _this_ time object with the _other_ time object based on their attributes. Only if both objects have the same values for the hour, minute, and second attributes, do we consider both objects equivalent.

The equals method as implemented here is a simplification. We can only pass other Time objects to it. That means our time object cannot handle being compared to other types of objects. Not that we expect to ever return true when being compared to let's say a Point object, but at least we need to return false in that scenario.

> **EXERCISE 11.1:** Open IntelliJ, Lab 1, Time.java.
> Let's give Time a proper equals method. And with us, I mean you.
>
1. Remove the existing equals method.
2. Go to menu Code > Generate, pick equals() and hashCode(). Hit next a few times (the defaults are fine). You can ignore the hashCode() function for now. 
3. Study the generated equals method and explain to someone else what it does.
4. Run the tests.

## Passing and returning objects

When writing a method, object types can be used as the types of the parameters, and as the return type.

Say we want a method ```add``` on our Time object, that, when given another time object, will add that object's time to our own.

```java
public class Time {
    private int hour;
    private int minute;
    private double second;

    // attributes, constructors, methods hidden

    public void add(Time other) {
        double secondSum = this.second + other.second;
        int addMinutes = (int) secondSum / 60;
        this.second = secondSum % 60;

        int minuteSum = this.minute + other.minute + addMinutes;
        int addHours = minuteSum / 60;
        this.minute = minuteSum % 60;

        int hourSum = this.hour + other.hour + addHours;
        this.hour = hourSum % 24;
    }
}
```

This involves some math as we have to take care of possible overflow of seconds, minutes, and hours, when we add both of them together.

## Pure and impure methods

You may not have noticed, but the way that we have implemented our ```add``` method, has turned our _immutable_ object and made it _mutable_. There is now a way to modify the time object after it was created. **This might not be an issue right here and now, but in practice, mutability adds complexity, complexity leads to problems, and problems lead to the dark side.**

The add method as it is defined now is called an _impure_ (or mutator) method because it changes the state of the object by modifying its attributes. The alternative is called a _pure_ method, because it doesn't change the state of the object on which it is invoked, but rather returns the result to the caller.

Let's pretend this never happened and create a new version.

> **EXERCISE 11.2:** It's up to you to make a pure variant of the add method in the Time class. 
>
1. Open Time.java in lab1 and make it so.
2. Review the documentation of [java.awt.Rectangle][]. Which methods are pure? Which are modifiers?
3. If I were to ask the same thing about the immutable class String, what would your answer be?

[java.awt.Rectangle]: http://lmgtfy.com/?s=d&q=java+8+rectangle

> **EXERCISE 11.3:** 
> Lab2. In the board game Scrabble, each tile contains a letter, which is used to spell words in rows and columns, and a score, which is used to determine the value of words.
>
1. Write a definition for a class named Tile that represents Scrabble tiles. The instance variables should include a character named letter and an integer named value.
2. Write a constructor that takes parameters named letter and value, and initializes the instance variables.
3. Write a method that takes an integer parameter named multiplier, and that returns the value of the tile multiplied by the multiplier.
4. Implement the toString and equals methods for a Tile.


## Class variables and class methods

Up to this point, we have always talked about instance variables and instance methods. These are the variables and the methods that are tied to the object. Instance variables exist for as long as the object exists, but not longer. Instance methods can only be invoked on an object, and will not work without the object's instance variables (or it shouldn't be an instance method).

##### CLASS VARIABLES
_Class variables_, like instance variables, are also part of the class description. You can tell them apart by the keyword ```static``` in front of the type of the variable. They are a part of the class, not of each individual object. And so they are shared across all objects of that class. They live as long as the class lives, which is commonly until the program ends. Class variables can be modified during the lifetime of the program. Using one this way though is as dangerous as walking a steel wire between two tall buildings without a life line. It's quite a balancing act too. Don't do it.

Class variables are almost always used to store constant values. In which case they are declared final. This means they are not allowed to be changed after initialization. This is done by adding the ```final``` keyword in front. As a rule their name is also converted to all caps.

```java
public class Time {

    public static final Time MIDNIGHT = new Time(0,0,0);
    public static final Time NOON = new Time(12,0,0);

    // the rest is hidden
}
```

You access them with the dot-operator on the name of the class, like so:

```
Time timeForDinner = Time.NOON;
System.out.println(Time.MIDNIGHT+ ", Happy Hour!");
```

##### CLASS METHODS
_Class Methods_ are part of the class description too. They are commonly used to implement utility functions that operate on objects of the class that they are part of. You recognize them by the ```static``` keyword in front of their name. Unlike instance methods, they don't have access to the ```this``` keyword, because they do not operate in the context of an object.

If we were to implement the add method that we did before, using a static method it would look like this:

```java
public class Time {

    public static Time add(Time first, Time second) {
        // implementation hidden    
    }
}
```

Notice how the add method now does not have one, but two parameters. In addition it is expected to have a return type because there are no instance variables to store the resulting time (as our original implementation of the add instance method did).

> **EXERCISE 11.4:** Lab3. Write a class definition for Date, an object type that contains three integers: year, month, and day. 
> 
1. This class should provide two constructors. The first should take no parameters and initialize a default date. The second should take parameters named year, month and day, and use them to initialize the instance variables.
2. Create a CONSTANT that stores a Date object named CHRISTMAS.
3. Create the equals() and toString() methods.
4. Write an ```addDays``` class method that adds a given number of days to a given date. Handling overflow for months is a non-trivial amount of work, you can use the following class in Java 8 to get the number of days in a month:
```
YearMonth yearMonthObject = YearMonth.of(1999, 2);
int daysInMonth = yearMonthObject.lengthOfMonth(); //28
```

> **EXERCISE 11.5:** Lab5. A rational number is a number that can be represented as the ratio of two integers. For example, 2/3 is a rational number, and you can think of 7 as a rational number with an implicit 1 in the denominator.
>
1. Define a class called Rational. A Rational object should have two integer instance variables that store the numerator and denominator.
2. Write a constructor that takes no arguments and that sets the numerator to 0 and denominator to 1.
3. Write the toString method for Rational (but first, a test).
4. Write a second constructor that takes two arguments and uses them to initialize the instance variables.
5. Write an instance method called negate that reverses the sign of a rational number. This method should be a mutator, so it should be void.
6. Write an instance method called invert that inverts the number by swapping the numerator and denominator. It should be a mutator.
7. Write an instance method called toDouble that converts the rational number to a double (floating-point number) and returns the result. This method is a pure method; it does not modify the object.
8. Write an instance method named reduce that reduces a rational number to its lowest terms by finding the greatest common divisor (GCD) of the numerator and denominator and dividing through. This method should be a pure method; it should not modify the instance variables of the object on which it is invoked.
Hint: Finding the GCD only takes a few lines of code. Search the web for “Euclidean algorithm”.
9. Write an instance method called add that takes a Rational number as an argument, adds it to this, and returns a new Rational object.
There are several ways to add fractions. You can use any one you want, but you should make sure that the result of the operation is reduced so that the numerator and denominator have no common divisor (other than 1).

> **EXERCISE 11.6:** Design and implement a Calendar, consisting of entries, that have a Date, a start time, end time, and a title. Add a way to add entries to a calender, but don't allow overlapping entries. Provide a way to print an overview of a particular day in the Calendar.

> **EXERCISE 11.7:** Design and implement a movie renting service. Limit yourself to classes Movie (title, price, gerne), Rental (returnDate, movie, customer), Customer (name, birthdate, age) and RentalService (customers, movies).