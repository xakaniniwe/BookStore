-- Create a new database called bookstore
CREATE DATABASE bookstore;

-- Use the database we created above
USE bookstore;

-- Create the 'publisher' table:
CREATE TABLE publisher (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,     -- Unique ID for each publisher
    publisher_name VARCHAR(255) NOT NULL             -- Publisher's name (It cannot be blank)
);

-- Create the 'book_language' table:
CREATE TABLE book_language (
    language_id INT AUTO_INCREMENT PRIMARY KEY,    -- Unique ID for each language
    language_name VARCHAR(100) NOT NULL            -- Name of the language (It cannot be blank)
);

-- Create the 'book' table (A list of all books available in the store):
CREATE TABLE book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,        -- Unique ID for each book
    title VARCHAR(255) NOT NULL,                    -- Title of the book (It cannot be blank)
    publisher_id INT,                               -- Reference to publisher
    language_id INT,                                -- Reference to the book language
    price DECIMAL(10, 2) NOT NULL,                  -- Price of the book (It cannot be blank)
    publication_date DATE,                          -- Publication date
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id), -- Foreign key to publisher
    FOREIGN KEY (language_id) REFERENCES book_language(language_id) -- Foreign key to language
);

-- Create the 'author' table (A list of all authors):
CREATE TABLE author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(255) NOT NULL
);

-- Insert Sample data into 'author' table:
INSERT INTO author (author_name)
VALUES
    ('Chinua Achebe'),
    ('Chimamanda Ngozi Adichie'),
    ('Ngugi wa Thiong\'o'),
    ('Wole Soyinka'),
    ('Nadine Gordimer');

-- Create the 'book_author' table to manage the many-to-many relationship:
CREATE TABLE book_author (
    book_id INT,                                    -- Book ID (foreign key)
    author_id INT,                                  -- Author ID (foreign key)
    PRIMARY KEY (book_id, author_id),               -- Composite primary key
    FOREIGN KEY (book_id) REFERENCES book(book_id), -- Foreign key to book
    FOREIGN KEY (author_id) REFERENCES author(author_id) -- Foreign key to author
);

-- Create the 'customer' table:
CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(20)
);

-- Insert Sample data into 'customer' table:
INSERT INTO customer (customer_id, full_name, email, phone)
VALUES
(1, 'Thando Mbeki', 'thando.mbeki@email.com', '825551234'),
(2, 'Lerato Nkosi', 'lerato.nkosi@email.com', '731112222'),
(3, 'Sipho Khumalo', 'sipho.khumalo@email.com', '602223333'),
(4, 'Aisha Abubakar', 'aisha.abubakar@email.com', '834445555'),
(5, 'Kwame Acheampong', 'kwame.acheampong@email.com', '795556666'),
(6, 'Fatima Hassan', 'fatima.hassan@email.com', '616667777'),
(7, 'David Adebayo', 'david.adebayo@email.com', '847778888'),
(8, 'Nadia Benani', 'nadia.benani@email.com', '728889999'),
(9, 'Yusuf Camara', 'yusuf.camara@email.com', '639990000'),
(10, 'Zola Dlamini', 'zola.dlamini@email.com', '810001111'),
(11, 'Chipo Banda', 'chipo.banda@email.com', '741112222'),
(12, 'Elias Farah', 'elias.farah@email.com', '782223333'),
(13, 'Gugu Hadebe', 'gugu.hadebe@email.com', '643334444'),
(14, 'Ismail Kone', 'ismail.kone@email.com', '854445555'),
(15, 'Jabulani Langa', 'jabulani.langa@email.com', '715556666'),
(16, 'Kemi Musa', 'kemi.musa@email.com', '626667777'),
(17, 'Lebo Ngwenya', 'lebo.ngwenya@email.com', '867778888'),
(18, 'Mamadou Sissoko', 'mamadou.sissoko@email.com', '758889999'),
(19, 'Naledi Tladi', 'naledi.tladi@email.com', '679990000'),
(20, 'Obi Uchendu', 'obi.uchendu@email.com', '870001111');

-- Create the 'country' table:
CREATE TABLE country (
    country_id INT AUTO_INCREMENT PRIMARY KEY,    -- Unique ID for each country
    country_name VARCHAR(100) NOT NULL            -- Name of the country
);

