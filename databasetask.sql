CREATE DATABASE shop;
USE shop;
CREATE TABLE user (
    user_id int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Email varchar(255),
    Postcode varchar(8),
    PhoneNo int,
    PRIMARY KEY (user_id)
);

CREATE TABLE orders (
order_id int AUTO_INCREMENT,
   user_id int NOT NULL,
   order_date DATE NOT NULL,
    PRIMARY KEY (order_id),
    foreign key (user_id) references user(user_id)
);

CREATE TABLE orderline (
orderline_id int AUTO_INCREMENT,
product_id int NOT NULL,
price decimal (7,2) NOT NULL,
quantity int,
    PRIMARY KEY (orderline_id),
    foreign key (product_id) references products(product_id)
);

ALTER TABLE orderline
ADD order_id int,
ADD FOREIGN KEY (order_id) references orders(order_id);

CREATE TABLE products (
product_id int AUTO_INCREMENT,
name varchar(255),
unit_price decimal (7,2),
stockbalance int NOT NULL,
PRIMARY KEY (product_id)
);

insert into user (user_id, LastName, FirstName, Email, Postcode, PhoneNo) VALUES ('5', 'goster', 'gob', 'gobgoster@email.com', 'cr76gg', '0791234577');

select * FROM user;

insert into products (product_id, name, unit_price, stockbalance) VALUES ('5', 'Pawruto Kittenstorm', '69.69', '69');

SELECT * FROM products;

select * from orders;

insert into orders (order_id, user_id, order_date) VALUES ('5','2', '2022-01-19');

insert into orderline (orderline_id, order_id, product_id, quantity, price) VALUES ('6558','5','3','3','38.97');

select * from orderline;

Select unit_price, name FROM products WHERE unit_price IS NOT NULL ORDER BY unit_price ASC LIMIT 5;
Select quantity,product_id FROM orderline WHERE quantity >3;
Select stockbalance, name FROM products WHERE stockbalance IS NOT NULL ORDER BY stockbalance DESC LIMIT 5;
SELECT orders.order_id, user.user_id, orders.order_date FROM Orders INNER JOIN user ON orders.user_id=user.user_id;
select * FROM products WHERE unit_price > 12;
Select products.product_id, orderline.order_id, orderline.quantity, products.name FROM products INNER JOIN orderline ON orderline.order_id=products.product_id;
Select user.user_id, user.FirstName, user.Lastname, user.Email, orders.order_id FROM user INNER JOIN orders ON orders.user_id=user.user_id ORDER BY order_id asc;
Select * FROM user WHERE FirstName LIKE '%ob';
Select * FROM user WHERE PhoneNo LIKE '%123%' ORDER BY LastName;
SELECT * FROM orders WHERE order_date LIKE '2022%' order by order_date ASC;

SET SQL_SAFE_UPDATES=0;
SET FOREIGN_KEY_CHECKS=0;
DELETE FROM user WHERE LastName ='boster';
DELETE FROM products WHERE name ='football fever';
DELETE FROM orderline WHERE price ='5.99';
DELETE FROM orders WHERE order_id=1;