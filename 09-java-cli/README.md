# Using Java on the commandline

## Setup

Because you can have multiple Java version installed on your system at the same time, it's important to know which one is configured to be the active one in your terminal.

Finding out what version of Java you have configured right now, is easy:

```
$ java -version
java version "1.8.0_111"
Java(TM) SE Runtime Environment (build 1.8.0_111-b14)
Java HotSpot(TM) 64-Bit Server VM (build 25.111-b14, mixed mode)
```

To change your Java version, it should be enough to set the JAVA_HOME environment variable to the correct Java installation path.

On a Mac:
```
# get a list of all installed JVMs
/usr/libexec/java_home -V

# get the home for an installed 1.8 JVM
/usr/libexec/java_home -v 1.8

# export JAVA_HOME to select a Java 1.8
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

# print out the current java -version
java -version
```
On Windows:
```
# list all JVMs installed in the default location:
dir c:\Program Files\Java

# permanently set JAVA_HOME env variable
setx JAVA_HOME c:\Program Files\Java\{some JDK}

# restart your terminal
exit

# print out the current java -version
java -version
```

Older versions of Java require you to set up your PATH environment variable with the location to the correct java binaries.

> **TASK:** Verify what versions of the JVM you have, and if the proper one (at least 1.8) is setup correctly in your terminal.

## The ProgramArguments program

We need a small program that takes an array of Strings and prints them on the screen, each one on a separate line, each line prefixed with the index of the String in the array.
  
The output should look similar to this:
```
0:first
1:second
2:third
```

> **TASK:** You can use your preferred IDE to implement the printArray method in the ProgramArguments class. 
Don't forget to run the tests that came with the project.

## Compiling a Java program

To get from the text in a source file (ProgramArguments.java) to something the machine, or in the case of Java the Java Virtual Machine, can understand and execute (ProgramArguments.class), we need another program. This program is called a compiler and it takes source code and transforms it into machine code. 
 
In Java this program is named ```javac``` (short for Java Compiler).

> **TASK:** Open your terminal application and navigate to the project directory that contains the source file. Use the ```javac``` tool to compile the ProgramArguments source file.
> 1. What is the result of the compilation? 
> 2. How does this differ from what your IDE (or gradle) is doing? 
> 3. Do you know where your IDE (or gradle) stores the result of compilation?


## Running a Java program

After compilation, we end up with an artifact that we can give to the JVM to execute. For this, we use the ```java``` program. You just give it the name of the class that you want the JVM to run as the only argument.

```
$ java ProgramArguments
```

> **TASK:** Try running ```java``` now. What happens when you do this? What is the difference with running the tests?

### Main method

If you're getting "```Error: Could not find or load main class ProgramArguments```", verify that you are running ```java``` in the directory where compiled .class file is located. If you are seeing the following error message, then you're on the right track:

> ```
>   Error: Main method not found in class ProgramArguments, 
>   please define the main method as:
>     public static void main(String[] args)
> ```

The ```main``` method that the error message refers to is the entry point for your application. We use this method to call the other methods that bootstrap our program. 

> **TASK:**  Add a main method to your program that prints the arguments that were passed when it was started from the command line. Finally, run your program again and pass a few arguments to check that it is working.

```
$ java ProgramArguments Here Be Dragons
0:Here
1:Be
2:Dragons
```

#### Beautification

> **TASK:** Modify your program to prefix the output with "Commandline arguments:" , and to print "None" when no arguments have been passed to the applcation:

```
$ java ProgramArguments
Commandline arguments:
None
```

### ClassPath

> [Classpath][] is a parameter in the Java Virtual Machine or the Java compiler that specifies the location(s) of user-defined classes and packages. The parameter may be set either on the command-line (-cp), or through an environment variable (CLASSPATH).

[Classpath]: https://docs.oracle.com/javase/tutorial/essential/environment/paths.html

By now, you have run your program with the ```java ProgramArguments``` command about half a dozen times. If you have given it any thought, it is possible you were thinking that the command you were giving the JVM is to take the ```ProgramArguments.class``` file and execute it.
  
