# Users and Books

1. Authentication
2. List all users
3. Create a user
4. Get a single user
5. Edit a user
6. Delete a user
7. List all Books
8. Create a book
9. Get a single book
10. Edit a book
11. Delete a book
12. Search for a book
13. List all ApiKeys
14. Get an api Key

# Authentication

You can access the API with an API Key and an authentication token. Only users with an admin role can access
all routes. Users with a non admin role can only view resources that belong to them.

You will need to authenticate as a user in order to perform access any routes. The only route that doesn't require authentication
is creating a user. Authenticating is the only route that requires an API Key and not a token.

# List all Users

List all the users currently stored in the database

`GET /api/v1/users`

Response

```
Status: 200 OK

[{
  "id": 2,
  "email": "test@gmail.com",
  "role": "user",
  "sign_in_count": 0,
  "created_at": "2017-06-12T02:49:57.899Z",
  "api_key": "test"
}]
```

# Create a single user

`POST /api/v1/users`

Input
---

__Name__&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;__Type__&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;__Description__

email&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;string&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;the email for the user
password&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;string&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;the password
role&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;string&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;the role for the user



```
{
  "email": "test@gmail.com",
  "password": "password",
  "role": "user"
}

```

```
Status: 201 Created

{
  "id": 1,
  "email": "test@gmail.com",
  "role": "user",
  "sign_in_count": 0,
  "created_at": "2017-06-12T02:49:57.899Z",
  "api_key": "test"
}
```

# Get a single User

`GET /api/v1/users/:id`

Response

```
Status: 200 OK

{
  "id": 1,
  "email": "test@gmail.com",
  "role": "user",
  "sign_in_count": 0,
  "created_at": "2017-06-12T02:49:57.899Z",
  "api_key": "test"
}
```

# Edit a user

`PATCH /api/v1/users/:id`

Input
---

__Name__&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;__Type__&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;__Description__

email&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;string&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;the email for the user
password&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;string&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;the password
role&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;string&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;the role for the user


```
{
  "email": "test@gmail.com",
  "password": "password",
  "role": "user"
}

```

```
Status: 200 OK

{
  "id": 1,
  "email": "test@gmail.com",
  "role": "user",
  "sign_in_count": 0,
  "created_at": "2017-06-12T02:49:57.899Z",
  "api_key": "test"
}
```

# Delete a user

`DELETE /api/v1/users/:id`

```
Status: 204 No Content

```

# List all Books

List all the books currently stored in the database

`GET /api/v1/books`

Response

```
Status: 200 OK

[{
  "id": 1,
  "name": "Harry Potter and the Chamber of Secrets",
  "author": "JK Rowling",
  "genre": "Young Adult",
  "user_id": 1,
  "created_at": "2017-06-12T03:31:46.939Z"
}]
```

# Create a single book

`POST /api/v1/books`

Input
---

__Name__&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;__Type__&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;__Description__

name&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;string&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;the name of the book
author&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;string&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;the author who wrote the book
genre&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;string&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;the genre of the book



```
{
	"name": "Harry Potter and the Chamber of Secrets",
	"author": "JK Rowling",
	"genre": "Young Adult"
}

```

```
Status: 201 Created
{
  "id": 1,
  "name": "Harry Potter and the Chamber of Secrets",
  "author": "JK Rowling",
  "genre": "Young Adult",
  "user_id": 1,
  "created_at": "2017-06-12T03:31:46.939Z"
}
```

# Get a single book

`GET /api/v1/books/:id`

Response

```
Status: 200 OK

{
  "id": 1,
  "name": "Harry Potter and the Chamber of Secrets",
  "author": "JK Rowling",
  "genre": "Young Adult",
  "user_id": 1,
  "created_at": "2017-06-12T03:31:46.939Z"
}
```

# Edit a book

`PATCH /api/v1/books/:id`

Input
---

__Name__&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;__Type__&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;__Description__

name&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;string&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;the name of the book
author&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;string&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;the author who wrote the book
genre&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;string&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;the genre of the book


```
{
	"name": "Harry Potter and the Chamber of Secrets",
	"author": "JK Rowling",
	"genre": "Young Adult"
}

```

```
Status: 200 OK

{
  "id": 1,
  "name": "Harry Potter and the Chamber of Secrets",
  "author": "JK Rowling",
  "genre": "Young Adult",
  "user_id": 1,
  "created_at": "2017-06-12T03:31:46.939Z"
}
```

# Delete a book

`DELETE /api/v1/books/:id`

```
Status: 204 No Content

```

# Search for a book

https://github.com/zeantsoi/GoogleBooks

GoogleBooks is a lightweight Ruby wrapper that queries the Google API to search for publications in the Google Books repository.
Using GoogleBooks is simple. There's just one class, GoogleBooks, and one method, search. Queries return an enumerable collection 
of results, each with their own set of attributes that can be individually configured.


`POST /api/v1/books/search`

Input
---

__Name__&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;__Type__&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;__Description__

search&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;string&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;the name of the book


```
{
	"search": "The Hobbit"
}

```

```
Status: 200 OK

[
  {
    "title": "The Hobbit: The Hobbit",
    "author": "J. R. R. Tolkien",
    "description": "In this reprint several minor inaccuracies, most of them noted by readers, have been corrected. For example, the text now corresponds exactly with the runes on Throrís Map. More important is the matter of Chapter Five. There the true story of the ending of the Riddle Game, as it was eventually revealed (under pressure) by Bilbo to Gandalf, is now given according to the Red Book, in place of the version Bilbo first gave to his friends, and actually set down in his diary. This departure from truth on the part of a most honest hobbit was a portent of great significance. It does not, however, concern the present story, and those who in this edition make their first acquaintance with hobbit-lore need not troupe about it. Its explanation lies in the history of the Ring, as it was set out in the chronicles of the Red Book of Westmarch, and is now told in The Lord of the Rings."
  }
]

```

# List all ApiKeys

List all the api_keys currently stored in the database

`GET /api/v1/api_keys`

Response

```
Status: 200 OK

[{
  "id": 1,
  "key": "test",
  "user_id": 1,
  "created_at": "2017-06-12T02:49:57.899Z"
}]
```


# Get a single api key

`GET /api/v1/api_keys/:id`

Response

```
Status: 200 OK

{
  "id": 1,
  "key": "test",
  "user_id": 1,
  "created_at": "2017-06-12T02:49:57.899Z"
}
```