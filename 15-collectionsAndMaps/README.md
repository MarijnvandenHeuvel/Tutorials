# Collections

What is a Collection? It is an objects that contains other objects. More specifically, the term is most often used when referring to objects that implement the Collection interface that comes with Java. In addition to this interface, Java comes with a boatload of objects that implement all kinds of collections with differing ways of storing and accessing their elements: Queue, Stack, ArrayList, HashSet, etc. The following figure shows a small number of the most used objects in my experience:

![The Java Collection Hierarchy](img/collection-hierarchy.png)

The top collection abstraction is the ```Collection``` interface. It defines that each object that *is-a* Collection needs to implement the following methods (this is a subset):

```java
  boolean add(E element)
  boolean remove(Object o)
     void clear()
  boolean contains(Object o)
 Iterator iterator()
      int size()
  boolean isEmpty()
 Object[] toArray()
```

The *E* that is used as the type of the parameter of the add method is a template for the exact type of objects that can be in a particular instance of a list. We will explain this further when we talk about Java Generics.

You should be able to figure out what all of these methods do, except ```iterator()```. Notice how there is no method to get a single element from the collection. The only way to interact with the elements in a collection is through the iterator.

##### ITERATOR

The figure shows that Collection itself *is-an* [Iterable][], because Collection implements the Iterable interface. This interface dictates that an object that implements it needs to support a way to traverse all of the elements that it contains, one by one. The way to implement that in Java is with an [Iterator][] object. In other words, for an object to *be* and Iterable, it needs to *implement* an ```Iterator```. You use the concept of an iterator when you traverse a collection using a *for-each loop*, for instance:

```java
for(Person person : members) {
    System.out.println(person.getName());
}
```

Whatever type of collection ```members``` is, it needs to return an iterator for the for-loop to present them to you one by one, in the ```person``` variable.

## List, Queue, Set, GO!

The Collection interface is rather generic. The Java designers have created a few more specialized collection types that let you interact with a collection of elements in interestingly different ways. 

### LIST
The ```List``` is an *ordered* collection of elements (it might remind you of an array).
> The user of this interface has precise control over where in the list each element is inserted. The user can access elements by their integer index (position in the list), and search for elements in the list.

|             |   |   |   |   |   |   |   |   |   |   |     |
|-------------|---|---|---|---|---|---|---|---|---|---|-----|
| **index**   | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | ... |
| **element** | E | E | E | E | E | E | E | E | E | E | ... |

