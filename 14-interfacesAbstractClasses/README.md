# Interfaces and abstract classes
##Abstract classes
### What is an abstract class?
An abstract class is a class that cannot be instantiated, but can have subclasses with a instances. It can have abstract methods, this are methods without implementations. Do note that a subclass should implement all the abstract methods of the superclass or should also be abstract.

```java
public abstract class Vehicle {
	private int speed;
    
    public abstract void move();
    public int getSpeed(){
    	return speed;
    }
}

public class Bicycle extends Vehicle{
	public void move(){
    	System.out.println("move "+ getSpeed()+ " blocks");
    }
}
```

> **Lab 1:**
> 
1. Create a class Employee, this should contain a name and a basic annual salary.
2. Calculating the monthly salary is highly dependent on the type of employee:
	1. A normal employee gets 1/12 of the annual salary and in december he will get a bonus of 1/12 of the annual salary
	2. A manager gets 1/12 of the annual salary and a bonus each month determined by the workload of the manager. The formula is ```workload * 1000```. In december he will get a double bonus ! ```workload * 2 * 1000```
3. Use an abstract class and an abstract method.

## Interfaces
### What is an interface ?
An interface is a template that demands certain methods to be available in a class that implements this interface. Unlike (abstact) classes you may implement different interfaces in a single class. Within an interface all methods you add are implicitly defined as public abstract, even when you remove these keywords.

Before java 8 you couldn't have an implementation inside of an interface, this changed in java 8. But just because you can doesn't mean you should.

```java
public interface Vehicle {
	void move();
    public int getSpeed();
    public abstract String getName();
}

public class Bicycle implements Vehicle {
	public void move(){
    	System.out.println("move "+ getSpeed()+ " blocks");
    }
    
    public int getSpeed(){
    	return 20;
    }
    
    public String getName(){
    	return "Bicycle";
    }
}
```

You can implement an interface by using the implements keyword. 

You can create an empty interface, this is called a marker interface.
You can also put constants inside of your interface.

> **EXCERCISE 13.1:**
> 
1. Do you have to implement all methods from an interface? When do you have to, when not?
2. Can an interface inherit from other interfaces?
3. What is a default implementation? and why did Java 8 introduce this? 
4. Search for the diamond problem, is this something related to Java? Why (not)?
5. If you could choose between an interface and inheritance between (abstract) classes, which one should you use? Why?

> **Lab2:**
> 
Recreate the previous example but now use an interface.

> **Lab3:**
> 
1. Create an interface Bus with ID, capacity and cost. Remember you can't set instance attributes/variables inside of an interface!
2. Create an interface LiquidFuel which contains emissionTier, consumption and fill.
3. Create an interface Electric which contains voltage, consumption and recharge.
4. Create 3 different Bus classes, one entire electric, one with only liquid fuel and one hybrid.
5. Create a ServiceStation that can fill the tank or recharge the bateries. 
<details><summary>Hint:</summary>
Don't use 3 methods you can do this by polymorphism.
</details>
6. Can we use an abstract class? Is this a good idea? If so implement this **also** with an abstract class in a separate package.
<details><summary>Hint:</summary>
If someone gives you to choice to be lazy it probably is a bad idea.
</details>

## Labs
### Lab 4
Create 2 interfaces with one of your neighbours. It should have 4 methods that will have some return values. Also don't make it too easy by just returning hardcoded values. You should also discuss which interface you are going to implement.
<details><summary>**Do this first and don't spoil the fun by reading the next instructions**</summary>
Implement a service that uses one of the interfaces without talking with your neighbour. 

Implement the other interface. Make sure your neighbour does it the other way around.
Discuss your implementation with your neighbour. 
Will everything work ? of did you expect another value?
Is your code null safe?
</details>

### Lab 5
1. Create an easy swappable service to get and delete all mails from a mailbox.
2. Create an easy swappable service to send mails to a mail address
3. Implement next use case:

The company ABC receives a large number of mails on the emailadres "info@abc.com". They would like to have an automatic sorting algorithm to sort and clear the mails.
* The algorithm will will call the service to retrive all mails.
* Send the mails to the service you created
* Sorting algorithm: 
	* Containing text "CV" send it to "recruitment" 
	* Containing text "promotion" or "coupon" send it to "spam" 
	* "proposal" should be send to "sales" 
	* Other mails should be send to "reception"
* Make sure all mails are deleted.

after sorting the list print out some information about the sorting itself.

If you are up to it try to call the method multiple times a day and call the printing method for the complete day.

Check for responsibilties of a class. Should the sorting class print the information? Should the sorting class know all information about the sorted items? 

Create 2 different implementations for each service!