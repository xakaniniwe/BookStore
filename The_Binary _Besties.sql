-- Create a new database called bookstore
CREATE DATABASE bookstore;

-- Use the database we created above
USE bookstore;

-- Create the 'publisher' table:
CREATE TABLE publisher (
 publisher_id INT AUTO_INCREMENT PRIMARY KEY,	-- Unique ID for each publisher
 publisher_name VARCHAR(255) NOT NULL			-- Publisher's name (It cannot be blank)
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
    language_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for each language
    language_name VARCHAR(100) NOT NULL         -- Name of the language (It cannot be blank)
);

-- insert data into the book_Language table
INSERT INTO book_language (language_id, language_name) VALUES
(1, 'English'),
(2, 'isiZulu'),
(3, 'Shwahili'),
(4, 'Afrikaans'),
(5, 'Shona');

-- Create the 'author' table (A list of all authors):
CREATE TABLE author (
    author_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for each author
    author_name VARCHAR(255) NOT NULL         -- Author's name (It cannot be blank)
);
 
-- Insert Data into the Author table
INSERT INTO author (author_id, author_name) VALUES
(1, 'Chinua Achebe'),
(2, 'Chimamanda N'),
(3, 'Ngugi wa Thion'),
(4, 'Wole Soyinka'),
(5, 'Nadine Gordime');

-- Create the 'book' table (A list of all books available in the store):
CREATE TABLE book (
    book_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for each book
    title VARCHAR(255) NOT NULL,            -- Title of the book (It cannot be blank)
    author_id INT,							-- Reference to author
    publisher_id INT,                       -- Reference to publisher
    language_id INT,                        -- Reference to the book language
    price DECIMAL(10, 2) NOT NULL,          -- Price of the book (It cannot be blank)
    publication_date DATE,                  -- Publication date
    FOREIGN KEY (author_id) REFERENCES author(author_id),          -- Foreign key to Author
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id), -- Foreign key to publisher
    FOREIGN KEY (language_id) REFERENCES book_language(language_id) -- Foreign key to language
); 

-- Insert data into the 'book' table:
INSERT INTO book (book_id, title, author_id, publisher_id, language_id, price, publication_date) VALUES
(1, 'Things Fall Apa', 1, 1, 1, 350.00, '1958-06-17'),
(2, 'Half of a Yellow', 2, 1, 1, 420.50, '2006-09-28'),
(3, 'Weep Not, Chil', 3, 3, 1, 305.75, '1964-05-15'),
(4, 'Burger\'s Daugh', 4, 2, 1, 380.00, '1979-08-01'),
(5, 'Disgrace', 5, 1, 1, 400.99, '1999-03-03'),
(6, 'The Conservati', 1, 4, 1, 320.95, '1974-04-22'),
(7, 'Waiting for the', 6, 1, 1, 365.20, '1980-09-10'),
(8, 'Life & Times of', 2, 2, 1, 395.40, '1983-01-15'),
(9, 'Foe', 3, 4, 1, 315.60, '1986-05-01'),
(10, 'Age of Iron', 1, 1, 1, 375.80, '1990-11-01'),
(11, 'The Promise', 2, 5, 1, 450.00, '2021-05-04'),
(12, 'The Silent Patie', 4, 1, 1, 299.00, '2019-02-05'),
(13, 'Where the Cra', 3, 2, 1, 349.50, '2018-08-14'),
(14, 'The Midnight Li', 2, 3, 1, 275.25, '2020-09-29'),
(15, 'Little Fires Ever', 1, 4, 1, 330.75, '2017-09-12'),
(16, 'Anxious People', 2, 5, 1, 280.00, '2020-09-08'),
(17, 'The Seven Hus', 1, 1, 1, 310.50, '2017-06-13'),
(18, 'Normal People', 3, 2, 1, 260.20, '2018-08-28'),
(19, 'Eleanor Oliphai', 4, 3, 1, 300.99, '2017-05-09'),
(20, 'The Guest List', 1, 4, 1, 325.40, '2020-06-02');

ALTER TABLE book
ADD COLUMN author_id INT;

