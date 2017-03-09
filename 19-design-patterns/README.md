# Builder Pattern
## _Creational_ ‹› _Configurationable_
Just like Factory, Factory Method, ..., the Builder Pattern falls in the Creational category of Design Patterns.

So it's used to create new Object instances of certain types.

The difference with the other patterns is that you can set up, or configure, the object instance you want to create, and then call a method to actually create your configured Object.

We're really postponing creation and calling setup methods without calling the actual `build()` command will lead to nothing.

If you don't know about this pattern, you might not know how to use them when a library provides them.

## Fluent API aka _Chaining_
May be considered a _Design Pattern_ by itself.

An example that comes to mind is the `AssertJ` library, which we've been using to make our assertions read more naturally:

```java
assertThat(bruce.getLastName()).isEqualTo("Wayne");
assertThat(fellowshipOfTheRing).extracting("name")
                               .contains("Boromir", "Gandalf", "Frodo", "Legolas")
```

Another example is Jersey's REST Client `ClientBuilder`:
```java
Response response = ClientBuilder
                        .newClient() //returns Client object
                        .target("http://localhost:8080/batman") //returns WebTarget object
                        .path("villain") //returns WebTarget object
                        .request(MediaType.APPLICATION_JSON) //returns Invocation.Builder
                        .post(Entity.entity(new Villain("Joker"))); //performs an actual HTTP POST and returns a Response
```

## Fixes `Too many constructor parameters` code smell
Take a class `Person` that takes all these arguments to construct:
```java
class Person {
    
    private String lastName;
    private String middleName;
    private String firstName;
    private int age;
    private String city;
    private String street;
    private String housenumber;
    private String zipcode;
    private String phonenumber;
    private String email;
    
    Person(
            String lastName,
            String middleName,
            String firstName,
            int age,
            String city,
            String street,
            String housenumber,
            String zipcode,
            String phonenumber,
            String email
    ){
        this.lastName = lastName;
        this.middleName = middleName;
        this.firstName = firstName;
        this.age = age;
        this.city = city;
        this.street = street;
        this.housenumber = housenumber;
        this.zipcode = zipcode;
        this.phonenumber = phonenumber;
        this.email = email;
    }
}
```

Invoking its constructor looks like this:
```java
Person bruce = new Person("Wayne", "Thomas", "Bruce", 25, "Gotham", "Mountain Drive", "1007", "53540", "735-185-7301", "fullofterrors@gmail.com");
```

Not only is this super long, it'll also become really annoying when some fields become optional:

```java
Person bruce = new Person("Wayne", null, "Bruce", 25, "Gotham", null, "1007", null, null, null);
```

We'll have to use IntelliJ's `Ctrl+P` to check which value is which parameter, and do this for all `null` arguments to figure out that this last created Bruce does not have a middle name, street, zipcode, phone number or email address.

### How to fix this with Builder Pattern
Wouldn't it be great if we could somehow be more explicit when passing parameters?

Something like this perhaps:

```java
Person bruce = new PersonBuilder()
                .withLastName("Wayne")
                .withMiddleName("Thomas")
                .withFirstName("Bruce")
                .withAge(25)
                .withCity("Gotham")
                .withStreet("Mountain Drive")
                .withHousenumber("1007")
                .withZipcode("53540")
                .withPhonenumber("735-185-7301")
                .withEmail("fullofterrors@gmail.com")
                .build();
```

### Combine with Static Factory Method

```java
Person bruce = aPerson()
                .withLastName("Wayne")
                .withMiddleName("Thomas")
                .withFirstName("Bruce")
                .withAge(25)
                .withCity("Gotham")
                .withStreet("Mountain Drive")
                .withHousenumber("1007")
                .withZipcode("53540")
                .withPhonenumber("735-185-7301")
                .withEmail("fullofterrors@gmail.com")
                .build();
```

### We can make it even nicer

```java
Person bruce = aPerson()
                .named("Bruce", "Thomas", "Wayne")
                .age(25)
                .phonenumber("735-185-7301")
                .email("fullofterrors@gmail.com")
                .livingAt(address()
                    .city("Gotham")
                    .street("Mountain Drive")
                    .housenumber("")
                    .zipcode("53540")
                    .build()
                )
                .build();
```

## Exercise
Code a `PersonBuilder` so that it can be used like the last suggestion.

Also make it possible to build a Person without a middleName:
```java
Person bruce = aPerson()
                .named("Bruce", "Wayne")
                .build();
```

Note: Even though it's rather obvious that address should be a class on its own, let's not take _good design_ into account for this exercise. 

### Bonus exercise
Make it impossible for other classes to create a new `Person` instance without using the `PersonBuilder` you just created. 

Since this will include an API change, you'll have to fix existing tests.

## Mockitis
Let's look at [SettlementTest](src/test/java/com/cegeka/builder/mockitis/SettlementTest.java).