List adds the following methods to the bunch (I'm trying hard to avoid confusing you by using the words list or set here) of methods it inherits from Collection (cfr. above):

```java
   void add(int index, E e)
   void set(int index, E e)
      E get(int index)
      E remove(int index)
```

With List, we have a method to *get* at a specific element, if we know its index.

Objects that implement the List interface are [ArrayList][] and [LinkedList][]. We can create and use an ArrayList object like this:

```java
public class Company {
    
    private List employees = new ArrayList();

    public void addEmployee(Person employee) {
        this.employees.add(employee);
    }  
} 
```

Note how we store the ArrayList object in a variable that has type ```List```. We could have chosen ```ArrayList``` for the variable's type just as well, but using a more abstract type makes our code more flexible. **Pop-quiz: how is the property of programming languages called that allows us to assign an ArrayList object to a variable typed List (a super-type of ArrayList)?**

> **Lab1:**
> This lab deals with a deck of cards.
> 
1. Look at classes Card, Suit and Rank and make sure you understand them. Run all their tests, and fix problems if you find them.
2. Open class Desk. Run its test class, and solve the problems you find. 
3. Stay in the Desk class. Come up with a Collection object for the cards instance variable, and replace the Card[] Array with it. The code in the Deck class will break. That is to be expected. We will refactor the object completely in the following steps.
3. Refactor the Deck's default constructor, to use your new cards collection object.
4. Refactor the Desk's other constructor.
5. Refactor the static emptyDeck() method.
5. Refactor the numberOfCards() method.
6. Refactor the getCards() method.
7. Refactor the shuffled() method. Check out the [Collections Utility Class section](#the-collections-utility-class) further down this document for something that could help you shuffle, instead of adjusting the algorithm. It is alway preferable to use logic that is build in, if it suits your needs.
8. Refactor topCard() and popDeck().
9. Refactor pickCard().
10. Refactor splitDeck().
11. Refactor the equals() method.

### QUEUE

A [Queue][] is an ordened list that represents a waiting list.
> A collection designed for holding elements prior to processing. Besides basic Collection operations, queues provide additional insertion, extraction, and inspection operations.

Queue adds the following two categories of methods.
   
```java
  Throw exception  |    Return null    
-------------------+----------------------
boolean add(E e)   |  boolean offer(E e)  
      E element()  |        E peek()
      E remove()   |        E poll()
```

A method on the left does the same thing as a method on the right, but the left one throws an exception (an error) when invoked on an empty Queue (a queue with 0 elements), while the right one returns ```null``` instead. An example of an object that implements Queue is PriorityQueue.

The Queue interface is further specialized in the [Deque][] interface.
> A linear collection that supports element insertion and removal at both ends. The name deque is short for "double ended queue" and is usually pronounced "deck".

It adds a few more methods that allow you to interact with the elements at 
the top of the list. One implementation of Deque is the object [LinkedList][].


### SET
The last specialization interface of Collection in this overview is the [Set][]. Set stands out from the other because it is *unordend*. There is no notion of first, last, before or after.
> A collection that contains no duplicate elements. More formally, sets contain no pair of elements e1 and e2 such that e1.equals(e2), and at most one null element. As implied by its name, this interface models the mathematical set abstraction.

This means, for instance, that the ```add(E e)``` method will only add element ```e``` if it is not yet contained within the set. For a Set to work well, you will need to implement the ```equals(Object o)``` method on the objects, because the add method uses element equality to detect duplicates.

An implementation of Set is [HashSet][]. It uses [Hashing][] to optimally store its elements inside. That's where the elusive ```int hashCode()``` method finally reveals its purpose.

```java
Employee mrWhite = new Employee("Mr. White");
Set employeeSet = new HashSet();
employeeSet.add(mrWhite);
assert employeeSet.contains(mrWhite);

for(Employee empl : employeeSet) {
    System.out.println(empl);
}

employeeSet.clear();
```

A further specialization of the Set interface is [SortedSet][]. In addition to having only unique elements, all of its elements are also sorted. To tell whether one element is smaller than another, the elements will need to implement the [Comparable][] interface. If you want to add an object type to a SortedSet that doesn't implement Comparable, you will have to supply the SortedSet with a [Comparator][] (mind: different from the Comparable) that knows how to sort this type of elements.

This allows the SortedSet to provide the following additional methods:

```java
E first()
E last()
```

In addition, the set's iterator will traverse the set in ascending element order. 

An implementation of SortedSet is [TreeSet][].

##### DEFINING A COMPARATOR
When the type of object you are adding to a SortedSet doesn't implement the Comparable interface, and consequently cannot be compared out of the box, you can pass a custom [Comparator][] to the constructor of a SortedSet implementation.

```java
SortedSet employeeSet = new TreeSet(new Comparator() {
        @Override
        public int compare(Object o1, Object o2) {
            return 0; // implement compare logic here.
        }
    });
```

A Comparator's compare method compares its two arguments for order. It returns a negative integer, zero, or a positive integer as the first argument is less than, equal to, or greater than the second.

> **Lab2:**
> Open Lab2, the Hand class. Complete the implementation to make the tests succeed.
> 
1. Choose a Collection object that stores Card objects. Make sure the cards in a Hand are sorted, first by Suit, then by Rank in the order that they are defined in Rank and Suit's values() functions. *Hint: You will have to define a custom Comparator for your Collection object. To compare based on the index of an element in an array, use a combination of Integer.compare() to compare ints, aList.indexOf() to get the index of an element in a List, and Arrays.asList() to turn the value() arrays into List objects.*
2. Implement methods addCard(), addCards. You shouldn't need a loop for addCards. Make use of [Collections][] and [Arrays][] where possible.
3. Implement hasCard(), sizeOfHand() and getCards().
4. Implement playHand() and playRandomHand(). To play a random hand you will need a Random object (look in Deck for inspiration). You will probably also need a loop.
5. Implement toString(). Remember that object that we've used before to build Strings.

## An Overview of Collection types in this document

|  Collection type  | Unique | Ordened | Sorted | Random Access |
|-------------------|--------|---------|--------|---------------|
| [PriorityQueue][] |        | X       |        |               |
| [ArrayList][]     |        | X       |        | X             |
| [LinkedList][]    |        | X       |        | X             |
| [HashSet][]       | X      |         |        |               |
| [TreeSet][]       | X      | X       | X      |               |


## The Collections and Arrays Utility Classes

If you are working with collections and arrays, keep the [Collections][] and [Arrays][] classes in the back of your mind at all time. They contain lots of interesting methods that sort, shuffle, reverse, convert, etc. your collection objects and arrays.

*Collections:*
> This class consists exclusively of static methods that operate on or return collections. It contains polymorphic algorithms that operate on collections, "wrappers", which return a new collection backed by a specified collection, and a few other odds and ends. 
> The methods of this class all throw a NullPointerException if the collections or class objects provided to them are null.

*Arrays:*
> This class contains various methods for manipulating arrays (such as sorting and searching). This class also contains a static factory that allows arrays to be viewed as lists.

You will be able to use these classes to great effect in all of the labs.

---

# Maps

![Java Map Hierarchy](img/map-hierarchy.png)

A Map is an object that maps *keys* to *values*. Duplicate keys are not allowed within a map. Each key can map to at most one value. In essence, a Map can also be described as a Set of (key, value) pairs.

> The Map interface provides three collection views, which allow a map's contents to be viewed as a set of keys (keys are unique!), collection of values, or set of key-value mappings. The order of a map is defined as the order in which the iterators on the map's collection views return their elements. Some map implementations, like the [TreeMap][] class, make specific guarantees as to their order; others, like the [HashMap][] class, do not.
> Some map implementations have restrictions on the keys and values they may contain. For example, some implementations prohibit null keys and values, and some have restrictions on the types of their keys. 

The Map interface defines a number of methods (this is a subset):

```java
          V put(K key, V value)
          V get(K key)
          V remove(Object key)
        Set keySet()            // Set of objects of type K
 Collection values()            // Collection of objects of type V
        Set entrySet()          // Set of Entry(K,V) objects
```

The type templates *K* and *V* can be replaced with almost any object type. The object type selected for K (the key) needs to have equals() and hashCode() implemented. For example, you can map an employee's name (String) to his ```Employee``` object, or his badge-number (Integer) to his Employee object, etc.

An commonly used Map implementation is the [HashMap][]. It is unordened and unsorted. A Map where the keys are ordenend and sorted is the [TreeMap][]. The keySet() method of TreeMap can be used to iterate over the keys in ascending order.

```java
Employee mrPink = new Employee("Mr. Pink");
Map employeeMap = new HasMap();
employeeMap.put(1,mrPink);
assert mrPink.equals(employeeMap.get(1));
Set employeeIDs = employeeMap.keySet();
``` 

Let's start with a basic lab.

> **Lab3.**
> Create a PhoneBook class. Do you remember the phonebook? The phonebook is a paper book that maps names onto phone numbers. Here we will create a digital version. Implement the following methods on your PhoneBook.
>
1. Add an entry to the directory
2. Look up a phone number
3. Delete an entry from the directory
4. Change someone's phone number
5. Print out all names.
6. Print out name and number pairs.

And another fun lab:

> **Lab4.**
> It would be useful to get the Suit and Rank objects based on their String representation. You can implement these changes in the codebase of Lab1.
>
1. Implement a way in Suit that maps a String (e.g. "Hearts") to the respective Suit object (e.g. Suit.HEARTS). 
- Choose a particular Map implementation.
- Create a static ```valueOf(String name)``` method, that initializes the Map with all the necessary String to Suit mappings. Use the map to return the respective Suit object for the supplied String object.
- Refactor the valueOf method. Extract the initialization of the Map to another method. Make use of [lazy initialization][] to only initialize the Map object once. Declare a variable in the class where you will keep this lazily initialized Map object.
2. Do the same thing for Rank.
3. Write some tests for both.

[ArrayList]: https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html
[Arrays]: https://docs.oracle.com/javase/8/docs/api/java/util/Arrays.html
[Collections]: https://docs.oracle.com/javase/8/docs/api/java/util/Collections.html
[Comparable]: https://docs.oracle.com/javase/8/docs/api/java/lang/Comparable.html
[Comparator]: https://docs.oracle.com/javase/8/docs/api/java/util/Comparator.html
[Deque]: https://docs.oracle.com/javase/8/docs/api/java/util/Deque.html
[HashMap]: https://docs.oracle.com/javase/8/docs/api/java/util/HashMap.html
[HashSet]: https://docs.oracle.com/javase/8/docs/api/java/util/HashSet.html
[Hashing]: https://en.wikipedia.org/wiki/Hash_function
[Iterable]: https://docs.oracle.com/javase/8/docs/api/java/lang/Iterable.html#method.summary
[Iterator]: https://docs.oracle.com/javase/8/docs/api/java/util/Iterator.html
[LinkedList]: https://docs.oracle.com/javase/8/docs/api/java/util/LinkedList.html
[PriorityQueue]: https://docs.oracle.com/javase/8/docs/api/java/util/PriorityQueue.html
[Queue]: https://docs.oracle.com/javase/8/docs/api/java/util/Queue.html
[Set]: https://docs.oracle.com/javase/8/docs/api/java/util/Set.html
[SortedSet]: https://docs.oracle.com/javase/8/docs/api/java/util/SortedSet.html
[TreeMap]: https://docs.oracle.com/javase/8/docs/api/java/util/TreeMap.html
[TreeSet]: https://docs.oracle.com/javase/8/docs/api/java/util/TreeSet.html
[lazy initialization]: http://antrix.net/posts/2012/java-lazy-initialization/