-- Add a foreign key constraint (optional, but recommended for data integrity)
ALTER TABLE book
ADD CONSTRAINT fk_book_author
FOREIGN KEY (author_id)
REFERENCES author(author_id);

UPDATE book SET author_id = 1 WHERE book_id = 1;
UPDATE book SET author_id = 2 WHERE book_id = 2;
UPDATE book SET author_id = 3 WHERE book_id = 3;
UPDATE book SET author_id = 2 WHERE book_id = 4;
UPDATE book SET author_id = 3 WHERE book_id = 5;
UPDATE book SET author_id = 5 WHERE book_id = 6;
UPDATE book SET author_id = 5 WHERE book_id = 7;
UPDATE book SET author_id = 4 WHERE book_id = 8;
UPDATE book SET author_id = 2 WHERE book_id = 9;
UPDATE book SET author_id = 1 WHERE book_id = 10;
UPDATE book SET author_id = 4 WHERE book_id = 11;
UPDATE book SET author_id = 3 WHERE book_id = 12;
UPDATE book SET author_id = 2 WHERE book_id = 13;
UPDATE book SET author_id = 1 WHERE book_id = 14;
UPDATE book SET author_id = 2 WHERE book_id = 15;
UPDATE book SET author_id = 1 WHERE book_id = 16;
UPDATE book SET author_id = 3 WHERE book_id = 17;
UPDATE book SET author_id = 3 WHERE book_id = 18;
UPDATE book SET author_id = 4 WHERE book_id = 19;
UPDATE book SET author_id = 1 WHERE book_id = 20;

-- Create the 'book_author' table to manage the many-to-many relationship:
CREATE TABLE book_author (
    book_id INT,                                    -- Book ID (foreign key)
    author_id INT,                                  -- Author ID (foreign key)
    PRIMARY KEY (book_id, author_id),                 -- Composite primary key
    FOREIGN KEY (book_id) REFERENCES book(book_id),   -- Foreign key to book
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
    customer_id INT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    phone VARCHAR(20)
);

-- Insert data into the 'customer' table
INSERT INTO customer (customer_id, full_name, email, phone) VALUES
(1, 'Thando Mbeki', 'thando.mbeki@...', '825551234'),
(2, 'Lerato Nkosi', 'lerato.nkosi@...', '731112222'),
(3, 'Sipho Khumalo', 'sipho.khumalo@...', '602223333'),
(4, 'Aisha Abubaka', 'aisha.abubakar@...', '834445555'),
(5, 'Kwame Achear', 'kwame.achear@...', '795556666'),
(6, 'Fatima Hassan', 'fatima.hassan@...', '616667777'),
(7, 'David Adebayo', 'david.adebayo@...', '847778888'),
(8, 'Nadia Benani', 'nadia.benani@...', '728889999'),
(9, 'Yusuf Camara', 'yusuf.camara@...', '639990000'),
(10, 'Zola Dlamini', 'zola.dlamini@...', '810001111'),
(11, 'Chipo Banda', 'chipo.banda@...', '741112222'),
(12, 'Elias Farah', 'elias.farah@...', '782223333'),
(13, 'Gugu Hadebe', 'gugu.hadebe@...', '643334444'),
(14, 'Ismail Kone', 'ismail.kone@...', '854445555'),
(15, 'Jabulani Langa', 'jabulani.langa@...', '715556666'),
(16, 'Kemi Musa', 'kemi.musa@...', '626667777'),
(17, 'Lebo Ngwenya', 'lebo.ngwenya@...', '867778888'),
(18, 'Mamadou Siss', 'mamadou.siss@...', '758889999'),
(19, 'Naledi Tladi', 'naledi.tladi@...', '679990000'),
(20, 'Obi Uchendu', 'obi.uchendu@...', '870001111');

-- Create the 'country' table:
CREATE TABLE country (
    country_id INT AUTO_INCREMENT PRIMARY KEY,  -- Unique ID for each country
    country_name VARCHAR(100) NOT NULL          -- Name of the country
);

