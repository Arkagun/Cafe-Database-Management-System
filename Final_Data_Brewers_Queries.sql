CREATE DATABASE IF NOT EXISTS final_data_brewers;
USE final_data_brewers;

CREATE TABLE customer
(customer_id char(6) PRIMARY KEY NOT NULL,
 cust_fName varchar(10) NOT NULL,
 cust_lName varchar(10) NOT NULL,
 cust_mobile char(15),
 cust_email varchar(50),
 cust_address varchar(50),
 city varchar(10),
 postcode varchar(10),
 cust_sex char(1),
 cust_DOB date
);
DROP TABLE staff;
CREATE TABLE staff (
    staff_ID CHAR(5) PRIMARY KEY,
    staff_fName VARCHAR(10),
    staff_lName VARCHAR(10),
    staff_mobile CHAR(15),
    staff_email VARCHAR(50),
    staff_address VARCHAR(50),
    position VARCHAR(10),
    staff_sex CHAR(1),
    hire_date DATE,
    Salary DECIMAL(18 , 2 )
);
DROP TABLE Manager;
CREATE TABLE Manager (
	staff_ID CHAR(5),
    Manager_id VARCHAR(6) PRIMARY KEY,
  FOREIGN KEY (staff_ID) REFERENCES staff(staff_ID)
);
DROP TABLE Employee;
CREATE TABLE Employee (
	staff_ID CHAR(5) PRIMARY KEY,
	department VARCHAR(25) NOT NULL,
  FOREIGN KEY (staff_ID) REFERENCES staff(staff_ID)
);
DROP TABLE orders;
CREATE TABLE orders (
    order_id int PRIMARY KEY,
    customer_id char(6),
    staff_ID char(5),
    order_date date,
    order_time time,
    total_amount decimal,
    CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (staff_ID) REFERENCES staff(staff_ID)
);
DROP TABLE order_items;
CREATE TABLE order_items (
	order_id INT NOT NULL, 
    menu_id INT NOT NULL, 
    quantity INT NOT NULL, 
    special_requests VARCHAR(25), 
    PRIMARY KEY (order_id,menu_id), 
    FOREIGN KEY (order_id) REFERENCES orders(order_id), 
    FOREIGN KEY (menu_id) REFERENCES menu(menu_id) 
    );
    
CREATE TABLE inventory (
	SKU varchar(9) NOT NULL PRIMARY KEY,
	pDescription varchar(50)  NOT NULL,
	Dept varchar(9) NOT NULL,
	SubDept varchar(9),
	CostperSKU decimal(18, 2),
	PriceperSKU decimal(18, 2),
    supplier_id char(6),
	Manager_id varchar(6) NOT NULL,
	FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id),
    FOREIGN KEY (Manager_id) REFERENCES Manager(Manager_id)
	);
