# Testing your code

There are many different ways to test the code that we write. Can you name a few? 

In this guide we focus on unit testing. In case you are not familiar, unit testing deals with writing automated tests for the smallest unit of programming that we can realisticly test: the (public) methods in a class.

This guide will try to give an overview of why we write automated tests, how we write these test, and what makes a test qualitative. Let's start with the Why, because that is most important part in getting someone to take automated testing to heart.

## Why test your code?
Let’s get the most straightforward reason out of the way first. 

1. We test code **to reduce the number of bugs that we produce**. It is unrealistic to believe you can get them all though, because sometimes even our tests have bugs. Or it turns out we don’t fully understood the problem yet. Writing code is hard because there is no rule that cannot be broken. Writing code is hard because we are building on half a century of mistakes, sweat, and tears of the excellent people that came before us, who were also just figuring things out as they went.
2.  We write tests, because **we have discovered that it beats writing comments and documentation that is irrelevant within months, or even weeks**. This means that we have to make our tests in such a way that they document our code. But by putting in the extra effort of writing clean, clear, self-explaining tests, we improve our test code as well. Win-win.
3. In Tests We Trust. **By writing tests, we are creating a safety net that will take away our fear of change.** Because fear of change is a programmar’s biggest enemy. If  your solution no longer fits the problem, you should not be afraid to change it.
4. **Automated testing provides quick feedback when we do eventually make a mistake.** The quicker a mistake is fixed, the smaller the cost of fixing it.

## Why first write your tests?

1. Writing a test is considerably less fun than writing code that solves the problem. This forces us to think harder about the tests we write. If we then only implement that code required for the tests we did write, we will end up with less uncessary code. The problem is that every line of code that you wrote that is not useful right now, is a possible burning bag of dog faeces down the road, for the first unfortunate soul that comes across it. Code that has never been used, is guaranteed to have shortcomings. 
2. When you write a test first, you are made to think from the perspective of someone that will use your code, instead of only the perspective of the problem solver.
3. Then, when the test and the implementation are finished, you will have looked at the problem from two perspectives, instead of one.

## What does it mean to be a good test?

Qualitative tests are **automated** because humans forget and make mistakes. They are **fast** because too slow tests slow down the development process or worse, get disabled. Good tests are **repeatable**; they work 10 out of 10 times. The danger of flaky tests is that we quickly get accustomed to failing tests: 1…2…10…50.

Good tests should  be **independent**. No one test should depend on another test having been run before or after it. Tests should be **focussed**. Only test one single aspect of the system under test. Don’t combine several tests into one because you are definitely hiding more failures than you realise. Or some of the combined tests might not run at all.

Good tests need the same kind of **care for quality** as good code. Make them simple and readable.

## How do you test?

### Frameworks and prerequisites
There are a number of test frameworks out there, but we focus on JUnit, in combination with AssertJ’s Assertions extension. Including the necessary packages in Gradle is done like this:

```gradle
dependencies {
    testCompile group: 'junit', name: 'junit', version: '4.12'
    testCompile 'org.assertj:assertj-core:3.6.1'
}
```

### Anatomy of a Test class

```java
import org.junit.Before;
import org.junit.Test;
import java.util.Locale;
import static org.assertj.core.api.Assertions.assertThat;

public class TimeTest {

    @Before
    public void setUp() throws Exception {
        // prepare test environment
        Locale.setDefault(Locale.ENGLISH);
    }

    @After
    public void tearDown() throws Exception {
        // cleanup/restore of external parties
        // eg. delete messages or data, restore state, reset default, ...
    }

    @Test
    public void add_givenValidTime_shouldReturnAdditionOfItsTimeWithGivenTime() throws Exception {
        // local setup
        Time expectedTime = new Time(0,0,0);
        Time aTime = new Time(9,41,3.331);
        Time anotherTime = new Time(14,18,56.669);
        
        // run the method under test
        Time actualTime = aTime.add(anotherTime);

        // assert all the results
        assertThat(actualTime).isEqualTo(expectedTime);
    }
}
```

Methods annotated with ```@Before``` and ```@After``` run before or after every test, respectively. They are used to prepare and clean up the test envoronment. A normal test method is annotated with ```@Test```. ```@Ignore``` can be used to ignore a test, which will not be runned.

JUnit also supports two static methods that run before and after all the test, respectively. This is used for setup/teardown of resource intensive systems:

```java
    @BeforeClass
    public static void beforeClass() throws Exception {
        // pause message consumption, connect to db, ...
    }
    
    @AfterClass
    public static void afterClass() throws Exception {
        // resume message consumption, clean/disconnct database, ...
    }
```

The ExpectedException rule in JUnit allows to declare which exception you expect when the test runs, and what its message should be. If the test runs without throwing that exact exception with that message, the test fails.

```java
public class TimeTest {

    @Rule
    ExpectedException expectedException = ExpectedException.none();

    @Test
    public void add_givenNull_shouldThrowNullPointerException() throws Exception {
        expectedException.expect(NullPointerException.class);
        expectedException.expectMessage("Argument should not be null");

        // hidden
    }
```

## What to test?

1. **A Happy path**. Write a test where you verify the expected behaviour of the method. Be sure to test a number of boundary conditions too.
2. **Failure paths.** Write serveral tests that verify where the method is expected to fail, and if it fails as expected.
3. If a bug is reported. Try to write a test that reproduce the bug on the development computer. If you fix the bug, the issue should dissappear, and your test will turn green.

<!-- ![Test Driven Development Cycle](img/cycle.png) -->

> **Exercises 12.1:** Test the following logic:
> Within a person class we have the method calculateChildAllowance(). This is a method we can use to calculate the allowance a child should receive.
The formula is described as:
When a person is between 0 and 12 they receive an allowance of 100 euro.
When a person is between 13 and 18 they will receive an allowance of 100 euro and an age addition of 5 euro for each year after 12. For example:
* 13 will receive 105
* 18 will receive 130
> When a person is between 19 and 25 and is still a student he will receive 100 euro and an addition of 50 euro.

> **Exercises 12.2:** write a test for exercise 10.6 that verifies the NullPointerException.

> **Exercises 12.3:** The tests for Time in exercise 11.1 and 11.2 focus on the happy path. See if you can't add a few boundary condition test.
 
> **Exercises 12.4:** Write a full set of tests (happy path and boundary tests) for exercise 11.3 Scrabble.

> **Exercises 12.5:** Write full set of tests (happy path and boundary tests) for exercise 11.4 Date.

> **Exercises 12.6:** Write full set of tests (happy path and boundary tests) for exercise 11.5 Rational.