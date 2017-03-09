# Databases
## Introduction
A database is a collection of information that is organized so that it can easily be accessed, managed, and updated. The most commonly used type of databases are the relational databases but others do exist.

## What is a relational database ?
We can describe a relational database as a database that is based on the relation model of data. This means that the data is organised in one or more tables with columns and rows with a unique key identifying each row. Connecting different tables with the unique key.

| Name | Description |
| :--: | :---------: |
| Row  | A data set representing a singe item |
| Column | A labled element of a row, e.g. "Title", "First name" |
| Table | Collection of items |
| Schema | A collection of tables |

## Commands in MYSQL
For all the possible commands view <a href="https://dev.mysql.com/doc/refman/5.7/en/sql-syntax.html"> this link</a>

### Structure of the commands
All commands are structured the same way:
**NAME COMMAND**
** {CHOICE 1 | CHOICE 2 | ...} **
** [EXTRA]**

### Type of commands
Within the table management you have different kind of commands:

| Name | Usage |
| ---- | ----- |
| CREATE | Creating a new Database, table, view, index,... |
| ALTER | Altering a Database, table, view, index,... |
| DROP | Deleting a Database, table, view, index,... |
| TRUNCATE | Deleting all content of a table |
| INSERT | Adding data to a table |
| UPDATE | Updating data in a table |
| DELETE | Deleting data in a table |
| COMMIT | Closing the transaction |
| ROLLBACK | Reverting the transaction |

## Labs
1. Create a database|schema for the bibliothouris project. Within MySQL you may use the term database as a synonim for schema.
2. Create a table book with, for strings you usually use varchar for performance reasons:
	1. A string ISBN
	2. A string title
	3. A number amount
	4. Published year
	5. A decimal number review score
	6. A string genre
	7. A string initial price
3. Alter the table book:
	1. Remove the review score
	2. Remove the amount
	3. Change initial price to a number
	4. Add a string Author first name
	5. Add a string Author last name
4. Create a copy of the Book table
<details><summary>**Hint:**</summary>
The keyword LIKE could help you a lot.
</details>
5. Delete the copy of the Book table
6. Insert some data in the table book, don't forget a commit.
7. Update all of the data rows in the table book
8. Delete rows but don't commit. (check if autocommit is on or not)
9. Rollback 
10. Alter the table book, make sure you have a primary key id that will increase every time you insert data.
11. Alter the table book, make sure that the isbn isn't null and is unique
12. Alter the table book, make sure that the default price of a book is 5.
13. Extract the Author first and last name from the table book. Use a foreign key. Don't forget a technical id.
14. Insert data in both tables, try to delete an author record. What do you see?
15. Delete all tables and create your database from your bibliothouris domain.