DROP TABLE deliveries;
CREATE TABLE deliveries (
    delivery_id int PRIMARY KEY,	
    staff_ID char(5),
    order_id int,
    delivery_date date,
    delivery_time time,
    delivery_address varchar(50),
    delivery_status varchar(20),
    FOREIGN KEY (staff_ID) REFERENCES staff(staff_ID),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
DROP TABLE bill;
CREATE TABLE bill ( 
	bill_id int PRIMARY KEY NOT NULL, 
	customer_id char(6) NOT NULL, 
	staff_ID char(6) NOT NULL, 
	order_id int NOT NULL, 
	delivery_id int NOT NULL, 
	total_amount decimal(10,2) NOT NULL, 
	bill_date date NOT NULL, 
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id), 
	FOREIGN KEY (staff_ID) REFERENCES staff(staff_ID), 
	FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE menu (
menu_id int PRIMARY KEY,
menu_name varchar(50) NOT NULL,
menu_price decimal(10,2) NOT NULL,
menu_description varchar(255)
);

CREATE TABLE sales (
    sales_id INT PRIMARY KEY NOT NULL,
    menu_id INT NOT NULL,
    sales_date DATE NOT NULL,
    sales_quantity INT NOT NULL,
    sales_total decimal(10,2) NOT NULL,
    Manager_id varchar(6) NOT NULL,
    FOREIGN KEY (menu_id) REFERENCES menu(menu_id),
    FOREIGN KEY (Manager_id) REFERENCES Manager(Manager_id)
    
);

CREATE TABLE Supplier
(supplier_id char(6) PRIMARY KEY NOT NULL,
 supplier_fName varchar(10) NOT NULL,
 supplier_lName varchar(10) NOT NULL,
 supplier_mobile char(15),
 supplier_email varchar(50),
 supplier_address varchar(50),
 city varchar(10),
 postcode varchar(10)
 );
 
 Select * from customer;
INSERT INTO customer (customer_id, cust_fName, cust_lName, cust_mobile, cust_email, cust_address, city, postcode, cust_sex, cust_DOB)
VALUES ('C10001', 'John', 'Doe', '1234567890', 'johndoe@example.com', '123 Main St', 'New York', '10001', 'M', '1990-01-01');
INSERT INTO customer (customer_id, cust_fName, cust_lName, cust_mobile, cust_address, city, postcode, cust_sex, cust_DOB)
VALUES ('C10002', 'Jane', 'Doe', '0987654321', '456 Oak Ave', 'LA', '90001', 'F', '1995-02-15');
INSERT INTO customer (customer_id, cust_fName, cust_lName, cust_email, cust_address, city, postcode, cust_sex, cust_DOB)
VALUES ('C10003', 'Robert', 'Smith', NULL, '789 Pine St', 'Chicago', '60601', 'M', '1985-07-03');
INSERT INTO customer (customer_id, cust_fName, cust_lName, cust_sex, cust_DOB)
VALUES ('C10004', 'Anna', 'Lee', 'F', '1998-09-12');
INSERT INTO customer (customer_id, cust_fName, cust_lName, cust_mobile, cust_email, cust_address, city, postcode, cust_sex, cust_DOB)
VALUES ('C10005', 'David', 'Johnson', '5551234567', 'davidj@example.com', '1234 Elm St', 'Seattle', '98101', 'M', '1993-05-20');
INSERT INTO customer (customer_id, cust_fName, cust_lName, cust_mobile, cust_email, cust_address, city, postcode, cust_sex, cust_DOB)
VALUES ('C10006', 'Emily', 'Chen', '7779998888', 'emilyc@example.com', '4567 Maple Rd', 'Houston', '12345', 'F', '1999-12-31');
 
 
 
 Select * from staff;
 INSERT INTO staff (staff_ID, staff_fName, staff_lName, staff_mobile, staff_email, staff_address, position, staff_sex, hire_date, Salary)
VALUES ('S1001', 'Jason', 'Roy', '1234567890', 'johndoe@example.com', '123 Main St', 'Manager', 'M', '2021-01-01', 50000.00);
INSERT INTO staff (staff_ID, staff_fName, staff_lName, staff_mobile,staff_email, staff_address, position, staff_sex, hire_date, Salary)
VALUES ('S1002', 'Jenny', 'Hargreeves','2128329087', 'janedoe@example.com', '456 Oak Ave', 'Manager', 'F', '2022-02-15', 52000.00);
INSERT INTO staff (staff_ID, staff_fName, staff_lName, position, staff_sex, hire_date, Salary)
VALUES ('S1004', 'Anna', 'Lee', 'Intern', 'F', '2023-05-01', 20000.00);
INSERT INTO staff (staff_ID, staff_fName, staff_lName, staff_mobile, staff_email, staff_address, position, staff_sex, hire_date, Salary)
VALUES ('S1005', 'Diego', 'Cortez', '5551234567', 'davidj@example.com', '19 Elm St', 'Barista', 'M', '2021-08-01', 45000.00);
INSERT INTO staff (staff_ID, staff_fName, staff_lName, staff_mobile, staff_email, staff_address, position, staff_sex, hire_date, Salary)
VALUES ('S1006', 'Any', 'Wong', '777998488', 'emilyc@example.com', '4567 Maple Rd', 'Server', 'F', '2023-01-01', 10000.00);

Select * from Supplier;
INSERT INTO Supplier (supplier_id, supplier_fName, supplier_lName, supplier_mobile, supplier_email, supplier_address, city, postcode)
VALUES ('S006', 'Olivia', 'Garcia', '9879994588', 'oliviagarcia@example.com', '4567 Maple Ave', 'LA', '90210');
INSERT INTO Supplier (supplier_id, supplier_fName, supplier_lName, supplier_mobile, supplier_email, supplier_address, city, postcode)
VALUES ('S001', 'William', 'Shatner', '4534567890', 'williamjones@example.com', '43 Maggio St', 'NY', '10001');
INSERT INTO Supplier (supplier_id, supplier_fName, supplier_lName, supplier_mobile, supplier_email, supplier_address, city, postcode)
VALUES ('S005', 'Michael', 'Jordan', '555998567', 'michaelbrown@example.com', '15 Rodeo Drive', 'Miami', '33101');

Select * from Manager;
INSERT INTO Manager (staff_ID, Manager_id)
VALUES ('S1001', 'M00001');
INSERT INTO Manager (staff_ID, Manager_id)
VALUES ('S1002', 'M00002');

Select * from orders;
INSERT INTO orders (order_id, customer_id, staff_ID, order_date, order_time, total_amount)
VALUES (1, 'C10001', 'S1005', '2023-05-02', '10:30:00', 12.50);
INSERT INTO orders (order_id, customer_id, staff_ID, order_date, order_time, total_amount)
VALUES (2, 'C10002', 'S1006', '2023-05-02', '11:15:00', 9.75);
INSERT INTO orders (order_id, customer_id, staff_ID, order_date, order_time, total_amount)
VALUES (3, 'C10003', 'S1005', '2023-05-02', '12:00:00', 18.25);
INSERT INTO orders (order_id, customer_id, staff_ID, order_date, order_time, total_amount)
VALUES (4, 'C10004', 'S1005', '2023-05-02', '13:30:00', 5.5);
INSERT INTO orders (order_id, customer_id, staff_ID, order_date, order_time, total_amount)
VALUES (5, 'C10005', 'S1006', '2023-05-02', '14:45:00', 7.20);
INSERT INTO orders (order_id, customer_id, staff_ID, order_date, order_time, total_amount)
VALUES (6, 'C10006', 'S1005', '2023-05-02', '15:15:00', 10.00);

Select * from menu;
INSERT INTO menu (menu_id, menu_name, menu_price, menu_description)
VALUES (101, 'Espresso', 2.50, 'A shot of strong coffee, served in a small cup.');
INSERT INTO menu (menu_id, menu_name, menu_price, menu_description)
VALUES (201, 'Bagel and Cream Cheese', 4.50, 'Toasted bagel served with cream cheese and your choice of toppings.');
INSERT INTO menu (menu_id, menu_name, menu_price, menu_description)
VALUES (203, 'Chicken Caesar Salad', 8.99, 'Crisp romaine lettuce topped with grilled chicken, Parmesan cheese, and croutons.');
INSERT INTO menu (menu_id, menu_name, menu_price, menu_description)
VALUES (204, 'Veggie Burger', 6.99, 'A delicious veggie patty served on a sesame seed bun with lettuce, tomato, and onion.');
INSERT INTO menu (menu_id, menu_name, menu_price, menu_description)
VALUES (301, 'Iced Tea', 2.99, 'A refreshing iced tea served with a slice of lemon.');
INSERT INTO menu (menu_id, menu_name, menu_price, menu_description)
VALUES (302, 'Cappuccino', 3.50, 'A shot of espresso topped with steamed milk and a frothy foam.');

Select * from order_items;
INSERT INTO order_items (order_id, menu_id, quantity, special_requests)
VALUES (1, 101, 1, 'extra sugar');
INSERT INTO order_items (order_id, menu_id, quantity, special_requests)
VALUES (1, 203, 2, 'no onions');
INSERT INTO order_items (order_id, menu_id, quantity, special_requests)
VALUES (2, 302, 1, 'extra hot');
INSERT INTO order_items (order_id, menu_id, quantity, special_requests)
VALUES (3, 201, 1, NULL);
INSERT INTO order_items (order_id, menu_id, quantity, special_requests)
VALUES (4, 201, 1, 'to go');
INSERT INTO order_items (order_id, menu_id, quantity, special_requests)
VALUES (4, 204, 1, 'no pickles');

Select * from inventory;

INSERT INTO inventory (SKU, pDescription, Dept, SubDept, CostperSKU, PriceperSKU, supplier_id, Manager_id)
VALUES ('ESP001', 'Espresso Beans', 'Coffee', 'Beans', 10.50, 15.99, 'S006', 'M00001');
INSERT INTO inventory (SKU, pDescription, Dept, SubDept, CostperSKU, PriceperSKU, supplier_id, Manager_id)
VALUES ('CHOC001', 'Chocolate Syrup', 'Ingreds', 'Syrups', 5.00, 8.99, 'S001', 'M00001');
INSERT INTO inventory (SKU, pDescription, Dept, SubDept, CostperSKU, PriceperSKU, supplier_id, Manager_id)
VALUES ('MILK001', 'Milk', 'Dairy', NULL, 3.50, 4.99, 'S006', 'M00001');
INSERT INTO inventory (SKU, pDescription, Dept, SubDept, CostperSKU, PriceperSKU, supplier_id, Manager_id)
VALUES ('SUG001', 'Sugar Packets', 'Ingreds', 'Swtnr', 2.00, 3.49, 'S005', 'M00002');
INSERT INTO inventory (SKU, pDescription, Dept, SubDept, CostperSKU, PriceperSKU, supplier_id, Manager_id)
VALUES ('TEA001', 'Assam Tea', 'Tea', 'Black Tea', 7.50, 12.99, 'S006', 'M00001');
INSERT INTO inventory (SKU, pDescription, Dept, SubDept, CostperSKU, PriceperSKU, supplier_id, Manager_id)
VALUES ('CUP001', 'Coffee Cups', 'Supplies', 'Cups', 20.00, 24.99, 'S005', 'M00002');


Select * from deliveries;

INSERT INTO deliveries (delivery_id, staff_ID, order_id, delivery_date, delivery_time, delivery_address, delivery_status)
VALUES (1, 'S1004', 1, '2022-05-01', '10:30:00', '123 Rodeo St', 'Delivered');
INSERT INTO deliveries (delivery_id, staff_ID, order_id, delivery_date, delivery_time, delivery_address, delivery_status)
VALUES (2, 'S1004', 2, '2022-05-02', '12:45:00', '456 Richmond Ave', 'In transit');
INSERT INTO deliveries (delivery_id, staff_ID, order_id, delivery_date, delivery_time, delivery_address, delivery_status)
VALUES (3, 'S1004', 3, '2022-05-03', '11:15:00', '12056 Oak St', 'Pending');
INSERT INTO deliveries (delivery_id, staff_ID, order_id, delivery_date, delivery_time, delivery_address, delivery_status)
VALUES (4, 'S1006', 4, '2022-05-04', '14:00:00', '456 Westchase ', 'Delivered');
INSERT INTO deliveries (delivery_id, staff_ID, order_id, delivery_date, delivery_time, delivery_address, delivery_status)
VALUES (5, 'S1006', 5, '2022-05-05', '16:30:00', '123 Elm Hollow', 'In transit');
INSERT INTO deliveries (delivery_id, staff_ID, order_id, delivery_date, delivery_time, delivery_address, delivery_status)
VALUES (6, 'S1006', 6, '2022-05-06', '17:45:00', '789 Oak Blvd', 'Pending');

Select * from bill;
INSERT INTO bill (bill_id, customer_id, staff_ID, order_id, delivery_id, total_amount, bill_date)
VALUES (1, 'C10002', 'S1006', 1, 1, 25.99, '2023-05-03');
INSERT INTO bill (bill_id, customer_id, staff_ID, order_id, delivery_id, total_amount, bill_date)
VALUES (2, 'C10001', 'S1005', 2, 2, 15.50, '2023-05-03');
INSERT INTO bill (bill_id, customer_id, staff_ID, order_id, delivery_id, total_amount, bill_date)
VALUES (3, 'C10004', 'S1005', 3, 3, 10.75, '2023-05-03');
INSERT INTO bill (bill_id, customer_id, staff_ID, order_id, delivery_id, total_amount, bill_date)
VALUES (4, 'C10003', 'S1005', 4, 4, 35.25, '2023-05-03');
INSERT INTO bill (bill_id, customer_id, staff_ID, order_id, delivery_id, total_amount, bill_date)
VALUES (5, 'C10005', 'S1006', 5, 5, 8.99, '2023-05-03');

Select * from sales;
INSERT INTO sales (sales_id, menu_id, sales_date, sales_quantity, sales_total,Manager_id)
VALUES (1, 101, '2023-05-01', 10, 35.50,'M00002');

INSERT INTO sales (sales_id, menu_id, sales_date, sales_quantity, sales_total,Manager_id)
VALUES (2, 201, '2023-05-02', 15, 52.75,'M00002');

INSERT INTO sales (sales_id, menu_id, sales_date, sales_quantity, sales_total,Manager_id)
VALUES (3, 203, '2023-05-03', 5, 18.25,'M00001');

INSERT INTO sales (sales_id, menu_id, sales_date, sales_quantity, sales_total,Manager_id)
VALUES (4, 204, '2023-05-04', 8, 24.00,'M00001');

INSERT INTO sales (sales_id, menu_id, sales_date, sales_quantity, sales_total,Manager_id)
VALUES (5, 301, '2023-05-05', 12, 44.00,'M00001');

INSERT INTO sales (sales_id, menu_id, sales_date, sales_quantity, sales_total,Manager_id)
VALUES (6, 302, '2023-05-06', 20, 65.00,'M00002');

##USE CASES - Aggregate for tables

#1. CUSTOMER TABLE
SELECT COUNT(*) AS Customer_count FROM customer;

#2. Inventory table
SELECT Dept, AVG(CostperSKU) AS avg_cost_per_sku
FROM inventory
GROUP BY Dept;

#3. Bill Table
SELECT SUM(total_amount) as TOTAL_AMOUNT FROM bill;

#4. Menu Table
SELECT AVG(menu_price) FROM menu;

#5. Staff table
SELECT COUNT(*) AS staff_count FROM Staff;

#6. Deliveries table
SELECT COUNT(*) FROM deliveries  WHERE  delivery_date = '2022-05-06';

#7. Order table
SELECT COUNT(*) FROM orders  WHERE order_date = '2023-05-02';

#8. Order_items table
SELECT COUNT(menu_id)  AS items, SUM(quantity) AS totalitems FROM order_items WHERE order_id = 2;

#9. Supplier table
SELECT COUNT(*) FROM Supplier;

#10. Sales table
SELECT SUM(sales_total) FROM sales WHERE menu_id = 203;

##RELATIONSHIPS

#41.	Relationship ‘tracks’ between manager and inventory
SELECT SKU, pDescription, CostperSKU, PriceperSKU, Manager.Manager_id 
FROM inventory 
INNER JOIN Manager ON inventory.Manager_id = Manager.Manager_id 
WHERE Manager.Manager_id = 'M00001';

#42 Relationship ‘supplies’ between supplier and inventory
SELECT *
FROM inventory i
JOIN supplier s ON i.supplier_id = s.supplier_id
WHERE s.city = 'Miami';

#43.	Relationship ‘prepare’ between staff and orders
Select o.order_id,o.customer_id,o.order_time,s.staff_ID from orders , staff s
JOIN orders o on o.staff_ID = s.staff_ID 
WHERE o.order_id = "1";

#44.	Relationship ‘places’ between customer and order
SELECT * FROM orders
JOIN customer ON orders.customer_id = customer.customer_id
JOIN order_items ON orders.order_id = order_items.order_id;

#45.	Relationship ‘do’ between staff and deliveries on a specific date

SELECT *
FROM staff
JOIN deliveries ON staff.staff_ID = deliveries.staff_ID
WHERE deliveries.delivery_date = '2022-05-06';

#46. Relationship ‘pays’ between customer and bill
SELECT *
FROM customer c
JOIN bill b ON c.customer_ID = b.customer_ID
WHERE b.bill_ID = "1";


#47.	Relationship ‘Have’ between orders and order_items

SELECT  o.customer_id, o.order_id, oi.menu_id, oi.quantity
FROM orders o
JOIN order_items  oi ON o.order_id = oi.order_id
WHERE  o.customer_id = "C10001";


#48.	Relationship ‘contains’ between menu and order_items
SELECT SUM(oi.quantity) AS total_orders
FROM order_items oi
JOIN menu m ON m.menu_id = oi.menu_id
WHERE m.menu_name = "Espresso";


#49.	Relationship ‘Records’ between manager and sales
SELECT SUM(s.sales_quantity) AS Total_quantity, SUM(s.sales_total) AS Total_amount
From sales s
JOIN manager m ON m.Manager_id = s.Manager_id;
