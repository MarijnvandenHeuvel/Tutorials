# Query's

| Name | Description |
| ---- | :---------: |
| SELECT | Start of the select statement |
| FROM | Which table should be selected |
| WHERE | Criteria to limit the amount of data we select |
| ODER BY | Ordering by |

| Name | Description |
| ---- | :---------: |
| = | Equals |
| > | Greater |
| < | Less |
| <> or != | Different |
| AND | and |
| OR | or |
| LIKE | Used for pattern matching in text |
| IS | Test against a boolean |
| NOT | Negate |
| IS NULL | Check if the item is NULL |


## Labs
1. Make sure you have a book table with ISBN, title and id.
2. Make sure you have at least 10 records inside of the table book.
3. Get all data from the table book
4. Get the ISBN and title from the book, but not the id.
5. Get all data from the table book where id = 1
6. Get all data from the table book and order them by ISBN.
7. Add some books with the same title but different ISBN.
8. Get all data from the table book and order them bij title and isbn
9. Search for books with isbn 999999 and title hello
10. Search for books where isbn contains 999
11. Search for books where the title isn't empty
12. Search for books where the id's are between 1 and 7
13. Search for books where the id is 1 5 7 8 9 10 21 22 28 29 36 38 47 52. Pro tip don't use and.
14. Search for a book where the isbn contains 5 or 8

