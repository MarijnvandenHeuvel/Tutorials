# REST
**RE**presentational **S**tate **T**ransfer

Uses the [Http protocol](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol).

---

## Http Methods
* GET _(read)_
* POST _(create)_
* PUT _(update)_
* DELETE _(delete)_
* ...

|>

Some methods can include an Http Request Body.

```
POST http://api.bibl.io/library
Body: 
{
    "name": "CegekaSchool",
    "location": "Cegeka Leuven"
}
```

---

## MediaTypes
The Http protocol provides a way to express which format you will accept, using the Accept Header.

|>

```
Header: 
Accept: application/json
```

|>

But it can also be xml for example.

```
Header: 
Accept: application/xml
```

|>

Or even your own proprietary format

```
Header: 
Accept: application/vnd.bibliothouris.v1+json
```

https://developer.github.com/v3/media/

---

## Lingo

URL: `http://api.bibl.io/library/1/book?author=Eric%20Evans&published=false`

|>

`[http://api.bibl.io/library]/1/book?author=Eric%20Evans&published=false`

`http://api.bibl.io/library` : _ResourceLocation_

`http://api.bibl.io/library/1/book/1234` : _ResourceLocation_

|>

`http://api.bibl.io/[library]/1/book?author=Eric%20Evans&published=false`

library : _path_

|>

`http://api.bibl.io/library/1/book?[author]=Eric%20Evans&[published]=false`

author : _query parameter_

published : _query parameter_

|>

`http://api.bibl.io/library/1/book?author=Eric[%20]Evans&published=false`

%20 : _URL Encoded space character_

---

## Plurality in Resources
Which one is better and why?

http://api.bibl.io/book 

vs. 

http://api.bibl.io/books

|>

This is not a standard, so beware! 

Consistency is key, don't mix both styles.

---

## Helpful comparison

`POST http://api.bibl.io/book`

_I want to create a new Book_

vs. 

`POST http://api.bibl.io/books`

_I want to create a new Books collection_

|>

    `GET http://api.bibl.io/book`

    _I want to have ALL THE BOOKS_

    vs. 

    `GET http://api.bibl.io/books`

    _I want to have ALL THE COLLECTIONS OF BOOKS_

|>

    `GET http://api.bibl.io/book/665` 
    
    ?

    `GET http://api.bibl.io/books/665` 
    
    ?

|>

    `GET http://api.bibl.io/book/665`

    _I want to have this specific book which is represented by 665, the neighbour of the beast_

    vs. 

    `GET http://api.bibl.io/books/665`

    _I want to have satans neighbours book collection_

|>

    `GET http://api.bibl.io/book?author=eri`
    
    ?

|>

    `GET http://api.bibl.io/book?author=eri`

    _I want to find all of the books that have an author with `eri`_

|>

    `PUT http://api.bibl.io/book/1234` 
    
    ?

    `PUT http://api.bibl.io/books/1234` 
    
    ?

|>

    `PUT http://api.bibl.io/book/1234`

    _I want to update the existing Book with id 1234_

    vs. 

    `PUT http://api.bibl.io/books/1234`

    _I want to update the existing Books collection with id 1234_

---

## PUT as create
`PUT http://api.bibl.io/book/1234`

_I know the id of the book (1234), and I want to replace it, whether that means creating it, or updating all the properties_

---

## PUT as create - usage
Responsibility of correct usage of our Domain lies with clients/consumers of the API.

When is this useful?

Can you think of some risks?

---

## Responsibility at consumer - risk
* Multiple consumers with possibly different interpretations <!-- .element: class="fragment" data-fragment-index="1" -->
* Everything needs to be optional  <!-- .element: class="fragment" data-fragment-index="2" -->
* Business rules are NOT in our domain <!-- .element: class="fragment" data-fragment-index="3" -->
* Makes it difficult to reason about code and functionality <!-- .element: class="fragment" data-fragment-index="4" -->
* Which in turn makes it difficult to find bug causes 💩<!-- .element: class="fragment" data-fragment-index="5" -->

---

## Idempotency
`PUT`'ing or `DELETE`'ing the same Request Body to the same Resource, should result in the exact same end state.

|>

Example: 

A user clicks a button to indicate he wants to lend the _Domain Driven Design_ book, of which the library has exactly one copy in stock.

Nothing seems to happen and the user clicks again.

The page gets refreshed and the user sees that he's been charged twice.

The librarian sees that the amount of DDD books in stock is now at -1.

|>

Idempotency would mean that a user can click as many times on that button as he wants, he'd still be lending one book, and he'd still be charged once.

Same goes for stock of course.

---

## REST without PUT

|>

	Basically: don't allow PUT on your resources.

	How can we still allow _updates_ to `Book`'s?

|>

	What **are** _updates_?

|>

    Consider an existing Book

    ```json
    {
        "id": 1,
        "name": "Domain Driven Design",
        "author": "Eric Evans",
        "nickname": "Old fartyhead"
    }
    ```

|>

    And consider this 
    
    **PUT**
    
    http://api.bibl.io/book/1
    ```json
    {
        "id": 1,
        "name": "Domain Driven Design",
        "author": "Eric Evans",
        "nickname": "God himself"
    }
    ```
    What did the user actually want to do?

---

## REST without PUT - show intent
POST 

http://api.bibl.io/book/1/changeNickname
```json
{
    "nickname": "God himself"
}
```

---

## Great examples of REST API's
[GitHub](https://developer.github.com/v3/)

[StormPath](https://docs.stormpath.com/rest/product-guide/latest/accnt_mgmt.html#add-a-new-account-to-a-directory)

GET only:

[Marvel](https://developer.marvel.com/documentation/generalinfo)

[PokeApi](https://pokeapi.co)

---

## Stuff not covered
* Hypermedia (and HATEOAS)
* Linking
* AtomPub
* Caching
* Throttling
* ...

---

## Reference material
* [Http protocol](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol)
* [REST API design](http://www.restapitutorial.com/)
* [REST without PUT](https://www.thoughtworks.com/insights/blog/rest-api-design-resource-modeling)