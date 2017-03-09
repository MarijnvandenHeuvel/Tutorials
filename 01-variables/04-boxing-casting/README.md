#Boxing and casting
## Boxing
Autoboxing is the automatic conversion that the Java compiler makes between the primnitive types and their corresponding wrapper object classes. For example the automatic conversion from an int to an Integer.

```java
int i = 5;
System.out.println(i); // this will be boxed to an Integer so we can use the .toString() method.
Integer integ = i;
```

The other way around is called unboxing.

```java
Integer integ = 5;
int i = integ;
```

## Casting
When you are casting a variable, you are trying to change it's type to another type. 
You have 2 different ways of casting, widening and narrowing. 

### Widening
The easiest way to cast a variable is by widening the type of the variable.
This can be done automaticly by using a broader/ larger data type.
```java
int i = 5;
double j = i; //this is a cast from int to double
double k = (double) i; // also a cast to double

String s = "hello world";
Object o = s; // every reference type implements object, so this is a more generic data type.
```

A correct widening cast wont throw a compile or runtime exception.

### Narrowing
A less secure way of casting a variable is by narrowing its datatype. Because you could lose some data you have to manually put in the data type.

``` java
double j = 5.4;
int i = (int) j;

Object o = "Hello world"; // this is a widening cast
String s = (String) o;
```

Because we aren't certain that a narrowing cast is possible, we could get a runtime exception !

```java
Object o = new Integer(1);
String s = (String) o; // this will compile but gives a ClassCastException on runtime
```