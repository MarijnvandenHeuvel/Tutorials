# Java - Modifiers

## What Are They

Acces modifiers are in important concept in Java and Object Oriented design in general. They basically determine how to outside world is able to look at, access and change parts of our Object. They specify accessibility of a data member, method, constructor or class.

There are essentially two types of access modifiers:

* At the top (or class) level: public, or package-private (no explicit modifier).
* At the member level: public, private, protected, or package-private (no explicit modifier).


We'll have a look at two other important modifiers as well, though these aren't strictly access modifiers. 

1. static
2. abstract

They are part of the non-access modifiers group, though we'll only touch on these two. The other modifiers that belong to this group are much more advanced.

## Access Modifiers

A class may be declared with the modifier public, in which case that class is visible to all classes everywhere. If a class has no modifier (the default, also known as package-private), it is visible only within its own package (packages are named groups of related classes — you will learn about them in a later lesson.)

At the member level, you can also use the public modifier or no modifier (package-private) just as with top-level classes, and with the same meaning. For members, there are two additional access modifiers: private and protected. 

* The private modifier specifies that the member can only be accessed in its own class. 
* The protected modifier specifies that the member can only be accessed within its own package (as with package-private) and, in addition, by a subclass of its class in another package.

The following table shows the access to members permitted by each modifier.


|Modifier|Class|Package|Subclass|World|
|--------|-----|-------|--------|-----|
|public|Y|Y|Y|Y|
|protected|Y|Y|Y|N|
|no modifier|Y|Y|N|N|
|private|Y|N|N|N|


The first data column indicates whether the class itself has access to the member defined by the access level. As you can see, a class always has access to its own members. The second column indicates whether classes in the same package as the class (regardless of their parentage) have access to the member. The third column indicates whether subclasses of the class declared outside this package have access to the member. The fourth column indicates whether all classes have access to the member.

Access levels affect you in two ways. First, when you use classes that come from another source, such as the classes in the Java platform, access levels determine which members of those classes your own classes can use. Second, when you write a class, you need to decide what access level every member variable and every method in your class should have.

### Examples

Let's have a look at some examples for a class:

```java
public class HelloWorld {
	
}
```

And here's the "default" modifier, also known as the package private modifier. Essentially this means that we do not explicitly define a modifier.

```java
class HelloWorld {

}
```

Here are all the variable/method/constructor modifiers:

```java
public class HelloWorld {
	public String publicString = "";
	private String privateString = "";
	protected String publicString = "";
	String publicString = "";


	public void helloPublicWorld() {
		// Accessible to the entire outside world!
	}
	
	private void helloPrivateWorld() {
		// Accessible only to this class itself!
	}
	
	protected void helloProtectedWorld() {
		// Accessible not only to this class itself, but also to subclasses
	}
	
	void helloPackagePrivateWorld() {
		// Accessible to all the members defined in this package
	}
}
```


## Accessor Methods

Now, you may wonder: what is the point of making certain fields private? One reason could be that we only use a certain field inside of our class, though this is not very common. Usually, we want control over HOW our fields are actually accessed.

Imagine a `Person` class that look like this:

```java
public class Person {
    public int age;
    public String name
    public List<Person> parents;
}
```

Someone could to the following:

```java
Person person = new Person();
person.age = -32;
person.name = "gWPTJbvHNQdlcNtr";
person.parents = null;
```
So, we now have a Person with age -32 called gWPTJbvHNQdlcNtr who has no parents. Does that seem like a sensible way to use this class? Considering this person would be considered a scientific abnormality, probably not.

Instead, we could create accessor methods. These are public methods that allow us to read and redefine values from our private fields. As an added bonus, we can put certain logic in said those methods. We refer to these methods as **getters and setters**.

We could rewrite the class above:

```java
public class Person {
	private int age;
	private String name
	private List<Person> parents;
    
	// Getters    
	public int getAge() {
    	return this.age;
	}
	
	public String getName() {
		return this.name;
	}
	
	public List<Person> getParents() {
		return this.parents
	}
	
	// Setters
	public void setAge(int age) {
		if (age < 0) {
			throw new IllegalArgumentException("Age must be positive!");
		}
		this.age = age;
	}
	
	public void setName(String name) {
		if (name.isEmpty() || !name.chars().allMatch(Character::isLetter)) {
			throw new IllegalArgumentException("Your name can only contain letters and cannot be empty!");
		}
		this.name = name;
	}
	
	public void setParents(Person mother, Person father) {
		if (mother == null || father == null) {
			throw new IllegalArgumentException("Only Jesus had no parents!");
		}
		this.parents = Arrays.asList(mother, father);
	}
}
```

Keep in mind that this is an extremely naive implementation, but the point is that you get the idea. Here we've clearly taken control over what is allowed and what is not allowed. The process of controlling outside access is part of something we call **Encapsulation**. Once again, this is something we will learn about later on when we talk about Object Oriented design.

This may seem like an extremely verbose example. This is true. We've essentially expanded our codebase by a large factor. This is not uncommon in Java as, generally, it tends to be a rather verbose programming language. However, writing this has made our class more robust, and that is a good thing.

Others may note that in the course of your career you will be writing many, many classes. Do we have to write getters and setters over and over again? Essentially: yes. Code that is very easy to write, is very similar and if written very often is usually referred to as boilerplate code. Luckily, there are many tools in the Java world that help to alleviate this pain a little. Many IDE's contain the ability to autogenerate getters and setters for you!

## Static, Abstract & final

There are three more modifiers we will discuss that are modifiers, but not access modifiers.

### Static

The `static` modifier essentially denotes that the member is not bound to an instance of a class. A method that is defined as static can be invoked regardless of whether you're holding an object instance or not.

Example:

```java
public class HelloWorld {
	private static String greeting = "Hello world!";
	
	public static String getGreeting {
		return this.greeting;
	}
}
```

### Final
The `final` modifier states that the object can't initialise to another value.
For primitives this means you can't alter the value of the variables.
For other objects this means you can't alter the memory location, but could alter values of that object.

```java
final int i = 1;
i = 2; // this won't compile !

final Person person = new Person();
person.setAge(5); // this will compile !

```

### Abstract
The abstract modifier will be explained later in the course.

## Labs
### Lab 1
Make the methods in class MainLab1 and MainLab2 as closed as possible.
The test MainLab1Test should be able to call the methods methodToTest and methodToTest2.