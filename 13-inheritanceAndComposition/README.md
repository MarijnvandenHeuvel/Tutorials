# Inheritance and composition
## Table of contents
1. [Inheritance](#inheritance)
2. [Composition](#composition)
3. [Labs](#labs)

## Inheritance <a name="inheritance"></a>
### What is Inheritance?
In an Object oriented programming language a class can be derived from other classes, thereby inheriting fields and methods from those classes. Take for instance the example of a Bicycle:

```java
public class Bicycle{
	public int gear;
    public int speed;
    
    public void shiftGearUp(){
    	gear++;
    }
    
    public void shiftGearDown(){
    	gear--;
    }
    
    public void break(int decrement){
    	speed -= decrement;
    }
    
    public void speedUp(int increment){
    	speed += increment;
    }
}
```

If you're only interested in getting from point a to point b you'll probably only need this information. But you're not going to use a normal bike to ride on difficult terrain like sand or mud. You'll probably use a mountainbike. 

```java
public class MountainBike extends Bicycle{
	public int tyreWidth;
    
    public void changeTyre(int tyreWidth){
    	this.tyreWidth = tyreWidth;
    }

}
```
Just like in real life java gives you the opportunity to have a specialised type. This is called a subclass. You can see if a class is a subclass or not by the modifier ```extends``` next to the class definition.

The mountainbike subclass extends the bicycle, this means he inherits all the fields and methods from the super class.

```java
MountainBike mountainBike = new MountainBike();
mountainBike.speedUp(5);
mountainBike.shiftGearUp();
mountainBike.changeTyre(54);
```
> **EXERCISE 13.1:**
> 
1. Do you think the previous block of code works ?
2. What would happen if we put in ```Bicycle bike = new MountainBike()``` would this work? why ?
3. Would it have an impact on the previous block of code?
4. What is the link between inheritance and Casting ?

> **Lab 1:**
> Create next classes without any real content. This is just used for grasping the concept of extending a class.
>
1. Create a class polygon
2. Create a class triangle
3. Create a class quadrangle
4. Create a class rectangle
5. Create a class square
6. Describe their relationship

### Constructor
The constructor of a subclass will allways call a constructor of the super class. By default it will call the default super constructor but if the default constructor isn't accessible he will give a compilation error.

**Block 1:**
``` java
public class Bicycle{
}

public class MountainBike extends Bicycle{
}
``` 

**Block 2:**
``` java
public class Bicycle{
}

public class MountainBike extends Bicycle{
	public MountainBike(int tyreWidth){
    }
}
```

**Block 3:**
``` java
public class Bicycle{
	public Bicycle(int speed, int gear){
    }
}

public class MountainBike extends Bicycle{
}
``` 
> **EXERCISE 13.2:**
> Which of the previous codeblocks would compile ? and why?

### Using the keyword super
In the chapter about classes we learned about the keyword ```this```. The keyword ```super``` stands for the fields and methods described in the super class. If there aren't any naming conflict you don't have to use the ```super``` keyword, the java compiler should be smart enough to point to the right method/field.

```java
public class Bicycle{
	public int speed;
    public int gear;
    
    public void gearUp(){
    	gear++;
    }
}

public class MountainBike extends Bicycle{
	public int frontGear;
    public int maxBackGear;
    
    public void gearUp(){
		super.gearUp();
    	if(gear > maxBackGear){
        	frontGear++;
        	gear = 1;
        } 
    }
}
```
As you can see we can access the fields of the super type without using the ```super``` keyword but we had to use ```super.gearUp()``` to ensure we used the method described in the super class.

This is also used for the constructor.
Without noticing it, the first line of a constructor within Java is always:
```java
...
public MountainBike(){
	super();
}
...
``` 
Just like we used the ```this``` keyword to call a different constructor, we may use super() keyword to call a different constructor of the super class.

```java
...
public MountainBike(int speed, int gear){
	super(speed, gear);
}
...
```
The only restriction of using the super keyword within a constructor is that it should be on the first line of the constructor method.

> **EXERCISE 13.3:**
>
1. Is it a good idea for using super when you are accessing fields on your super class ?
2. When should you use super ?

> **Lab 2**
>
1. Create a class Person with a name and a birthdate.
2. Create a class Adult that has a jobtitle. It should also have a name and birthdate
3. Create a class Child that has the name of the school they go to.
4. Create a class UnbornChild that doesn't have a name nor a birthdate.
5. They should all be connected to Person, and constructed with all of their expected values.

### Object
We've already used inheritance without even realising it. Every reference type we used/created already extends the class ```Object```. This ensures we have some methods that could be used within Java utility classes. 

This makes the class Object the only Java class that doesn't have a super class. 
> **EXERCISE 13.4:**
>
1. Name some methods we use from the ```Object``` class.
2. What would be the impact if the ```Object``` class didnt exist?

### Method overriding and hiding
When you define an instance method with the same name ,parameters and return type as an instance method in your super class we call this method overriding. You will use the instance method on the lowest sub class you instantiated.

``` java
public class Bicycle{
	public void gearUp(){
    	gear += 1;
    }
}

public class MountainBike extends Bicycle{
	public void gearUp(){
    	gear += 2;
    }	
}

public class ForestMountainBike extends MountainBike{
	public void gearUp(){
    	gear += 3;
    }	
}
```

> **EXERCISE 13.5:**
>
1. what will the following code blocks do?
``` new Bicycle().gearUp();```
``` new MountainBike().gearUp();```
``` new ForestMountainBike().gearUp();```
2. Is there difference between
``` Bicycle bike = new ForestMountainBike();```
and
``` ForestMountainBike bike = new ForestMountainBike()``` 
When does this have impact ?
3. Search for Liskov Substition principle, try to explain it to one of your colleagues.

The term method hiding is used when you have 2 class(static) methods with the same parameters, name and return type. We call this method hiding because we will not automaticly use the closest implementation to subclass, but use the class we called. Most of the time this has almost no impact in our coding style, because static methods will almost always be called on the class, and not on an instance.

```java
public class Bicycle{
	public static void doSomething(){
    	System.out.println("we are printing the Bicycle");
    }
}

public class MountainBike{
	public static void doSomething(){
    	System.out.println("we are printing the MountainBike");
    }
}

public class Main{
	public static void main(String[] args){
    	Bicycle.doSomething();
        MountainBike.doSomething();
        Bicycle bike = new Bicycle()
        MountainBike mountainBike = new MountainBike();
        Bicycle downCastMountainBike = new MountainBike();
        
        bike.doSomething();
        mountainBike.doSomething();
        downCastMountainBike.doSomething();
    }	
}
```
The outcome will be :
* "we are printing the Bicycle"
* "we are printing the MountainBike"
* "we are printing the Bicycle"
* "we are printing the MountainBike"
* "we are printing the Bicycle"

> **EXERCISE 13.6:**
>
1. Why is the last line Bicycle and not MountainBike ?
2. If this wasn't a static method, would it have been a different outcome ?

> **Lab 3**
>
1. Copy the solution of Lab 2
2. Create the method introduce()
3. For a Person it would return "I'm a person: {name} I'm {age} years old";
4. For an adult it would return "I'm a person: {name} I'm {age} years old and work as a {jobtitle}"
5. For a child it would return "I'm {name} I'm already {age}! I go to {school}"
6. For an unborn child it would return an empty string.
7. Does this break the Liskov principle ?
8. Also make a method levelUp() this will return the next "level" in life. So from UnbornChild to Child to Adult stays a Adult. Can we use Overriding in here ? will this break the Liskov principle ?

### Field hiding
When you have a field in your subclass with the same name as a field in the superclass you will hide the field of the superclass. But be aware, NEVER use this! Unlike instance methods, fields are hidden. This has an impact on the way we return values. 

```java
public class Bicycle{
	public int gear = 0;
	
    public in getGear(){
    	return gear;
    }
}

public class MountainBike{
	public int gear = 0;
    
    public in getGear(){
    	return gear;
    }
}

public class Main{
	public static void main(String[] args){
    	Bicycle bike = new Bicycle()
        MountainBike mountainBike = new MountainBike();
        Bicycle downCastMountainBike = new MountainBike();
        
    	System.out.println(bike.gear);
        System.out.println(mountainBike.gear);
        System.out.println(downCastMountainBike.gear);
        System.out.println(bike.getGear());
        System.out.println(mountainBike.getGear());
        System.out.println(downCastMountainBike.gerGear());
    }
}
```
> **EXERCISE 13.7:**
>
1. What is the output of previous code block ?

## Composition
Individual abstractions offer certain functionalities that need to be combined with other objects to represent a bigger abstraction: a composite object that is made up of other smaller objects. You need to make such composite objects to solve real-life programming problems. In such cases, the composite object shares HAS-A relationships with the containing objects, and the underlying concept is referred to as object composition.

By way of analogy, a computer is a composite object containing other objects such as CPU, memory, and a hard disk. In other words, the computer object shares a HAS-A relationship with other objects.

``` java
public class Bicycle{
	public int gear = 0;
	public Wheel wheel; //composition
}
```

> **EXERCISE 13.7:**
>
1. Should you use composition or inheritance ? Why ?

## Labs
See other labs within the explanation.
### Lab 4
As a bank owner I want to have bank accounts with a person, balance and an account number. Depending on the account type we have 4 different withdrawal rules. 
1. CHEAP: You may only withdraw 100 euro a day, you can never have a negative balance.
2. LOW: You may withdraw up to 1000 euro a day, but you can never have a negative balance.
3. MEDIUM: You may withdraw up to 2000 euro a day, you can have a negative balance but if you start the withdrawal transaction negative you cannot do the withdrawal.
4. RICHAFUK: You have no limits.

The person should have a birthdate and a name.
Which part is composition, which part is inheritance?

### Lab 5
If you didn't do Excercise 11.7 from classes, do this first:

Design and implement a movie renting service. Limit yourself to classes Movie (title, price, gerne), Rental (returnDate, movie, customer), Customer (name, birthdate, age) and RentalService (customers, movies).

A rental movie has different types:
1. 1 day movies: you should return it the next day, the price is 5 euro.
2. trending movies: you should return it within a week, the price is 3 euro.
3. older movies: you should return it within a weej, the price is 1 euro.

Make it possible to downgrade each movie in the RentalService.

### Lab 6
If you didn't do Exercise 11.6, do this first:
Design and implement a Calendar, consisting of entries, that have a Date, a start time, end time, and a title. Add a way to add entries to a calender, but don't allow overlapping entries. Provide a way to print an overview of a particular day in the Calendar.

You have different type of entries:
1. Informative entries, this may overlap with anything.
2. Low importance entries, if another event is added with an higher rank this entry will be deleted.
3. Medium importance entries, this may overlap with other entries, but a warning should be added.
4. High importance entries,this entry may only overlap with other entries when you already have an overlapping lower ranking entry and you try to add an high importance entry or with informative entries.

Find a way to make it possible to delete entries.
