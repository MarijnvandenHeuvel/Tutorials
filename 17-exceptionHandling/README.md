# Exception handling
## What is Exception handling
An exception is an event that happens within the excecution of a program. This should be considered as an error and interrupts the happy path of a program. We can catch these exceptions and try to handle them in a safe way.

You shouldn't use exceptions for any logic within your code. 

```java
try{
	double calculation = 5/0;
} catch(Exception ex){
	System.out.println(ex.getMessage());
    ex.printStackTrace();
}
``` 
> **EXCERCISE 17.1**
>
1. Why is the previous block of code not a good example on how to use exception handling ?
2. Can we use the double outside of the try block ? Why ?
3. For what stands the exception within the catch ? Could you change it to something else ?

There are diffent kinds of exceptions we could catch:

![polymorphism](img/classdiagramException.png)

**Throwable:**
Common superclass for all exceptions. This ensures that we can throw errors within the JVM.
**Error:**
Grave system errors. Most of the time you shouldn't try to recover from these kinds of errors. For instance it's not usefull to catch an OutOfMemoryError since the only possible thing we could do is kill the program, something that is done automaticly by the JVM.
**Exceptions**
Common superclass for all exceptions you should handle.

You may catch muliple exceptions at the same time, but you should consider the order of the catch blocks.

```java
int[] intArray = new intArray[5];
try{
	intArray[6] = 5;
}catch(Throwable e){
	System.out.println("Throwable");
}catch(Exception e){
	System.out.println("Exception");
}catch(RuntimeException e){
	System.out.println("RuntimeException");
}catch(IndexOutOfBoundsException | ArrayIndexOutOfBoundsException e){
	System.out.println("IndexOutOfBoundsException or ArrayIndexOutOfBoundsException");
}
```

> **EXCERCISE 17.2**
>
1. What do you think the previous block of code will print ?
2. How can we fix it ?

Somethimes you want to ensure a code block will be excecuted with or without failures . For instance if you are working with files you don't want to keep them connected when you encountered an error. The finally code block is designed for situations like this.
It will be excecuted eventough an error occured.

```java
try{
	intArray[6] = 5;
}catch(Throwable e){
	System.out.println("Throwable");
}finally {
	System.out.println("We executed the code");
}
```

> **EXCERCISE 17.3**
>
1. What would happen if an error occured whitin the finally block?
2. What is the difference between a ```finally``` block and just adding some code after the ```catch``` block ?

> **Lab 1:**
>
1. Create a method that takes in 2 numbers and divides them.
2. Make sure no error blocks the program.
3. If it is a divided by zero or not a number exception you should print a specific message: "Please do not divide by zero."
4. Make sure you print out a suffix.

## Difference checked and unchecked exceptions
You may already have noticed that some exceptions can be thrown and you don't need a try catch block and for other exceptions your compiler complains that you should catch or throw the exception. 

This is called between checked or unchecked exceptions.

**Unchecked**
These are all exceptions that have RuntimeException as a supperclass. 
You aren't obliged to handle these errors, but you should handle them somewhere in your code. You will use this a lot for throwing the exception to the front end without having to put throw on every method.

**Checked**
You have to handle these exceptions. You could use a try catch block or use the throws keyword. This will forward the exception to the next method.

```java
public void printFileContents() {
	try{
    	System.out.println(getFileContents());
    } catch(IOException e){
    	e.printStackTrace();
    }
}

public String getFileContents() throws IOExceptions {
	BufferedReader br = new BufferedReader(new FileReader("foo.txt"));
    StringBuilder result = new StringBuilder();
	String line = null;
    while ((line = br.readLine()) != null) {
		result.append(line);
        result.append("\n")
 	}
    return result.toString();
}
```

> **Excercise 17.4**
>
1. What is missing in the previous code block ?
2. Is the ArthemeticException checked or unchecked ?
3. When creating your own exception, why would you use a checked exception, why an unchecked?

## Creating your own exception
**Throwing an exception**
You can always throw any new exception. This is done by instantiating the exception and using the keyword throw.
```java
throw new UnsuportedOperationException("implement me after the test");
```

**Creating an exception**
You can create your own exception by extending one of the Throwable supperclasses.

```java
public class NoTeacherFoundException extends RuntimeException {

}
```

> **Lab 2**
>
1. Create your own exception KittyDiedException where you can add a message.
2. Throw this exception with the message "Another one bites the dust"
3. Why should you create your own exceptions ?
4. Did you make this a checked or unchecked exception ?

## Labs
### Lab 3

1. Create your own validation exception
2. Create a new account with following validation rules, you should return a validation error:
	1. Person should be at least 18 years old
	2. Person should have a first and last name
	3. Person should have an adress
	4. Bank account should have a starting amount
	5. Bank accout should never go under 0
3. What will happen if you have 2 validation errors? Try to figure out how to solve this. 

### Lab 4
1. Try to figure out how you can save some text to a file.
2. Does this throw checked or unchecked exceptions ?
3. Why should you use a finally block?
4. Can you replace this by something?
<details><summary>Hint</summary>
Search for something called try with resource.
</details>
5. Try to explain to a colleague what this is.
