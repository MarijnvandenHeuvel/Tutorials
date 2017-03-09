# Nested Classes
## What is a nested class ?
You should have already noticed that a single java file contains one class with the same name as the java file. But this isn't completely true. A class may contain one or more other classes. This is calles a nested class. 
```java
public class OutherClass{
	public class NestedClass{
    
    }
}
```

This could be usefull if the logic of the class is very tighly coupled with the outer class but should be used in a different class. For instance ``` comperators``` or ```factories```.

## Difference between static nested class and nested class
### Static nested class
The static nested class is an innerclass that can be created without creating a instance of the outerclass. It can access the fields of the outerclass but will need an instance as a parameter or creating it within one of its methods.

```java
public class OuterClass{

	private String cantTouchThis;
    
	public static class NestedClass{
    	public OuterClass createOuterClass(String inputString){
        	OuterClass outer = new OuterClass();
            outer.cantTouchThis = inputString;
            return outer;
        }
        
        public void changeOuterClass(OuterClass outer, String inputString){
        	outer.cantTouchThis = inputString;
        }
    }
    
    public static void main(String[] args){
    	OuterClass.NestedClass nested = new OuterClass.NestedClass()
        OuterClass outer = nested.createOuterClass("I can change you");
        nested.changeOuterClass(outer, "changed once again");
    }
}
```

> **EXCERSICE 18.1**
> 
1. Why can the innerclass reach the private fields of the outerclass ?
2. When do you think this could be usefull ?

### Nested class
A nested class is an innerclass that always need an instance of the outerclass to be created. It has no reason to exist without having an outerclass. In return you can always access the instance of the outerclass.

```java
public class OuterClass{
	private String cantTouchThis;
    
    public class NestedClass{
    	public NestedClass(String inputString){
        	cantTouchThis = inputString;
        }
        
        public void changeOuterClass(String inputString){
        	OuterClass.this.cantTouchThis = imputString;
           //only necesary when you are hiding fields
        }
    }
    
    public static void main(String[] args){
    	OuterClass outer = new OuterClass();
        OuterClass.NestedClass inner = outer.new InnerClass("Welcome to the dark side");
        inner.changeOuterClass("change me")
    }
}
```

You can also hide  your fields of the Outerclass by having fields with the same name in the innerclass.

> **EXCERCISE 18.2:**
> 
1. When do you think this could be usefull. 
2. Try to draw the difference between an static and a nonstatic nested class.
<details><summary>Hint:</summary>
Draw it like a Venn diagram.
</details>

> **Lab 1**
> 
1. Create the class MusicianNonStatic with a nested class Instrument
2. Add the method makeNoise() to the nested class Instrument
3. Add the method play() the the MusicianNonStatic, this will create a new instance of the innerclass and calls the makeNoise() method.
4. Should this instrument be static or not?
5. Instantiate the instrument outside of the MusicianNonStatic class.
6. Should this instrument be static or not?

> **Lab 2**
> 
1. Create a class Garbage with a nested class Factory
2. Create a method that creates an instance of Garbage on the class Factory
3. Should this class be static or not?
4. Give Garbage a field where we can add some Garbage Strings.
5. Create a method on Factory that can add Strings to the field, this is the only method that can change the field.
6. Create a method on Garbage that prints every String of the field.

## Local inner class
A local inner class is a class that only exist within the scope of a certain method. To be honest, not even google can find a usecase for this class. 

```java
public class OuterClass{
	public void method(){
    	class LocalInnerClass{
        	public void printSomething(){
            	System.out.println("we should print something");
            }
        }
        LocalInnerClass local = new LocalInnerClass();
        local.printSomething();
    }
}
```

## Anonymous class
An anonymous class is an extension/implementation of another class declared at initialization. It is used when you want to extend a class only once. These classes are called anonymous because they don't have a name.

```java
public class OuterClass{
	public void method(){
    	SuperClass object1 = new SuperClass(){
        
        };
        
        Comperator<Integer> comperator = new Comperator<>{
        	public int compare(Integer o1, Integer o2){
            	return o1 - o2;
            }
        }
    }
}
```

> **EXCERCISE 18.3**
> 
1. Why isn't it usefull to add other non overridden public methods to an anonymous class ?
2. Do you think we use this ?

## Callback method
A callback method, is a method that takes a function as a parameter. In java this is achieved with creating an interface with a single public method.

```java
public class Text{
	private String sentence;
    
    public void printFilteredWords(WordFilter filter){
    	for (String word: sentence.split(" ")){
        	if (filter.isValid(word)){
            	System.out.println(word);
            }
        }
    }
}

public interface WordFilter {
	boolean isValid(String word);
}
```

When using the printFilteredWords you could use an anonymous class:
```java
public static void main(String[] args){
	Text text = new Text("Hello this is an example sentence");
    text.printFilteredWords(new WordFilter(){
    	public boolean isValid(String word){
        	return word.contains("e");
        }
    })
}
```
> **Lab 3**
> 
1. Create a callback method that will do an addition if the number is valid.
2. Only do the addition when it is a positive number.
3. Only do the addition when the number is greater than 5.
4. Only do the addition when it is a negative number.

## Lamda's
If you think you fully understand what a callback method is you may use the following link to read about lambda's:
[Quickstart from oracle](http://www.oracle.com/webfolder/technetwork/tutorials/obe/java/Lambda-QuickStart/index.html)
[DZone basic lambda expressions](https://dzone.com/articles/java-lambda-expressions-basics)

Change lab 3 to use lambda's.

## Labs
### Lab 4
1. try the Text example.
2. (if you know how) change the class to a lambda.
3. Create an interface WordProcessor with a method that has a String parameter and as return type
4. Create a method on Text that will print the String after it is processed by WordProcessor.
5. Create a static method String reverse
6. Find a way to use the static method inside of Text without changing the Text class
<details><summary>Hint:</summary>
Use an anonymous class that uses the method or use method reference if you know what it is.
</details>
7. Make a class TextScrambler with a method that has a String parameter and return type
The method should replace these letters:
	1. a -> @
	2. e -> @
	3. l -> 1
	4. o -> 0
8. Use it in the method for WordProcessing

### Lab 5
1. Read about the builder pattern
2. Create a builder for a person with name, firstname, birtdate, id.
3. Create a builder for a family that can use persons. If you want to entertain yourself make sure you can delegate to person builder.
4. Did you make this a nested class or not ? Why ? If not make it a nested class.

