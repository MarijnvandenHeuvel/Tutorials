#Multidimensional Arrays
##In Short
A multidimensional array is an Array with arrays within. You can compare it with a spreadsheet. It has rows (first brackets) and columns (second brackets).

```java
int[][] spreadsheet = new int[4][5];
spreadsheet[0][0]=1;
spreadsheet[0][2]=2;
System.out.println(spreadsheet[0][2]);
int[] row = spreadsheet[1];
```

You can access the value within the array by using the row and column value.
But you can also ask a complete row.

The initialisation of a multidimensional array is almost the same as a normal array. You can create an empty array with a specific size or use the curly brace notation for initialisation with data:

```java
int[][] spreadsheet = {{1,2,3,4},{5,6,7,8},{9,10,11,12},{13,14}};
int[][] otherSpreadsheet = new int[2][4];
```

If your brain doesn't hurt enough with 2 dimensions why stop ?

```java
int[][][][][] spreadsheet = {{{{{1,2,3,4},{5,6,7,8}},{{9,10,11,12}},{{13,14},{12,11}}}}};
int[][][][][] otherSpreadsheet = new int[2][4][5][1][3];
```

You can have an infinite number of dimensions, but to be honest if you can't do it in 2 chances are you are doing something wrong.
## Labs
### Lab 1
Return and print a square multidimensional array with size n.
Within the array you should draw a Z like structure with the @ symbol.
Some examples
	 
    @@
    @@
    
    @@@
     @
    @@@
    
    @@@@
      @
     @
    @@@@
    
    @@@@@
       @
      @
     @
    @@@@@
    
### Lab 2
Create a program that checks if a player has won with tic tac toe.
Possible outcomes you should print:
* Player X has won the game.
* Player O has won the game.
* No one has won the game.

a player can win the game if he has 3 items in one row.

If you want to take it up a notch try to check if it is a valid game. 

### Other
Finish the labs found in the method chapter.