# Java Generics

I'd like to refer to Head First Java 2nd Ed. More specifically, chapter 16 Data Structures, section "Generics means more type-safety" (p540 to p545). Be sure to read this.

Here we will stick to a small introduction.

## Using generics
Generics in Java, literally, make your code generic, while saving you from shooting yourself in the foot.

As an example, take this List:

```java
List cards = new ArrayList();
```

To make ArrayList, (or any List or Collection object for that matter) useful at all, it needs to be able to take any type of object and store it. Whether it be String, Point, Card, or Bicycle objects, at some point, we might want to add it to a collection.

To make that possible, a Collection is defined as a container that stores objects of the *Object* type, the super-type of any object. The big downside is that we can store objects of any type all in the same collection.

```java
List stuff = new ArrayList();

Card card = new Card(ACE,SPADES);
Point point = new Point(3,2);

stuff.add(card);
stuff.add(point);
stuff.add("what could go wrong?");

for(Object o : stuff) {
    // nothing more to do than ... print! Because any object has a toString().
    System.out.println(o);
}
```

Madness. Don't try this at home.

To fix this gaping hole of problems, Java added support for Generics. Using generics, we can write the following to limit our ArrayList object to a single type of object: Card (or its subclasses, if it had any):

```java
List<Card> cards = new ArrayList<Card>();
// ...
cards.add(card); // allowed
cards.add(point); // compilation error
cards.add("what could go wrong?"); // compilation error
```

Foot saved.

You don't even need to repeat the type parameter when creating the ArrayList instance, because it can be inferred. This is fine too:

```java
List<Card> cards = new ArrayList<>();
```

Remember the methods that the List collection type added? All of the methods, and the class, were parameterized in *E*.

```java
   public void add(int index, E e);
   public void set(int index, E e);
   public E get(int index);
   public E remove(int index);
```

If we instantiate an ArrayList<E> and fill in the parameter with *Card*, ArrayList<Card>, the methods turn into this:

```java
   public void add(int index, Card e);
   public void set(int index, Card e);
   public Card get(int index);
   public Card remove(int index);
```

You can only add, set, and retrieve Card objects from a ArrayList<Card>.

> **Lab 0.** Revisit the Collection and Map exercises from the previous session, and make use of generics, or clean up your usage if you already applied generics.

## Creating a generic class
Generics also play an important part when creating your own classes that need to be generic. We'll implement a Pair object here together to show you the basics. A *Pair* stores an object *left* and *right* of the same type *T*, and allows to retrieve both values later.

The imporant part is indicating in the class declaration that the Pair class will be parameterized in some type *T*. Or *E*, or *Element*, you can give it any name you want, but it is customary to stick to a capital Letter.

From then on, you will have to use *T* wherever you want to refer to the type that will be stored in the Pair.

```java
public class Pair<T> {

    private T left;
}
```

> **Lab 1.** I won't spoil the rest of the class. It's up to you to complete it. Add a constructor to create a Pair with two arguments *left* and *right*. Add getters for these elements too, to retrieve them. Maybe you want a way to tell if Pairs are equal.