-- Insert Sample data into 'country' table:
INSERT INTO country (country_id, country_name) VALUES
(1, 'South Africa'),
(2, 'Lesotho'),
(3, 'Zambia'),
(4, 'Namibia'),
(5, 'Mozambique'),
(6, 'Botswana'),
(7, 'Zimbabwe'),
(8, 'Kenya'),
(9, 'Nigeria'),
(10, 'Tanzania'),
(11, 'Ethiopia'),
(12, 'Morocco'),
(13, 'Côte d\'Ivoire'),
(14, 'Guinea'),
(15, 'Ghana'),
(16, 'Togo'),
(17, 'Senegal'),
(18, 'Burkina Faso');

-- Create the 'address_status' table
CREATE TABLE address_status (
    address_status INT PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL
);

-- Insert data into the 'address_status' table
INSERT INTO address_status (address_status, status_name) VALUES
(1, 'current'),
(2, 'old');

-- Create the 'customer_address' table
CREATE TABLE customer_address (
    address_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    address_line1 VARCHAR(255) NOT NULL,
    address_line2 VARCHAR(255),
    province VARCHAR(100),
    city VARCHAR(100),
    post_code VARCHAR(20),
    country_id INT,
    Status INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (country_id) REFERENCES country(country_id),
    FOREIGN KEY (Status) REFERENCES address_status(address_status)
);

-- Insert data into the 'customer_address' table
INSERT INTO customer_address (address_id, customer_id, address_line1, address_line2, province, city, post_code, country_id, Status) VALUES
(1, 1, '123 Main Stree', NULL, 'Gauteng', 'Johannesburg', '2000', 1, 1),
(2, 1, '456 Suburb Ro Apt 10', NULL, 'Western Cape', 'Cape Town', '8000', 1, 2),
(3, 2, '789 Lagos Avei', NULL, 'Lagos State', 'Lagos', '100001', 9, 1),
(4, 3, '101 Church Str', NULL, 'KwaZulu-Natal', 'Durban', '4001', 1, 1),
(5, 4, '222 Cairo Roa', NULL, 'Cairo Gov.', 'Cairo', '11511', 5, 1),
(6, 5, '333 Accra Lan', NULL, 'Greater Accra', 'Accra', '4455', 15, 1),
(7, 6, '444 Nairobi Wr', NULL, 'Nairobi Co.', 'Nairobi', '100', 8, 1),
(8, 7, '555 Addis Aba', NULL, 'Addis Ababa', 'Addis Ababa', '1000', 11, 1),
(9, 8, '666 Marrakech', NULL, 'Marrakech...', 'Marrakech', '40000', 12, 1),
(10, 9, '777 Dakar Blvd', NULL, 'Dakar', 'Dakar', '1210', 17, 1),
(11, 10, '888 Gaborone', NULL, 'Gaborone', 'Gaborone', '1233', 6, 1),
(12, 11, '999 Lusaka Dri', NULL, 'Lusaka Prov.', 'Lusaka', '10101', 3, 1),
(13, 12, '1011 Mogadish', NULL, 'Banadir', 'Mogadishu', '1455', 11, 1),
(14, 13, '1112 Bloemfon', NULL, 'Free State', 'Bloemfontein', '9301', 1, 1),
(15, 14, '1213 Abidjan A', NULL, 'Abidjan', 'Abidjan', '54778', 13, 1),
(16, 15, '1314 Windhoek', NULL, 'Khomas', 'Windhoek', '222', 4, 1),
(17, 16, '1415 Abuja Clo', NULL, 'FCT', 'Abuja', '900101', 9, 1),
(18, 17, '1516 Mbabane', NULL, 'Hhohho', 'Mbabane', '511', 2, 1),
(19, 18, '1617 Bamako F', NULL, 'Bamako Cap...', 'Bamako', '1114', 18, 1),
(20, 19, '1718 Maseru B', NULL, 'Maseru', 'Maseru', '1145', 2, 1),
(21, 20, '1819 Yaounde', NULL, 'Centre', 'Yaounde', '1122', 7, 1),
(22, 1, '789 Apartment. Unit 3B', NULL, 'Gauteng', 'Pretoria', '1200', 1, 1);


