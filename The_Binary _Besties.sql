-- Create a new database called bookstore
CREATE DATABASE bookstore;

-- Use the database we created above
USE bookstore;

-- Create the 'publisher' table:
CREATE TABLE publisher (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,     -- Unique ID for each publisher
    publisher_name VARCHAR(255) NOT NULL             -- Publisher's name (It cannot be blank)
);

-- Insert data into publisher table 
INSERT INTO publisher (publisher_id, publisher_name) VALUES
(1, 'Penguin Random House'),
(2, 'Jacana Media'),
(3, 'Kwela Books'),
(4, 'Oxford University Press'),
(5, 'NB Publishers');

-- Create the 'book_language' table:
CREATE TABLE book_language (
    language_id INT AUTO_INCREMENT PRIMARY KEY,    -- Unique ID for each language
    language_name VARCHAR(100) NOT NULL            -- Name of the language (It cannot be blank)
);

-- insert data into the book_Language table
INSERT INTO book_language (language_id, language_name) VALUES
(1, 'English'),
(2, 'isiZulu'),
(3, 'Shwahili'),
(4, 'Afrikaans'),
(5, 'Shona');

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

-- Insert data into the 'book' table:
INSERT INTO book (title, publisher_id, language_id, price, publication_date) VALUES
('Things Fall Apart', 1, 1, 350.00, '1958-06-17'),
('Half of a Yellow Sun', 1, 1, 420.50, '2006-09-28'),
('Weep Not, Child', 3, 1, 305.75, '1964-05-15'),
('Burger\'s Daughter', 2, 1, 380.00, '1979-08-01'),
('Disgrace', 1, 1, 400.99, '1999-03-03'),
('The Conservationist', 4, 1, 320.95, '1974-04-22'),
('Waiting for the Barbarians', 1, 1, 365.20, '1980-09-10'),
('Life & Times of Michael K', 2, 1, 395.40, '1983-01-15'),
('Foe', 4, 1, 315.60, '1986-05-01'),
('Age of Iron', 1, 1, 375.80, '1990-11-01'),
('The Promise', 5, 1, 450.00, '2021-05-04'),
('The Silent Patient', 1, 1, 299.00, '2019-02-05'),
('Where the Crawdads Sing', 2, 1, 349.50, '2018-08-14'),
('The Midnight Library', 3, 1, 275.25, '2020-09-29'),
('Little Fires Ever', 4, 1, 330.75, '2017-09-12'),
('Anxious People', 5, 1, 280.00, '2020-09-08'),
('The Seven Husbands of Evelyn Hugo', 1, 1, 310.50, '2017-06-13'),
('Normal People', 2, 1, 260.20, '2018-08-28'),
('Eleanor Oliphant is Completely Fine', 3, 1, 300.99, '2017-05-09'),
('The Guest List', 4, 1, 325.40, '2020-06-02');

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

-- Insert data into the 'book_author' table based on the 'book' table's author_id:
INSERT INTO book_author (book_id, author_id) VALUES
(1, 1),   -- Things Fall Apart - Chinua Achebe
(2, 2),   -- Half of a Yellow Sun - Chimamanda N
(3, 3),   -- Weep Not, Child - Ngugi wa Thion
(4, 4),   -- Burger's Daughter - Wole Soyinka 
(5, 5),   -- Disgrace - Nadine Gordime 
(6, 1),   -- The Conservationist - Chinua Achebe 
(7, 5),   -- Waiting for the Barbarians - Nadine Gordime 
(8, 4),   -- Life & Times of - Wole Soyinka 
(9, 2),   -- Foe - Chimamanda N 
(10, 1),  -- Age of Iron - Chinua Achebe 
(11, 4),  -- The Promise - Wole Soyinka 
(12, 3),  -- The Silent Patient - Ngugi wa Thion 
(13, 2),  -- Where the Crawdads Sing - Chimamanda N 
(14, 1),  -- The Midnight Library - Chinua Achebe 
(15, 2),  -- Little Fires Ever - Chimamanda N 
(16, 1),  -- Anxious People - Chinua Achebe 
(17, 3),  -- The Seven Hus - Ngugi wa Thion 
(18, 3),  -- Normal People - Ngugi wa Thion 
(19, 4),  -- Eleanor Oliphai - Wole Soyinka 
(20, 1);  -- The Guest List - Chinua Achebe 

-- Create the 'customer' table
CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(20)
);