> **TASK:** Try running your program again, this time using the .class name:
> ```java ProgramArguments.class```

What's happening here? Clearly, writing "ProgramArguments" isn't shorthand for ```ProgramArguments.class```. What you are actually telling the JVM is: find me the class (not class-file) with name ```ProgramArguments```, and run its main method. To find that class, the JVM goes through the classpath, looking for any file containing a class called ProgramArguments. It dynamically (at runtime) loads that class (and all of the classes it depends on), and invokes its main method. Just now, you were telling it to load a class ```ProgramArguments.class``` that doesn't exist.

Yet when you were trying to run the ProgramArguments class before, you weren't having any problems. That is because the current directory is implicitly part of the classpath.

> **TASK:** Change (cd) to the 09-java-cli directory a few levels up. Use the classpath parameter of the java command to run your ProgramArguments program again. You will have to point the classpath to the directory where your ProgramArguments class is located. Look at java -help to help you get going.


## Java Archive (Jar)

A jar file is a collection of Java class files and resources (images, data, configs, ...) stored inside a zipped archive, together with a Manifest file that specifies things about its contents (like which class is the main class).

### Creating a Jar

We will create a jar that packages your single class file ```ProgramArguments.class```. To set this jar up to run our program when the jar is loaded, we need to create a manifest file containing the following line:

> Main-Class: ProgramArguments

In the terminal, while still located in the ```09-java-cli``` directory, creating the manifest is a one-liner:
```
# Windows:
@echo Main-Class: ProgramArguments > manifest

# Unix:
echo "Main-Class: ProgramArguments" > manifest
```

Finally, to [create a jar](jarfiles) we use the ```jar``` command line utility.

[jarfiles]: https://docs.oracle.com/javase/tutorial/deployment/jar/index.html
 
```
jar cvfm programarguments.jar manifest -C src/main/java/ ProgramArguments.class

    c               create a jar archive
    v               verbosely show the files being packaged
    f               write jar to a file
    m               read manifest from a file
    progr...jar     filename of the jar
    manifest        filename of the manifest
    -C dir          root directory of files added to the jar
    Progr..class    the file(s) to add (could be multiple files and dirs) 
```

> **TASK:** If you haven't already done so, create the manifest and the jar. 

### Using a Jar

Once we have a jar, we can put it on the classpath to be able to use the classes that are located within (as a library of sorts). But in the case of your jar, where we have configured the Main class in its manifest, we can tell the JVM to run the jar as an application:
 
```
$ java -jar programarguments.jar The Force Is With Me
Commandline arguments:
0:The
1:Force
2:Is
3:With
4:Me
```

> **TASK:** Run the jar you have just created. In addition, try the alternative of adding the jar to the classpath and running your program  as before, by calling the classname ProgramArguments. 

## Memory Constraints

The JVM, when started, [reserves a big slab of memory](https://www.ibm.com/developerworks/library/j-codetoheap/) that it will need later to allocate classes and objects. Classes (loaded from a file) go into the native heap. Objects (loaded from a class) go into the Java heap. The Java heap is the only heap of memory that we can control. But why would we want to? Well, the JVM reserves a standard amount of Java heap that might not be enough for the program that you are writing. How big this standard amount is, depends partly on how much memory you have in total. Another possibility is that you want to limit the reserved amount because your program is small and simple.

![](https://www.ibm.com/developerworks/library/j-codetoheap/figure1.gif)

To manage the Java heap, the JVM provides two parameters:
```
-Xms<size>        set initial Java heap size
-Xmx<size>        set maximum Java heap size
```

The ```<size>``` argument is in bytes, and must at least 1048576. Alternative notations like 1024K and 1M are also supported for kilobyte and megabyte respectively.

> **TASK:** Try limiting the maximum heapspace of your program to the smallest amount that doesn't crash your program with an OutOfMemory error. Can't get your program to reach its memory limits and crash? Figure out a way to use more memory and break things!