# What is Java

![alt text](img/java.jpg)

## Table of contents
1. [In Short](#inshort)
2. [General Purpose](#generalpurpose)
3. [Object Oriented](#objectoriented)
4. [Strong and Statically typed](#typing)
	1. [What Is It?](#what)	
	2. [But Why Use It?](#why)	
5. [Compiled](#compiled)
	1. [In The Beginning](#beginning)	
	2. [Higher Level Programming](#highlevel)	
	3. [Managed Code](#managed)	
6. [JRE & JDK](#jrejdk)
	1. [JRE](#jre)	
	2. [JDK](#jdk)	
7. [Lab 1](#lab)


## In Short <a name="inshort"></a>

Java is a programming language that is:

* **General Purpose**
* **Object Oriented**
* **Strong and statically typed**
* **Compiled**
* **Garbage Collected**

Ok, but what does all of that mean? Let's have a look. Don't worry if this isn't clear yet, most of these subjects will be treated in greater depth later.

## General Purpose <a name="generalpurpose"></a>

There exists many programming languages that are meant to be used for very specific purposes, for example: statistics, mathematics, game engine scripting, GPU programming, etc (R, MATLAB, UnrealScript, ...). Java is not that type of language, and was designed to accommodate the development of all types of software.

## Object Oriented <a name="objectoriented"></a>

In Java we have decided to adopt a very specific world-view that we call Object-Oriented. You will learn much, much more about this in the very near future (so we won't spend too much time here), but put simply, in an OO programming language we separate much of our application code into objects. When programming our application we create so-called Classes. Each class represents a mould of sorts, from which can then create (instantiate) objects. An objects holds both state (in the form of fields) and functionality (in the form of methods). 

![An Object Oriented Car](img/oo-car.png "An Object Oriented Car")

A classic example is a car. In an OO language, you could define a Car class as having a certain:

   	colour
   	wheel size 
   	fuel level
	license plate
	current speed
	maximum speed
	... 
	
These would take the form of fields in our class definition.	

At the same time, we also define what a Car can do. This could include, for example: 

	refueling
	checking the current fuel level
	speeding up or down
	turning its headlights on or of
	moving forward for a specified distance
	...
	
These functions would take the form of methods in our class definition.	

There are many, many more aspects to OO, but don't worry too much about this now as we'll soon discuss this concept more in-depth.

## Strong and Statically Typed <a name="typing"></a>

### What is it? <a name="what"></a>


In Java, we declare all of the data in our program to be of a certain type. This may seem logical to you. If not, consider yourself for a moment. You have a name, an age, a date of birth, a height, etc.

In Java, we say for example that your age (e.g. 26) is of type `int`, meaning Integer (you may know this as a "whole number"). Your name is a `String` for example (essentially a sequence of characters, a.k.a "text"), your date of birth could be of type `Date` and your height would be a `double` or a `float` (both represent real numbers).

It is important to understand that once we declare a piece of data to be of a certain type, it has to conform to that type. It is restricted both in the data it can hold and the operations it can perform.

As such, Java is considered to be a statically typed language. Programming languages that are statically typed try to improve type safety, which is the extent to which it tries to prevent erroneous or undesirable program behaviour caused by a discrepancy between differing data types for the program's constants, variables, and methods.

Consider the following example (don't worry about the exact details here):

```java
int numberOne = 1;	// <--- A whole number
int numberTwo = 2;	// <--- Another whole number
numberOne + numberTwo
```

The above is a perfectly legal operation. Java knows that it can add two whole numbers to each other.

Also, once we say `numberOne` is of type `int`, we can't go back. `numberOne` will always hold integer data. As such, this is impossible:

```java
int numberOne = 1;
numberTwo = "Hello World!";
```
The example above is an example of how Java is **statically typed**. We always declare our data types beforehand, and we want Java to tell us whenever we, as a programmer, make a mistake with our types (like we did above).

All of the above examples probably make a lot of sense. The types we mentioned are all pretty self-evident. Now, how about we introduce another type?

Remember our `Car` class from above when we talked about Object Oriented programming? It too, is a type! Remember when we said that in java, data has to conform to a specific form and is restricted in the operations it can perform? Well, that aligns very well with the definition of an object, does it not?

Now, to quickly recap:

- **Static typing**: We declare the type of data that we will hold upfront, and these types cannot be changed whenever we feel like it. We prefer that Java notifies us about errors as soon as it can detect them.
- **Strong typing**: The definition of this is a little more vague, but generally this means that the more strongly typed a language is, the more likely is to generate an error when our types are not lined up.


### But why use it? <a name="why"></a>

You may be wondering why using a strong and statically typed language is such a good idea? Doesn't that make our program more rigid and difficult to handle? 

Well, actually, the debate between statically typed languages and its rival, dynamically typed languages is as old as time itself. A quick search of this search of this subject of the internet will yield enough results with endless, yet pointless, discussions that will most likely render you insane.

Below we will see some reasons as to why people who believe in static typing prefer it over dynamic typing:

* A large class of errors are caught, earlier in the development process, closer to the location where they are introduced.
* The types guide development and can even write code for you. The programmer ends up with less to specify.
* One can change the structure of existing code with greater confidence, since a large class of errors introduced during refactoring will end up as type errors. 
* Static types can ease the mental burden of writing programs, by automatically tracking information the programmer would otherwise have to track mentally in some fashion.
* Types serve as documentation for yourself and other programmers.
* Static typing may improve runtime efficiency.


## Compiled <a name="compiled"></a>

It is important to understand that the code you write is in actually not the code that gets executed by your computer. To some this is probably evident, but to others this may sound like a very strange thing to say.

In truth, your computer does not "speak" Java. It is unable to interpret the Java code that you write. In order for it to understand our instructions, it needs to be translated further. This process is called **compilation**.

### In the beginning <a name="beginning"></a>

In order to understand how compilation in Java works on a basic level, let's take a very quick look at a tiny bit of history. 

When we look very close to the metal of your actual computer, we see that our CPU actually speaks in Machine Code. These are a set of instructions that are specific to your processor family.

Here's an example from the MIPS instruction set:

```
   6      5     5     5     5      6 bits
[  op  |  rs |  rt |  rd |shamt| funct]  R-type
[  op  |  rs |  rt | address/immediate]  I-type
[  op  |        target address        ]  J-type
```

Needless to say, these instructions are extremely easy to decipher by the CPU, but nearly impossible for us humans to comprehend. Numerical machine code may be regarded as the lowest-level representation of a compiled or assembled computer program.

In order to for us to be productive, we need something that is closer to our human language.

A long time ago, programs were written in assembly language. This was is a very low level programming language (the more low-level a language is, the closer it is to the bare metal and the less abstractions it generally possesses) were every instructions was very closely mapped to the actual machine code it would result in. The translation from Assembly to Machine code was done via an assembler. 

Here's an example:

```
MOV EAX, [EBX]	  ; Move the 4 bytes in memory at the address contained in EBX into EAX
MOV [ESI+EAX], CL ; Move the contents of CL into the byte at address ESI+EAX
```

Not much better, right?

While assembly allowed for humans to write programs in text, this still isn't very readable. Furthermore, this code was bound to a specific instruction set or processor family. Writing assembly code is a skill most modern programmers are not expected to possess anymore. Furthermore, as you might be able to see, this type of low-level programming required the programmer to keep meticulous track of all the memory they assigned. The developer has to allocate all the memory space he wants to use, and clean it up afterwards. Failure to do so can have devastating results.

### Higher Level Programming <a name="highlevel"></a>

![Layers of Programming Languages](img/highlevel.png "High Level Programming")

As history went on, many more high-level programming languages sprung to life. Like we said before, the goal of higher-level programming languages is to abstract away the details of the machine away from the programmer.

An example of a language that was designed to be a higher-level programming language is C. It has a much more human-readable syntax, but generally it still tries to keep many concepts mappable to what will eventually end up as Machine Code. But using a language like C still comes with a cost. Like in assembly language, it is still requires that the programmer does all the memory management. The compilation of C to Machine Code is a very complex process that can also be pretty resource intensive and time consuming. The end result of compiling a piece of C code is still Machine Code.

### Managed Code <a name="managed"></a>

Java takes yet another approach. Java Code is often called "managed code". The reason for this is that Java code (unlike C or Assembly) is NOT compiled to Machine Code. The end result of compiling Java code is a bunch of Java class files containing platform-neutral Java Bytecode.

Here's an example piece of Java code:

```java
outer:
for (int i = 2; i < 1000; i++) {
    for (int j = 2; j < i; j++) {
        if (i % j == 0)
            continue outer;
    }
    System.out.println(i);
}
```
Below you can see its (rather scary and intimidating) bytecode equivalent:

```
0:   iconst_2
1:   istore_1
2:   iload_1
3:   sipush  1000
6:   if_icmpge       44
9:   iconst_2
10:  istore_2
11:  iload_2
12:  iload_1
13:  if_icmpge       31
16:  iload_1
17:  iload_2
18:  irem
19:  ifne    25
22:  goto    38
25:  iinc    2, 1
28:  goto    11
31:  getstatic       #84; // Field java/lang/System.out:Ljava/io/PrintStream;
34:  iload_1
35:  invokevirtual   #85; // Method java/io/PrintStream.println:(I)V
38:  iinc    1, 1
41:  goto    2
44:  return
```

This proces includes almost no optimization. Java Bytecode is difficult for humans to read, but it also not meant for your CPU to understand. So, what happens with Java bytecode?

![Java Compiler](img/javac.png "Java Compiler")

It's time to get introduced to the Java Virtual Machine, better known as the JVM. The JVM is able to: 

* Take your Java class files containing Java bytecode, load them into the machine using the class loader
* Execute the bytecode using the required interpreter. It is only at this point that the bytecode is turned into platform-specific instructions. This essentially means that the JVM is required to have an interpreter for each different platform. As long as there is an implemented interpreter on our platform, we can run our Java bytecode there. While there are, as always, some caveats, it allows us to write programs that are largely platform independent. The JVM has the ability to take different strategies when it comes to the bytecode: 
   * It can interpet it on the fly, only dealing with it as it encounters it
   * It can use a so-called JIT compiler to compile pieces of the code to native machine code as the program is running. Usually this process will be applied to parts of the code that are often executed, thereby speeding up execution significantly.
* Java programs that run in the JVM are memory managed. That means that, unlike in languages like C or Assembly (which don't have a runtime like the JVM), the programmer does not have to do manual memory allocation and de-allocation. Instead, the JVM performs a process called **Garbage Collection**, which tracks and cleans used memory whenever the algorithm decides the data in memory is no longer of any use. Whenever the programmer instantiates a new class, memory is allocated implicitly. This frees the programmer from tedious housekeeping.
* The JVM also allows for sandboxing code. For example, in darker times, some web applications made use of Java applets, which were Java applications that would run in the browser, but were intended to be completely sandboxed for security reasons, as it is often hard to trust the source of a piece of code on the internet. The use of Java applets is generally frowned upon these days, and Oracle will de discontinuing the Java browser plugin when Java 9 is released.
* Another ability of this model is that, effectively, there is no requirement for Java bytecode to be compiled from Java. What this means is that you can write applications that run on the JVM that are NOT written in the Java language. Several such languages exist today! Examples include Groovy, Scala, Clojure, and even the ability to run the Ruby programming language on the JVM with jRuby. This allows those languages to present a different approach to programming while making use of the rich and mature infrastructure of the JVM. Of course, these are outside the scope of this course.

![JVM](img/jvm.png "JVM")

Running managed code inside a virtual machine does also come with some downsides:

* While the Garbage Collection on the JVM has been fine-tuned over the many years it has been used, and even though there exist may GC algorithms, there is still a penalty in performance when it is used. This is why Garbage Collection is often considered undesirable in application like video games or in system programming.
* While the JVM may be optimised for long-running application, it does take a few seconds to start. This makes it very undesirable for command-line application. Imagine running a command like `echo "Hello World"` in your terminal and having to wait 3 seconds before you see the output. The JVM has both a Client and a Server profile, where the Client profile is meant to be used for short-running apps, but the start-up time remains unfit.
* Running a Java application requires the JVM to be available on the local machine. When developing a server-side application (which is what Java is most commonly used for), you only need to provision your server. When developing something that will be deployed to client machines, you have to be sure that the correct version is available for use on said machines.

## JRE & JDK <a name="jrejdk"></a>

You've probably heard of the terms JRE and JDK before. But what are they exactly? And how do these differ from the JVM?

### JRE <a name="jre"></a>

When talking about the JRE, we are usually talking about the the JRE distributed by Oracle, the current owner and supporter of Java. The JRE is essentially a software package that includes a stand-alone Java VM, a browser plugin, the Java standard libraries and a configuration tool. The JVM shipped in this package is called "HotSpot" and is maintained by Oracle itself. JRE stands for *Java Runtime Environment*, and only contains the required software to **run** Java applications.

> ### Note
You may have noticed that this package contains a specific JVM implementation. Linux users are probably more familiar with OpenJDK/IcedTea, an effort to make HotSpot and the JRE buildable on Fedora/Red Hat using only open source tools. HotSpot is considered a reference implementation, and alternative implementations exists for different platforms and environments. Another well-known implementation is IBM J9, though IBM no longer offers stand-alone packages for Windows or OS X, but they are still available for Linux, AIX, zOS and AS400. WebLogic application servers still come packaged with it on all platforms.

> Android, for example, famously uses Apache Harmony, an open source Java implementation, in its Android operation system. Apache Harmony was not only declared defunct by the Apache organization in 2011, but also led Google to be sued in 2012 by Oracle in the long-running case of Oracle v. Google where Oracle lawyers accused Google engineers of copying the Java API, which Oracle claimed infringed its patents. Despite Google coming out of the case mostly as the winner (as of this writing), Android made the rather drastic switch to OpenJDK upon the release of Android 7.0 "Nougat".


### JDK <a name="jdk"></a>

The JDK is essentially the JRE package, plus all the tools need to not only run Java applications, but to **develop** them as well. This includes `javac`, the Java compiler, `jar`, to archive class files into a JAR archive, `jdb`, the Java debugger, `VisualVM`, a profiling tool, and many more. It stands for *Java Development Kit*.

Thus, the JDK should only be required by Java developers.

## Lab 1 <a name="lab"></a>

Let's Write Some Code!

Now that we know about Java, what is stands for, what the JVM, JDK and `javac` are, let's compile something!

Open your favorite text editor. We don't need an IDE yet for this simple exercise.

We're going to create, compile and run the classic Hello World program. In your text editor, write this piece of code:

```java
class HelloWorld {
  public static void main(String[] args) {
    System.out.println("Hello World!");
  }
}
```

Now, save the file as `HelloWorld.java`.

Let's compile the program! Open your terminal and type `javac HelloWorld.java`. Remember `javac`? That's the Java compiler!

After you've executed this command, you should see the following two files in your directory:

```
 ~/Source/javatest ll                                                                                                                
total 16
-rw-r--r--  1 javauser  CEGEKANV\Domain Users   426B Dec 13 10:43 HelloWorld.class
-rw-r--r--  1 javauser  CEGEKANV\Domain Users   107B Dec 13 10:43 HelloWorld.java
```
Remember, `HelloWorld.java` is the original source code your entered into your text editor, and `HelloWorld.class` is the output of invoking the `javac` compiler.

Now, let's execute our code. Enter the following into the terminal:
`java HelloWorld`, and you should see the following output:

`Hello World!`

There is one more interesting thing we can do however. In the real world, Java programs are not run by directly executing a *.class file. Imagine that you have a large program, containing over 100 classes. The compiler would turn this into 100 class files. How would you know which one to run? How would you distribute your application?

Enter the JAR file format. The JAR format (essentially **J**ava **AR**chive, it's even based on the ZIP file format) was introduced so you can package your application *.class files, additional resources and finally some metadata.

So why don't we create a jar so we can distribute this awesome application? Execute the following command: 

`jar cvfe HelloWorld.jar HelloWorld HelloWorld.class`

There we go, you should now have a .JAR file in the directory:

```
 ~/Source/javatest ll
total 24
-rw-r--r--  1 javauser  CEGEKANV\Domain Users   426B Dec 13 10:43 HelloWorld.class
-rw-r--r--  1 javauser  CEGEKANV\Domain Users   778B Dec 13 10:55 HelloWorld.jar
-rw-r--r--  1 javauser  CEGEKANV\Domain Users   107B Dec 13 10:43 HelloWorld.java
```

But let's step back for a moment and examine the command you just executed.

`jar cvfe HelloWorld.jar HelloWorld HelloWorld.class`

* As we already know, `jar` is the program that packages your files as into an archive.
* The arguments `cvfe` tell the program that (`f`) we want to specify if what we want to do with our jar file, (`c`) we need to create a new jar file, (`v`) we want some output about what it did and (`e`) we want to specify an entry-point for our application (more on this below).
* `HelloWorld.jar` is the name of the jar file we want to create.
* `HelloWorld` is the name of the class we defined as the entry point. This means that this class that Java will look into when executing the jar file. It will inspect the class, and look for a method that looks like this: `public static void main(String[])` and execute it.
* `HelloWorld.class` are the classes we want to bundle. This can contain wildcards, like `*.class`.

Now, finally, run the JAR file:

`java -jar HelloWorld.jar`

and you should see:

`Hello World!`

This concludes the exercise!
