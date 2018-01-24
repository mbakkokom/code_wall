# Class in C++

## 0. Fundamentals

1. Class is definition of an `object`; you can declare a variable using this definition.
2. An object has `members` (variables) and `methods` (functions).
3. Members and methods can be visible, meaning they can be edited or called from outside: `public`
4. Members and methods can be invisible, meaning they are only accesible from inside the object: `private`

## 1. Declaring a class

We are going to create a `Book` class. To do that, we just need to write the following code.

```cpp
class Book {
	// declare something here...
};
```

## 2. Members

A `Book` has some properties (or henceforth known as **members**) with specific types. Let's list them all first:

| No.| Name   | Type    |
|----|--------|---------|
| 1. | Id     | integer |
| 2. | Title  | string  |
| 3. | Author | string  |
| 4. | Genre  | string  |

Now declare the members into the `Book` class.

```cpp
class Book {
	int mId;
	string mTitle;
	string mAuthor;
	string mGenre;
};
```

Note that we add an `m` prefix (abbr. member) to our members. This is useful for differentiating between our members and methods. For example, later we can write a method to fetch `Id` using the name `id()` and so on.

## 3. Methods

For now, our members are not accessible from outside the class. Without explicitly stating that they are `public` entities, it is implied that they are `private` entities. You can set them as such to allow access:

```cpp
class Book {
public: // setting this to `public`.
	int mId;
	string mTitle;
	string mAuthor;
	string mGenre;
};
```

But such practice should be avoided at all. Instead, we declare `public methods` that allow us to fetch (we call this **getter**) and set the members (**setter**).

First we list the needed methods based on our members:

| No.| Name   | Members          | Getter            | Setter                          |
|----|--------|------------------|-------------------|---------------------------------|
| 1. | Id     | `int mId`        | `int id()`        | `void setId(int id)`            |
| 2. | Title  | `string mTitle`  | `string title()`  | `void setTitle(string title)`   |
| 3. | Author | `string mAuthor` | `string author()` | `void setAuthor(string author)` |
| 4. | Genre  | `string mGenre`  | `string genre()`  | `void setGenre(string genre)`   |

Notice that we have a nice _pattern_ for fetching and setting members by calling its corresponding methods. Now, write the code.

```cpp
class Book {
// `private` member goes here.
	int mId;
	string mTitle;
	string mAuthor;
	string mGenre;

public:
// `public` member goes here.
	
	// Our getters
	int id() {
		return mId;
	}
	string title() {
		return mTitle;
	}
	string author() {
		return mAuthor;
	}
	string genre() {
		return mGenre;
	}
	
	// Our setters
	void setId(int id) {
		mId = id;
	}
	void setTitle(string title) {
		mTitle = title;
	}
	void setAuthor(string author) {
		mAuthor = author;
	}
	void setGenre(string genre) {
		mGenre = genre;
	}
};
```

Note that you can directly access the private members from your methods.

Now, you can create a `Book` object and set the values and then fetch back the values like this:

```cpp
// create object.
Book anne_green_gables;

// set values.
anne_green_gables.setId(1001781);
anne_green_gables.setTitle("Anne of Green Gables");
anne_green_gables.setAuthor("L. M. Montgomery");
anne_green_gables.setGenre("Fiction");

// fetch values.
int id = anne_green_gables.id();
string title = anne_green_gables.title();
string author = anne_green_gables.author();
string genre = anne_green_gables.genre();
```

## 4. Constructor

Now, we can create an _constructor_ method that can help set the values of the methods when we create a `Book`.

An constructor method: (1) must be **public**; (2) has the **same name** as the class name; and (3) it **does not return** any value.

```cpp
class Book {
...
public:
	...
	// Initialisers
	Book() { }
	...
}
```

Because of C++ overloading capability, we can create multiple constructor methods to suit our need.

```cpp
class Book {
...
public:
	...
	// Initialisers
	Book() { }
	Book(int id, string title, string author, string genre) {
		setId(id);
		setTitle(title);
		setAuthor(author);
		setGenre(genre);
	}
	...
}
```

We can take advantage of this constructor method to set values with less lines of codes as such:

```cpp
// create object.
Book anne_green_gables(
	1001781,                   // id
	"Anne of Green Gables",    // title
	"L. M. Montgomery",        // author
	"Fiction"                  // genre
);

// fetch values.
int id = anne_green_gables.id();
string title = anne_green_gables.title();
string author = anne_green_gables.author();
string genre = anne_green_gables.genre();
```

## 5. More method(s)!

We can create more method(s) according to our need. For example, let's create a `print()` method to print out the `Book` details.

```cpp
class Book:
...
public:
	...
	// Additional method(s)
	void print() {
		cout << "BOOK ENTRY:" << endl;
		cout << title() << endl;
		cout << "by " << author() << endl;
		cout << "[" << genre() << "] " << id() << endl << endl;
	}
...
```
Thus, we can then use it as such:

```cpp
// create object.
Book anne_green_gables(
	1001781,                   // id
	"Anne of Green Gables",    // title
	"L. M. Montgomery",        // author
	"Fiction"                  // genre
);

// print!
anne_green_gables.print();
```

## 6. Putting everything together

Full `Book` class definition:

```cpp
class Book {
// `private` member goes here.
	int mId;
	string mTitle;
	string mAuthor;
	string mGenre;

public:
// `public` member goes here.
	
	// Initialisers
	Book() { }
	Book(int id, string title, string author, string genre) {
		setId(id);
		setTitle(title);
		setAuthor(author);
		setGenre(genre);
	}
	
	// Our getters
	int id() {
		return mId;
	}
	string title() {
		return mTitle;
	}
	string author() {
		return mAuthor;
	}
	string genre() {
		return mGenre;
	}
	
	// Our setters
	void setId(int id) {
		mId = id;
	}
	void setTitle(string title) {
		mTitle = title;
	}
	void setAuthor(string author) {
		mAuthor = author;
	}
	void setGenre(string genre) {
		mGenre = genre;
	}
	
	// Additional method(s)
	void print() {
		cout << "BOOK ENTRY:" << endl;
		cout << title() << endl;
		cout << "by " << author() << endl;
		cout << "[" << genre() << "] " << id() << endl << endl;
	}
};
```

## Using the code

Here's an example of a C++ code that uses our class.

```cpp
#include <iostream>
#include <string>

using namespace std;

class Book {
// `private` member goes here.
	int mId;
	string mTitle;
	string mAuthor;
	string mGenre;

public:
// `public` member goes here.

	// Initialisers
	Book() { }
	Book(int id, string title, string author, string genre) {
		setId(id);
		setTitle(title);
		setAuthor(author);
		setGenre(genre);
	}
	
	// Our getters
	int id() {
		return mId;
	}
	string title() {
		return mTitle;
	}
	string author() {
		return mAuthor;
	}
	string genre() {
		return mGenre;
	}
	
	// Our setters
	void setId(int id) {
		mId = id;
	}
	void setTitle(string title) {
		mTitle = title;
	}
	void setAuthor(string author) {
		mAuthor = author;
	}
	void setGenre(string genre) {
		mGenre = genre;
	}
	
	// Additional method(s)
	void print() {
		cout << "BOOK ENTRY:" << endl;
		cout << title() << endl;
		cout << "by " << author() << endl;
		cout << "[" << genre() << "] " << id() << endl << endl;
	}
};

int main() {
	// create books.
	Book harry_potter;
	Book anne_green_gables(
		1001781,                   // id
		"Anne of Green Gables",    // title
		"L. M. Montgomery",        // author
		"Fiction"                  // genre
	);
	
	// set values.
	harry_potter.setId(1001224);
	harry_potter.setTitle("Harry Potter and The Sorcerer's Stone");
	harry_potter.setAuthor("J. K. Rowling");
	harry_potter.setGenre("Fiction");
	
	// print!
	harry_potter.print();
	anne_green_gables.print();
	
	return 0;
}
```

which should give the following output:

```
BOOK ENTRY:
Harry Potter and The Sorcerer's Stone
by J. K. Rowling
[Fiction] 1001224

BOOK ENTRY:
Anne of Green Gables
by L. M. Montgomery
[Fiction] 1001781


```