-- Insert Sample data into 'country' table:
INSERT INTO country (country_name)
VALUES
    ("South Africa"), ("Lesotho"), ("Zambia"), ("Namibia"), ("Mozambique"), ("Botswana"), ("Zimbabwe"), ("Kenya"), ("Nigeria"),
    ("Tanzania"), ("Ethiopia"), ("Morocco"), ("Côte d'Ivoire"), ("Guinea"), ("Ghana"), ("Togo"), ("Senegal"), ("Burkina Faso");

-- Create the 'address_status' table:
CREATE TABLE address_status (
    address_status_id INT PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL
);

-- Insert the data into 'address_status' table:
INSERT INTO address_status (address_status_id, status_name)
VALUES
(1, 'current'),
(2, 'old');

-- Create the 'customer_address' table:
CREATE TABLE customer_address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,     -- Unique ID for each address
    customer_id INT,                                -- Reference to the customer
    address_line1 VARCHAR(255) NOT NULL,             -- Address line 1 (It cannot be blank)
    address_line2 VARCHAR(255),                      -- Address line 2 (optional)
    province VARCHAR(100),                           -- Province
    city VARCHAR(100),                               -- City
    post_code VARCHAR(20),                           -- Postal code
    country_id INT,                                  -- Reference to country
    address_status_id INT,                           -- Reference to address status
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id), -- Foreign key to customer
    FOREIGN KEY (country_id) REFERENCES country(country_id),     -- Foreign key to country
    FOREIGN KEY (address_status_id) REFERENCES address_status(address_status_id) -- Foreign key to address status
);

-- Create the 'address' table (To store all addresses in the system):
CREATE TABLE address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,     -- Unique ID for each address
    customer_id INT,                                -- Reference to customer
    address_line1 VARCHAR(255) NOT NULL,             -- Address line 1
    address_line2 VARCHAR(255),                      -- Address line 2 (optional)
    province VARCHAR(100),                           -- Province
    city VARCHAR(100),                               -- City
    post_code VARCHAR(20),                           -- Postal code
    country_id INT,                                  -- Reference to country
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id), -- Foreign key to customer
    FOREIGN KEY (country_id) REFERENCES country(country_id)     -- Foreign key to country
);

-- Create the 'shipping_method' table
-- Make sure you're using the correct database
USE bookstore;

-- Step 1: Create the shipping_method table
CREATE TABLE shipping_method (
    shipping_method_id INT PRIMARY KEY,
    method_name VARCHAR(50) NOT NULL
);

-- Step 2: Insert sample data
INSERT INTO shipping_method (shipping_method_id, method_name) VALUES
(1, 'Standard Shipping'),
(2, 'Express Shipping');


-- Create the 'order_status' table:
-- Select the correct database
USE bookstore;

-- Create the order_status table
-- Use the correct database
USE bookstore;

-- Step 1: Create the order_status table
CREATE TABLE order_status (
    order_status_id INT PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL
);

-- Step 2: Insert values into the table
INSERT INTO order_status (order_status_id, status_name) VALUES
(1, 'pending'),
(2, 'shipped'),
(3, 'delivered'),
(4, 'cancelled'),
(5, 'returned'),
(6, 'processing'),
(7, 'out for delivery'),
(8, 'payment pending'),
(9, 'refund requested'),
(10, 'refunded');


-- Insert data into order_status
INSERT INTO order_status (order_status_id, status_name) VALUES
(1, 'pending'),
(2, 'shipped'),
(3, 'delivered'),
(4, 'cancelled'),
(5, 'returned'),
(6, 'processing'),
(7, 'out for delivery'),
(8, 'payment pending'),
(9, 'refund requested'),
(10, 'refunded');


-- Create the 'cust_order' table:
-- Use the bookstore database
USE bookstore;

-- Create the customer_orders table
CREATE TABLE customer_orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    shipping_method_id INT,
    order_status_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(shipping_method_id),
    FOREIGN KEY (order_status_id) REFERENCES order_status(order_status_id)
);

-- Insert sample data into customer_orders
INSERT INTO customer_orders (order_id, customer_id, order_date, shipping_method_id, order_status_id)
VALUES (1, 1, '2025-04-11', 1, 1);


-- Create the 'order_line' table:
USE bookstore;