-- Insert Sample data into 'customer' table:
INSERT INTO customer (full_name, email, phone)
VALUES
('Thando Mbeki', 'thando.mbeki@email.com', '825551234'),
('Lerato Nkosi', 'lerato.nkosi@email.com', '731112222'),
('Sipho Khumalo', 'sipho.khumalo@email.com', '602223333'),
('Aisha Abubakar', 'aisha.abubakar@email.com', '834445555'),
('Kwame Acheampong', 'kwame.acheampong@email.com', '795556666'),
('Fatima Hassan', 'fatima.hassan@email.com', '616667777'),
('David Adebayo', 'david.adebayo@email.com', '847778888'),
('Nadia Benani', 'nadia.benani@email.com', '728889999'),
('Yusuf Camara', 'yusuf.camara@email.com', '639990000'),
('Zola Dlamini', 'zola.dlamini@email.com', '810001111'),
('Chipo Banda', 'chipo.banda@email.com', '741112222'),
('Elias Farah', 'elias.farah@email.com', '782223333'),
('Gugu Hadebe', 'gugu.hadebe@email.com', '643334444'),
('Ismail Kone', 'ismail.kone@email.com', '854445555'),
('Jabulani Langa', 'jabulani.langa@email.com', '715556666'),
('Kemi Musa', 'kemi.musa@email.com', '626667777'),
('Lebo Ngwenya', 'lebo.ngwenya@email.com', '867778888'),
('Mamadou Sissoko', 'mamadou.sissoko@email.com', '758889999'),
('Naledi Tladi', 'naledi.tladi@email.com', '679990000'),
('Obi Uchendu', 'obi.uchendu@email.com', '870001111');

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

-- Insert data into the 'address' table
INSERT INTO address (address_line1, address_line2, province, city, post_code, country_id) VALUES
('123 Main Street', NULL, 'Gauteng', 'Johannesburg', '2000', 1),
('456 Suburb Road, Apt 10', NULL, 'Western Cape', 'Cape Town', '8000', 1),
('789 Lagos Avenue', NULL, 'Lagos State', 'Lagos', '100001', 9),
('101 Church Street', NULL, 'KwaZulu-Natal', 'Durban', '4001', 1),
('222 Cairo Road', NULL, 'Cairo Governorate', 'Cairo', '11511', 5),
('333 Accra Lane', NULL, 'Greater Accra', 'Accra', '4455', 15),
('444 Nairobi Way', NULL, 'Nairobi County', 'Nairobi', '100', 8),
('555 Addis Ababa', NULL, 'Addis Ababa', 'Addis Ababa', '1000', 11),
('666 Marrakech Souk', NULL, 'Marrakech-Safi', 'Marrakech', '40000', 12),
('777 Dakar Boulevard', NULL, 'Dakar', 'Dakar', '1210', 17),
('888 Gaborone Drive', NULL, 'Gaborone', 'Gaborone', '1233', 6),
('999 Lusaka Drive', NULL, 'Lusaka Province', 'Lusaka', '10101', 3),
('1011 Mogadishu Street', NULL, 'Banadir', 'Mogadishu', '1455', 11),
('1112 Bloemfontein Road', NULL, 'Free State', 'Bloemfontein', '9301', 1),
('1213 Abidjan Avenue', NULL, 'Abidjan', 'Abidjan', '54778', 13),
('1314 Windhoek Street', NULL, 'Khomas', 'Windhoek', '222', 4),
('1415 Abuja Close', NULL, 'Federal Capital Territory', 'Abuja', '900101', 9),
('1516 Mbabane Highway', NULL, 'Hhohho', 'Mbabane', '511', 2),
('1617 Bamako Freeway', NULL, 'Bamako Capital District', 'Bamako', '1114', 18),
('1718 Maseru Bridge', NULL, 'Maseru', 'Maseru', '1145', 2),
('1819 Yaounde Avenue', NULL, 'Centre', 'Yaounde', '1122', 7),
('789 Apartment, Unit 3B', NULL, 'Gauteng', 'Pretoria', '1200', 1);

-- Create the 'customer_address' table:
CREATE TABLE customer_address (
    address_id INT AUTO_INCREMENT,    -- Unique ID for each address
    customer_id INT,                              -- Reference to the customer
    address_status ENUM("Current", "Old") NOT NULL,  -- Indicates if the address is current or old
    PRIMARY KEY (customer_id, address_id), -- Composite primary key
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id), -- Foreign key to customer
    FOREIGN KEY (address_id) REFERENCES address(address_id)     -- Foreign key to address
);

