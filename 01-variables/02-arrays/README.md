#Arrays
##In Short
Arrays are used for storing a list of elements in a certain position. The length of an Array is fixed and is determined on its creation. 
You have different ways of initialising arrays:

```java
int[] intArray = new int[10];
int intArray[] = new int[10];

int[] intArray = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
int[] intArray = new int[]{1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
System.out.println(new int[]{1, 2, 3, 4, 5, 6, 7, 8, 9, 10});
```

The first line is the prefered Java notation for an array where you know the size but not the elements. 
The `int intArray[]` notation is correct but we prefer the first one.
The third line is a prefered Java notation when you know the contents of the array at initilisation.
Altough correct the `int[] intArray = new int[]{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}` notation should be avoided. Only when you don't declare a variable but want to use the array directly you should add the `new int[]` part to describe the array type.

As you can see the array is always initialised with a certain length. 
For obtaining an element from the array you can use the name of the variable and the index.
```java
int[] intArray = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
System.out.println(intArray[1]);
```
<details><summary>What do you think will be printed from the array ?</summary>
The index of an array is 0 based so we will print the number 2.
</details>

You can also store elements within a certain index.
```java
int[] intArray = new int[10];
intArray[0] = 1;
intArray[2] = 2;
```
As you can see you may place any element into any index. This doesn't have to be in order.

<details><summary>What do you think will happen if we wrote the previous blok of code and use the following statement? `System.out.println(intArray[1]);`</summary>
Because we are using a primitive datatype for the array, we will receive the default value 0.
If we used a reference type this would result in the default value `null`.
</details>

Using a number larger than the size of the array will result in an `ArrayIndexOutOfBoundsException`. 

## Labs
### Lab 1
Implement the 2 methods described in the test code

### Lab 2
As you'll see using the toString method on an array doesn't give a readable result.
Can you find a way to have a clean formatting ?
> Hint: don't reinvent the wheel

### Lab 3
Return the 4th element of the array. But don't let the program crash !

### Lab 4
What is the difference between a varargs in Java and an array ?
Make some new methods to show the difference.

### Lab 5
This is a more advanced exercise. No gradle settings are configured.

Create a method that receives an String array.
If the first element doesn't contain any numbers than you return an array of the same size as the String array.
If the first element does contain numbers than return an array where the size equals the number.
You may assume that you only have 1 number.
Example:
* An array with size 10 and text "I have no numbers" returns an array with size 10.
* An array with size 12 and text "I still have no numbers" returns an array with size 12.
* An array with size 1 and text "I have a number 5" returns an array with size 5.
* An array with size 1 and text "1 I have a number 2" is an invalid use case.