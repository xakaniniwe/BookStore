# BookStore

This project sets up a relational SQL database for a bookstore system. It includes tables for managing books, authors, publishers, customers, addresses, and more.

## Database Name
**bookstore**

## Table Structure

### 1. publisher
Stores information about book publishers.
- publisher_id (Primary Key)
- publisher_name

### 2. book_language
Stores supported book languages.
- language_id (Primary Key)
- language_name

### 3. book
Holds details of books available in the store.
- book_id (Primary Key)
- title
- publisher_id (Foreign Key → publisher)
- language_id (Foreign Key → book_language)
- price
- publication_date

### 4. author
List of book authors.
- author_id (Primary Key)
- author_name

### 5. book_author
Maps books to their authors (many-to-many relationship).
- book_id (Foreign Key → book)
- author_id (Foreign Key → author)
- Composite Primary Key: (book_id, author_id)

### 6. customer
Stores customer information.
- customer_id (Primary Key)
- full_name
- email (Unique)
- phone

### 7. country
Stores list of countries.
- country_id (Primary Key)
- country_name

### 8. address
Stores customer addresses.
- address_id (Primary Key)
- address_line1
- address_line2
- province
- city
- post_code
- country_id (Foreign Key → country)

## Sample Data
The script includes sample data for:
- 5 publishers
- 5 languages
- 20 books
- 5 authors
- Relationships between books and authors
- 20 customers
- 18 countries
- Several addresses

## How to Use
1. Run the SQL script in your MySQL/MariaDB database environment.
2. Modify or extend the data as needed.
3. Use SQL queries to perform searches, updates, joins, etc.

## Use Cases
- Track books by language or publisher.
- Search books by author.
- Analyze sales and customer demographics (with future extensions).
- Integrate into a frontend/bookstore management system.

## Future Improvements
- Add tables for orders, reviews, and inventory.
- Track customer purchases.
- Implement stored procedures and views for advanced queries.
- Add constraints and triggers for better data integrity.

---

*Built for academic and learning purposes.*