-- address' table (To store all addresses in the system):
CREATE TABLE address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    address_line1 VARCHAR(255) NOT NULL,
    address_line2 VARCHAR(255),
    province VARCHAR(100),
    city VARCHAR(100) NOT NULL,
    post_code VARCHAR(20) NOT NULL,
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

-- Insert data into the 'address' table
INSERT INTO address (address_id, address_line1, address_line2, province, city, post_code, country_id) VALUES
(1, '123 Main Street', NULL, 'Gauteng', 'Johannesburg', '2000', 1),
(2, '456 Suburb Road, Apt 10', NULL, 'Western Cape', 'Cape Town', '8000', 1),
(3, '789 Lagos Avenue', NULL, 'Lagos State', 'Lagos', '100001', 9),
(4, '101 Church Street', NULL, 'KwaZulu-Natal', 'Durban', '4001', 1),
(5, '222 Cairo Road', NULL, 'Cairo Governorate', 'Cairo', '11511', 5),
(6, '333 Accra Lane', NULL, 'Greater Accra', 'Accra', '4455', 15),
(7, '444 Nairobi Way', NULL, 'Nairobi County', 'Nairobi', '100', 8),
(8, '555 Addis Ababa', NULL, 'Addis Ababa', 'Addis Ababa', '1000', 11),
(9, '666 Marrakech Souk', NULL, 'Marrakech-Safi', 'Marrakech', '40000', 12),
(10, '777 Dakar Boulevard', NULL, 'Dakar', 'Dakar', '1210', 17),
(11, '888 Gaborone Drive', NULL, 'Gaborone', 'Gaborone', '1233', 6),
(12, '999 Lusaka Drive', NULL, 'Lusaka Province', 'Lusaka', '10101', 3),
(13, '1011 Mogadishu Street', NULL, 'Banadir', 'Mogadishu', '1455', 11),
(14, '1112 Bloemfontein Road', NULL, 'Free State', 'Bloemfontein', '9301', 1),
(15, '1213 Abidjan Avenue', NULL, 'Abidjan', 'Abidjan', '54778', 13),
(16, '1314 Windhoek Street', NULL, 'Khomas', 'Windhoek', '222', 4),
(17, '1415 Abuja Close', NULL, 'Federal Capital Territory', 'Abuja', '900101', 9),
(18, '1516 Mbabane Highway', NULL, 'Hhohho', 'Mbabane', '511', 2),
(19, '1617 Bamako Freeway', NULL, 'Bamako Capital District', 'Bamako', '1114', 18),
(20, '1718 Maseru Bridge', NULL, 'Maseru', 'Maseru', '1145', 2),
(21, '1819 Yaounde Avenue', NULL, 'Centre', 'Yaounde', '1122', 7),
(22, '789 Apartment, Unit 3B', NULL, 'Gauteng', 'Pretoria', '1200', 1);


-- Create the 'shipping_method' table
CREATE TABLE shipping_method (
    shipping_method_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for each shipping method
    method_name VARCHAR(100) NOT NULL                   -- Name of the shipping method (e.g., standard, expedited)
);

-- Create the 'order_status' table:
CREATE TABLE order_status (
    order_status_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for each order status
    status_name VARCHAR(100) NOT NULL               -- Name of the order status (e.g., pending, shipped)
);

-- Create the 'cust_order' table:
CREATE TABLE cust_order (
    order_id INT AUTO_INCREMENT PRIMARY KEY,    -- Unique order ID
    customer_id INT,                            -- Reference to the customer
    order_date DATE NOT NULL,                   -- Order date
    shipping_method_id INT,                     -- Reference to shipping method
    order_status_id INT,                        -- Reference to order status
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id), -- Foreign key to customer
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(shipping_method_id), -- Foreign key to shipping method
    FOREIGN KEY (order_status_id) REFERENCES order_status(order_status_id)  -- Foreign key to order status
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
    status_description VARCHAR(255) NOT NULL,        -- Description of the status (e.g., shipped, delivered)
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id) -- Foreign key to order
);