Looks like someone has just learned [Mockito](http://site.mockito.org/) and wants to use it to _FIX ALL THE THINGS_.

### What is the **actual** problem?
The tests are tightly coupled to the implementation.

Meaning that whenever the implementation changes, then the tests also need to change.

Even the tiniest bit of API changes in internal classes - classes that `Settlement` uses, but doesn't expose itself - causes changes to `SettlementTest`'s setup.

Moreover, these tests are not a good safety net for future development:

Someone implemented a new feature, where a group of `Raiders` can have a `Legendary` (a _Raider Boss_), which is supposed to count for 1 extra in the `Raider` count in the _defend_ phase.

But he mistakenly wrote 2 instead of 1, and now `Settlement`s are too hard to defend.

The developer exclaimed that he didn't need to change any tests because _They were all green before I checked in!_.

And he wasn't wrong, the tests are indeed all green. But that's the problem of course. They should have failed once he added his new feature.

### Exercise
Write a failing test using Mockito (the way the tests are set up now).
 
## Fixing Mockitis
The issue here, is that we sort of want a _best of both worlds_ situation, where we can **still** set up our code in an easily configurable way, but we also want to work with the real implementations.

### TestBuilder to the rescue!
Creating `TestBuilders` can provide this _best of both worlds_ situation.

`TestBuilders` are exactly the same as regular `Builders`, except you may often find them combined with some extra features.

Do you think the assertion would pass?

What do you think this builder does?
```java
Person bruce = aDefaultPerson().named("Bruce", "Wayne").build();
assertThat(bruce.getAge()).isEqualTo(25);
```

### ObjectMothers
There is also a pattern called _ObjectMother_. It provides a way to return preconfigured objects, that all make sense to use as TestFixtures in most test setups.

e.g.
```java
class PersonMother {
    public static Person aDefaultPerson() {
        return new Person(...);
    }
    
    public static Person aDefaultPersonWithoutAnAddress() {
        Person person = aDefaultPerson();
        person.setStreet(null);
        person.setCity(null);
        person.setZipcode(null);
        person.setHousenumber(null);
        return person;
    }
    
    public static Person aDefaultPersonOver80() {
        Person person  = aDefaultPerson();
        person.setAge(80);
        return person;
    }
}
```

You might be able to see where this leads: for every different combination, you make a different `Factory Method` in the `ObjectMother`.

Furthermore, this leads to objects that usually expose too much information, making them more fragile.

Also, if this PersonMother's `aDefaultPerson` method needs to change, all tests might start to fail (seemingly random), because they might use any of the _default_ creation methods.

This _shotgun surgery_ code smell is not necessarily related to the `ObjectMother` pattern, but the `ObjectMother` pattern **does** subconsciously guide you into this mess.

#### Fixing it with TestBuilders
`Static Factory Method` + `TestBuilder` == :heart: & :rainbow:

_Simply_ combine both patterns:
```java
class PersonBuilder {
    public static PersonBuilder aDefaultPerson() {
        return new PersonBuilder()
                    .withLastName("Wayne")
                    .withMiddleName("Thomas")
                    .withFirstName("Bruce")
                    .withAge(25)
                    .withCity("Gotham")
                    .withStreet("Mountain Drive")
                    .withHousenumber("1007")
                    .withZipcode("53540")
                    .withPhonenumber("735-185-7301")
                    .withEmail("fullofterrors@gmail.com");
    }
}
```

Note that we're not returning a `Person`, but a `PersonBuilder`, allowing our clients (code that uses `aDefaultPerson()`) to keep on configuring/overriding the default Person.

These `FactoryMmethods` on `TestBuilders` are typically used when you're setting up a valid object with only the changes your current test is interested in. 

e.g. if you write a `PensionChecker` class you might only be interested in a `Person`s _age_, but you'd still want a valid `Person` object. 

#### Side note on _default_ vs. _empty_
Some people will swear by _A TestBuilder needs a default!_, while others might swear by _A TestBuilder doesn't need a default, it needs an empty default!_.

Arguments call for _I don't care about default values in my tests, I just want **a** Person_ versus _I want all my Persons to be constructed properly and when I don't I expect my code to test against illegal cases_.

They're both wrong of course, the correct answer is: they both need to be possible and be made explicit.

```java
class PersonTestBuilder {
    public static PersonTestBuilder aDefaultPerson() {
        return aPerson()
                    .withLastName("Wayne")
                    .withMiddleName("Thomas")
                    .withFirstName("Bruce")
                    .withAge(25)
                    .withCity("Gotham")
                    .withStreet("Mountain Drive")
                    .withHousenumber("1007")
                    .withZipcode("53540")
                    .withPhonenumber("735-185-7301")
                    .withEmail("fullofterrors@gmail.com");
    }
    
    public static PersonTestBuilder anEmptyPerson() {
        return aPerson()
                    .withLastName("")
                    .withMiddleName("")
                    .withFirstName("")
                    .withAge(0)
                    .withCity("")
                    .withStreet("")
                    .withHousenumber("")
                    .withZipcode("")
                    .withPhonenumber("")
                    .withEmail("");
    }
    
    public static PersonTestBuilder aPerson() {
        return new PersonTestBuilder();
    }
    
    private PersonTestBuilder(){}
}
```

### Where do these TestBuilders belong?
Just like ObjectMothers, TestBuilders belong in the `test` directory (so don't include them in your production code, aka `src/main/java` in Gradle/Maven/Ivy projects).

## Exercise
Rewrite the `SettlementTest` using everything you've learned about `TestBuilder`s.

Also write a new test for the `Legendary` case:

When a `Raiders` group has a `Legendary` raider, this counts for 2 regular raiders.

Pseudo code:
```
Raiders = [Raider1, Raider2, LegendaryRaider]
Settlement = [Defender1, Defender2, Defender3]
```

In the above case `Settlement.defend(Raiders)` will be `false`.