CREATE TABLE order_line (
    order_line_id INT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity INT
);

-- Inserting data from the provided image (example for the first few rows)
INSERT INTO customer_order_line (order_line_id, order_id, book_id, quantity) VALUES
(1, 1, 3, 1),
(2, 1, 7, 2),
(3, 2, 12, 1),
(4, 3, 5, 1),
(5, 4, 9, 1),
(6, 5, 1, 2),
(7, 6, 15, 1),
(8, 7, 18, 1),
(9, 8, 2, 1),
(10, 9, 11, 1), -- Line 10
(11, 10, 4, 2),
(12, 11, 16, 1),
(13, 12, 8, 1),
(14, 13, 20, 1),
(15, 14, 6, 1),
(16, 15, 14, 1),
(17, 16, 19, 1),
(18, 17, 10, 1),
(19, 18, 17, 1),
(20, 19, 13, 2),
(21, 20, 1, 1),
(22, 21, 2, 1),
(23, 22, 3, 1),
(24, 23, 4, 1),
(25, 24, 5, 1),
(26, 25, 6, 1),
(27, 26, 7, 1),
(28, 27, 8, 1),
(29, 28, 9, 1),
(30, 29, 10, 1),
(31, 30, 11, 1);

-- Consider adding a foreign key constraint to link to the customer_orders table
ALTER TABLE customer_order_line
ADD CONSTRAINT fk_order
FOREIGN KEY (order_id)
REFERENCES customer_orders(order_id);

-- Consider adding a foreign key constraint to link to a books table (assuming you have one)
-- ALTER TABLE customer_order_line
-- ADD CONSTRAINT fk_book
-- FOREIGN KEY (book_id)
-- REFERENCES books(book_id);

USE bookstore;

RENAME TABLE customer_order_line TO order_list;

-- Create the 'order_history' table:
USE bookstore;

CREATE TABLE order_history (
    order_history_id INT PRIMARY KEY,
    order_id INT,
    status_date DATE,
    status_description VARCHAR(255)
);

INSERT INTO order_history (order_history_id, order_id, status_date, status_description) VALUES
(1, 1, '2025-04-11', 'pending'),
(2, 2, '2025-04-10', 'pending'),
(3, 3, '2025-04-11', 'shipped'),
(4, 4, '2025-04-09', 'delivered'),
(5, 5, '2025-04-08', 'pending'),
(6, 6, '2025-04-07', 'shipped'),
(7, 7, '2025-04-06', 'delivered'),
(8, 8, '2025-04-05', 'pending'),
(9, 9, '2025-04-04', 'shipped'),
(10, 10, '2025-04-03', 'delivered'),
(11, 11, '2025-04-02', 'pending'),
(12, 11, '2025-04-02', 'cancelled'),
(13, 12, '2025-04-01', 'pending'),
(14, 12, '2025-04-01', 'returned'),
(15, 13, '2025-03-31', 'delivered'),
(16, 14, '2025-03-30', 'pending'),
(17, 15, '2025-03-29', 'shipped'),
(18, 16, '2025-03-28', 'delivered'),
(19, 17, '2025-03-27', 'pending'),
(20, 17, '2025-03-27', 'cancelled'),
(21, 18, '2025-03-26', 'pending'),
(22, 18, '2025-03-26', 'returned'),
(23, 19, '2025-03-25', 'delivered'),
(24, 20, '2025-04-10', 'pending'),
(25, 21, '2025-04-09', 'pending'),
(26, 22, '2025-04-09', 'shipped'),
(27, 23, '2025-04-08', 'delivered'),
(28, 24, '2025-04-07', 'pending'),
(29, 24, '2025-04-07', 'cancelled'),
(30, 25, '2025-04-06', 'pending'),
(31, 25, '2025-04-06', 'returned'),
(32, 26, '2025-04-05', 'delivered'),
(33, 27, '2025-04-04', 'pending'),
(34, 28, '2025-04-03', 'shipped'),
(35, 29, '2025-04-02', 'delivered'),
(36, 30, '2025-04-01', 'pending');

-- Consider adding a foreign key constraint to link to the orders table
ALTER TABLE order_history
ADD CONSTRAINT fk_order_history_order
FOREIGN KEY (order_id)
REFERENCES customer_orders(order_id);