-- Insert data into the 'customer_address' table
INSERT INTO customer_address (address_id, customer_id, address_status) VALUES
(1, 1, 'Current'),
(2, 1, 'Old'),
(3, 2, 'Current'),
(4, 3, 'Current'),
(5, 4, 'Current'),
(6, 5, 'Current'),
(7, 6, 'Current'),
(8, 7, 'Current'),
(9, 8, 'Current'),
(10, 9, 'Current'),
(11, 10, 'Current'),
(12, 11, 'Current'),
(13, 12, 'Current'),
(14, 13, 'Current'),
(15, 14, 'Current'),
(16, 15, 'Current'),
(17, 16, 'Current'),
(18, 17, 'Current'),
(19, 18, 'Current'),
(20, 19, 'Current'),
(21, 20, 'Current'),
(22, 1, 'Old'); -- Another address for customer 1


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

-- Insert data into the 'order_line' table
INSERT INTO order_line (order_id, book_id, quantity) VALUES
(1, 3, 1),
(1, 7, 2),
(2, 12, 1),
(3, 5, 1),
(4, 9, 1),
(5, 1, 2),
(6, 15, 1),
(7, 18, 1),
(8, 2, 1),
(9, 11, 1),
(10, 4, 2),
(11, 16, 1),
(12, 8, 1),
(13, 20, 1),
(14, 6, 1),
(15, 14, 1),
(16, 19, 1),
(17, 10, 1),
(18, 17, 1),
(19, 13, 2),
(20, 1, 1),
(21, 2, 1),
(22, 3, 1),
(23, 4, 1),
(24, 5, 1),
(25, 6, 1),
(26, 7, 1),
(27, 8, 1),
(28, 9, 1),
(29, 10, 1),
(30, 11, 1);

-- Create the 'order_history' table:
CREATE TABLE order_history (
    order_history_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for each order history record
    order_id INT,                                   -- Reference to the order
    status_date DATE NOT NULL,                       -- Date of the status update
    status_description VARCHAR(255) NOT NULL,        -- Description of the status (e.g., Order placed, Payment confirmed, Shipped via CourierX, Delivered to customer on xxx)
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id) -- Foreign key to order
);

-- Inserting fictional data into order_history
INSERT INTO order_history (order_id, status_date, status_description) VALUES
-- Order 1
(1, '2024-06-01', 'Order placed'),
(1, '2024-06-02', 'Payment confirmed'),
(1, '2024-06-03', 'Shipped via CourierX'),
(1, '2024-06-05', 'Delivered to customer'),
-- Order 2
(2, '2024-06-03', 'Order placed'),
(2, '2024-06-04', 'Payment confirmed'),
(2, '2024-06-06', 'Shipped via CourierY'),
(2, '2024-06-08', 'Delivered to customer'),
-- Order 3
(3, '2024-06-05', 'Order placed'),
(3, '2024-06-06', 'Payment failed'),
(3, '2024-06-07', 'Customer notified'),
-- Order 4
(4, '2024-06-06', 'Order placed'),
(4, '2024-06-07', 'Payment confirmed'),
-- Order 5
(5, '2024-06-08', 'Order placed'),
(5, '2024-06-09', 'Payment confirmed'),
(5, '2024-06-10', 'Shipped'),

-- Order 6
(6, '2024-06-10', 'Order placed'),
(6, '2024-06-11', 'Payment confirmed'),
(6, '2024-06-12', 'Delivered'),
-- Order 7
(7, '2024-06-11', 'Order placed'),
(7, '2024-06-12', 'Payment pending'),
-- Order 8
(8, '2024-06-13', 'Order placed'),
(8, '2024-06-14', 'Payment confirmed'),
-- Order 9
(9, '2024-06-14', 'Order placed'),
(9, '2024-06-15', 'Payment confirmed'),
-- Order 10
(10, '2024-06-16', 'Order placed'),
(10, '2024-06-17', 'Payment confirmed'),
(10, '2024-06-18', 'Shipped via CourierZ');

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

-- Inserting fictional data into payment table
INSERT INTO payment (order_id, payment_date, payment_method, payment_amount, payment_status) VALUES
(1, '2024-06-02', 'Credit Card', 700.40, 'completed'),
(2, '2024-06-04', 'PayPal', 299.00, 'completed'),
(3, '2024-06-06', 'EFT', 400.00, 'failed'),
(4, '2024-06-07', 'Credit Card', 380.00, 'completed'),
(5, '2024-06-09', 'Debit Card', 360.00, 'completed'),
(6, '2024-06-11', 'PayPal', 280.00, 'completed'),
(7, '2024-06-12', 'Credit Card', 450.00, 'pending'),
(8, '2024-06-14', 'Bank Transfer', 315.60, 'completed'),
(9, '2024-06-15', 'EFT', 365.20, 'completed'),
(10, '2024-06-17', 'PayPal', 375.80, 'completed');








