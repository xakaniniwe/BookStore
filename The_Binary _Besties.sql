-- Create a new database called bookstore
CREATE DATABASE bookstore;

-- Use the database we created above
USE bookstore;

-- Create the 'publisher' table:
CREATE TABLE publisher (
	publisher_id INT AUTO_INCREMENT PRIMARY KEY,	-- Unique ID for each publisher
    publisher_name VARCHAR(255) NOT NULL			-- Publisher's name (It cannot be blank)
);

-- Create the 'book_language' table:
CREATE TABLE book_language (
    language_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for each language
    language_name VARCHAR(100) NOT NULL         -- Name of the language (It cannot be blank)
);

-- Create the 'book' table (A list of all books available in the store):
CREATE TABLE book (
    book_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for each book
    title VARCHAR(255) NOT NULL,            -- Title of the book (It cannot be blank)
    publisher_id INT,                       -- Reference to publisher
    language_id INT,                        -- Reference to the book language
    price DECIMAL(10, 2) NOT NULL,          -- Price of the book (It cannot be blank)
    publication_date DATE,                  -- Publication date
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id), -- Foreign key to publisher
    FOREIGN KEY (language_id) REFERENCES book_language(language_id) -- Foreign key to language
); 

-- Create the 'author' table (A list of all authors):
CREATE TABLE author (
    author_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for each author
    author_name VARCHAR(255) NOT NULL         -- Author's name (It cannot be blank)
);

-- Create the 'book_author' table to manage the many-to-many relationship:
CREATE TABLE book_author (
    book_id INT,                             -- Book ID (foreign key)
    author_id INT,                           -- Author ID (foreign key)
    PRIMARY KEY (book_id, author_id),        -- Composite primary key
    FOREIGN KEY (book_id) REFERENCES book(book_id), -- Foreign key to book
    FOREIGN KEY (author_id) REFERENCES author(author_id) -- Foreign key to author
);

-- Create the 'customer' table:
CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,  -- Unique ID for each customer
    full_name VARCHAR(255) NOT NULL,             -- Customer's full names (It cannot be blank)
    email VARCHAR(255) NOT NULL UNIQUE,          -- Customer's email (unique, it cannot be blank)
    phone VARCHAR(20)                            -- Customer's phone number
);

-- Create the 'country' table:
CREATE TABLE country (
    country_id INT AUTO_INCREMENT PRIMARY KEY,  -- Unique ID for each country
    country_name VARCHAR(100) NOT NULL          -- Name of the country
);

-- Insert Sample data into 'country' table:
INSERT INTO country (country_name)
VALUES
	("South Africa"), ("Lesotho"), ("Zambia"), ("Namibia"), ("Mozambique"), ("Botswana"), ("Zimbabwe"), ("Kenya"), ("Nigeria"),
    ("Tanzania"), ("Ethiopia"), ("Morocco"), ("Côte d'Ivoire"), ("Guinea"), ("Ghana"), ("Togo"), ("Senegal"), ("Burkina Faso");
    
-- Create the 'address' table (To store all unique addresses in the system):
CREATE TABLE address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,   -- Unique ID for each address
    address_line1 VARCHAR(255) NOT NULL,         -- Address line 1
    address_line2 VARCHAR(255),                  -- Address line 2 (optional)
    province VARCHAR(100),                       -- Province
    city VARCHAR(100),                           -- City
    post_code VARCHAR(20),                       -- Postal code
    country_id INT,                              -- Reference to country
    FOREIGN KEY (country_id) REFERENCES country(country_id)  -- Foreign key to country
);

-- Create the 'customer_address' table:
CREATE TABLE customer_address (
    address_id INT AUTO_INCREMENT,    -- Unique ID for each address
    customer_id INT,                              -- Reference to the customer
    address_status ENUM("Current", "Old") NOT NULL,  -- Indicates if the address is current or old
    PRIMARY KEY (customer_id, address_id), -- Composite primary key
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id), -- Foreign key to customer
    FOREIGN KEY (address_id) REFERENCES address(address_id)     -- Foreign key to address
);

-- Create the 'cust_order' table:
CREATE TABLE cust_order (
    order_id INT AUTO_INCREMENT PRIMARY KEY,    -- Unique order ID
    customer_id INT,                            -- Reference to the customer
    order_date DATE NOT NULL,                   -- Order date
    shipping_method VARCHAR(100) NOT NULL,       -- Shipping method (e.g., standard, express)
	order_status VARCHAR(100) NOT NULL,          -- Order status (e.g., pending, shipped)
    total_amount DECIMAL(10, 2) NOT NULL,		-- order total amount
    payment_status VARCHAR(50) NOT NULL DEFAULT 'pending', -- Payment status (pending, paid, etc.)
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id) -- Foreign key to customer
);

-- Create the 'order_line' table:
CREATE TABLE order_line (
    order_line_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for each order line
    order_id INT,                                -- Reference to the order
    book_id INT,                                 -- Reference to the book
    quantity INT NOT NULL,                       -- Quantity of the book
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id), -- Foreign key to order
    FOREIGN KEY (book_id) REFERENCES book(book_id)          -- Foreign key to book
);

-- Create the 'order_history' table:
CREATE TABLE order_history (
    order_history_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for each order history record
    order_id INT,                                   -- Reference to the order
    status_date DATE NOT NULL,                       -- Date of the status update
    status_description VARCHAR(255) NOT NULL,        -- Description of the status (e.g., Order placed, Payment confirmed, Shipped via CourierX, Delivered to customer on xxx)
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id) -- Foreign key to order
);

-- create a 'payment' table to track payment details
CREATE TABLE payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,                                 -- Reference to the order
    payment_date DATE NOT NULL,                   -- Date of the payment
    payment_method VARCHAR(50) NOT NULL,          -- Method of payment (e.g., Credit Card, PayPal, etc.)
    payment_amount DECIMAL(10, 2) NOT NULL,       -- Payment amount
    payment_status VARCHAR(50) NOT NULL DEFAULT 'completed', -- Payment status
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id)
);








