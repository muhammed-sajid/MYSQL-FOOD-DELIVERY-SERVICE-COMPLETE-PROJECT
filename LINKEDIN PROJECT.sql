CREATE DATABASE LINKCHALLENGE;

USE LINKCHALLENGE;

CREATE TABLE Customers(
Customer_id VARCHAR(30) PRIMARY KEY,
First_name VARCHAR(100) NOT NULL,
Last_name VARCHAR(100) NOT NULL,
Email VARCHAR(100) UNIQUE NOT NULL,
Phone_number VARCHAR(15),
Address TEXT );

INSERT INTO Customers(Customer_id,First_name,Last_name,Email,Phone_number,Address) VALUES
('C001','John', 'Doe', 'JHON.DOE@EXAMPLE.COM', '1234567890', '123 Elm Street'),
('C002','Jane', 'Smith', 'JANE.SMITH@EXAMPLE.COM', '9876543210', '456 Oak Avenue'),
('C003','Alice', 'Johnson', 'ALICE.JHONSON@EXAMPLE.COM', '5555555555', '789 Maple Drive'),
('C004','Bob', 'Brown', 'BOB.BROWN@EXAMPLE.COM', '1112223333', '321 Pine Lane'),
('C005','Tom', 'Williams', 'TOM.WILLIAMS@EXAMPLE.COM', '4445556666', '654 Cedar Road'),
('C006','Emily', 'Davis', 'EMILY.DAVIS@EXAMPLE.COM', '7778889999', '987 Birch Blvd'),
('C007','Sarah', 'Miller', 'SARAH.MILLER@EXAMPLE.COM', '1010101010', '234 Willow Way'),
('C008','David', 'Clark', 'DAVID.CLARK@EXAMPLE.COM', '2020202020', '567 Spruce Court'),
('C009','Chris', 'Lopez', 'CHRIS.LOPEZ@EXAMPLE.COM', '3030303030', '890 Aspen Alley'),
('C010','Emma', 'Hall', 'EMMA.HALL@EXAMPLE.COM', '4040404040', '345 Poplar Path');

SELECT * FROM Customers;

CREATE TABLE Restaurants(
Restaurant_id  VARCHAR(30) PRIMARY KEY,
Restaurant_name VARCHAR(100) NOT NULL,
Cuisine_type VARCHAR(50),
Address TEXT );

INSERT INTO Restaurants (restaurant_id, restaurant_name, cuisine_type, address) 
VALUES 
('R001', 'Pizza Palace', 'Italian', '101 Main Street'),
('R002', 'Fusion Bites', 'Fusion', '678 Gourmet Avenue'),
('R003', 'Sushi Spot', 'Japanese', '202 Park Avenue'),
('R004', 'Taco Town', 'Mexican', '303 High Street'),
('R005', 'Burger Barn', 'American', '404 Broad Street'),
('R006', 'Noodle House', 'Chinese', '505 Elm Street'),
('R007', 'Curry Corner', 'Indian', '606 Oak Avenue'),
('R008', 'BBQ Haven', 'Barbecue', '707 Pine Lane'),
('R009', 'Seafood Shack', 'Seafood', '808 Cedar Road'),
('R010', 'Deli Delight', 'Deli', '1010 Willow Way');

SELECT * FROM Restaurants;

CREATE TABLE Menu_Item(
Item_id VARCHAR(40) PRIMARY KEY,
Restaurant_id VARCHAR(40) NOT NULL,
Item_name VARCHAR(100) NOT NULL,
Price DECIMAL(10, 2) NOT NULL,
FOREIGN KEY(Restaurant_id) REFERENCES Restaurants(restaurant_id)
  ON DELETE CASCADE
  ON UPDATE CASCADE
  );

INSERT INTO Menu_Item(Item_id, Restaurant_id, Item_name, Price) VALUES 
('M001','R001', 'Pepperoni Pizza', 12.99),
('M002','R001', 'Margherita Pizza', 10.99),
('M003','R002', 'California Roll', 8.99),
('M004','R002', 'Tempura Roll', 9.99),
('M005','R003', 'Beef Taco', 3.49),
('M006','R003', 'Chicken Taco', 3.99),
('M007','R004', 'Classic Burger', 7.99),
('M008','R004', 'Cheeseburger', 8.99),
('M009','R005', 'Chicken Chow Mein', 10.49),
('M010','R005', 'Vegetable Lo Mein', 9.49);

SELECT *FROM Menu_Item;

  CREATE TABLE Orders(
  Orders_id VARCHAR(40) PRIMARY KEY,
  Customer_id VARCHAR(40) NOT NULL,
  Restaurant_id VARCHAR(40) NOT NULL,
  Orders_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  Total_price DECIMAL(10, 2) NOT NULL,
  FOREIGN KEY(Customer_id) REFERENCES Customers(Customer_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  FOREIGN KEY(Restaurant_id) REFERENCES  Restaurants(restaurant_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
    );
INSERT INTO Orders(Orders_id, Customer_id, Restaurant_id, Orders_date,  Total_price) VALUES
('OR001','C001', 'R001', '2024-11-28 12:30:00', 23.98),
('OR002','C002', 'R002', '2024-01-21 13:00:00', 18.98),
('OR003','C003', 'R003', '2024-06-18 13:30:00', 7.48),
('OR004','C004', 'R004', '2024-02-01 14:00:00', 16.98),
('OR005','C005', 'R005', '2024-03-02 14:30:00', 19.98),
('OR006','C006', 'R006', '2024-12-26 15:00:00', 12.99),
('OR007','C007', 'R007', '2024-09-08 15:30:00', 11.99),
('OR008','C008', 'R008', '2016-11-07 16:00:00', 29.99),
('OR009','C009', 'R009', '2014-08-04 16:30:00', 13.99),
('OR010','C010', 'R010', '2024-12-17 17:00:00', 10.49);
INSERT INTO Orders(Orders_id, Customer_id, Restaurant_id, Orders_date,  Total_price) VALUES
('OR011','C001', 'R001', '2024-11-28 12:30:00', 23.98),
('OR012','C001', 'R002', '2014-01-21 13:00:00', 18.98),
('OR013','C001', 'R003', '2020-06-18 13:30:00', 7.48),
('OR014','C002', 'R004', '2019-02-01 14:00:00', 16.98),
('OR015','C003', 'R005', '2022-03-02 14:30:00', 19.98),
('OR016','C004', 'R006', '2023-12-26 15:00:00', 12.99);


SELECT * FROM Orders;

CREATE TABLE Order_Item(
Order_Item_Id   VARCHAR(40) PRIMARY KEY,
Orders_id  VARCHAR(40) NOT NULL,
Item_id  VARCHAR(40) NOT NULL,
Quantity  VARCHAR(40) NOT NULL,
FOREIGN KEY (Orders_id) REFERENCES Orders(Orders_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
FOREIGN KEY (Item_id) REFERENCES Menu_Item(Item_id)
	ON DELETE CASCADE
    ON UPDATE CASCADE
    );
INSERT INTO Order_Item(Order_Item_Id , Orders_id, Item_id, Quantity) VALUES
('I001','OR001', 'M001', 1), 
('I002','OR001', 'M002', 1),
('I003','OR002', 'M003', 2),
('I004','OR003', 'M005', 2),
('I005','OR004', 'M006', 3),
('I006','OR005', 'M007', 2), 
('I007','OR005', 'M008', 1),
('I008','OR006', 'M009', 1),
('I009','OR007', 'M010', 1),
('I010','OR008', 'M001', 1),
('I011','OR008', 'M003', 2),
('I012','OR009', 'M006', 3),
('I013','OR010', 'M005', 1);

SELECT *FROM Order_Item;

CREATE TABLE Delivery_Agents(
agent_id VARCHAR(40) PRIMARY KEY,
First_name VARCHAR(100) NOT NULL,
Last_name VARCHAR(100) NOT NULL,
Phone_number VARCHAR(20) UNIQUE NOT NULL 
);
INSERT INTO Delivery_Agents(agent_id, First_name, Last_name, Phone_number) VALUES
('D001','Mike', 'Anderson', '4444444444'),
('D002','Sara', 'Wilson', '3333333333'),
('D003','Tom', 'Brown', '2222222222'),
('D004','Anna', 'Taylor', '5555555555'),
('D005','James', 'Moore', '6666666666'),
('D006','Lucy', 'White', '7777777777'),
('D007','Robert', 'Harris', '8888888888'),
('D008','Sophia', 'Martinez', '9999999999'),
('D009','Daniel', 'King', '1212121212'),
('D010','Ella', 'Scott', '3434343434');
SELECT * FROM Delivery_Agents;

CREATE TABLE Deliveries(
Delivery_id VARCHAR(40) PRIMARY KEY,
Orders_id VARCHAR(40) NOT NULL,
agent_id VARCHAR(40) NOT NULL,
Delivery_date DATETIME DEFAULT CURRENT_TIMESTAMP,
Delivery_status ENUM('Pending', 'completed', 'canceled') DEFAULT 'Pending',
FOREIGN KEY(Orders_id) REFERENCES  Orders(Orders_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
FOREIGN KEY(agent_id) REFERENCES  Delivery_Agents(agent_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
    );

INSERT INTO Deliveries(Delivery_id, Orders_id, agent_id,Delivery_date,Delivery_status) VALUES
('DS001','OR001', 'D001', '2024-11-30 13:00:00', 'completed'),
('DS002','OR002', 'D002', '2024-2-28 13:30:00', 'completed'),
('DS003','OR003', 'D003', '2024-06-25 14:00:00', 'completed'),
('DS004','OR004', 'D004', '2024-02-12 14:30:00', 'pending'),
('DS005','OR005', 'D005', '2024-03-10 15:00:00', 'completed'),
('DS006','OR006', 'D006', '2024-12-28 15:30:00', 'pending'),
('DS007','OR007', 'D008', '2024-11-30 16:00:00', 'completed'),
('DS008','OR008', 'D009', '2024-12-28 16:30:00', 'completed'),
('DS009','OR009', 'D009', '2024-09-28 17:00:00', 'pending'),
('DS010','OR010', 'D010', '2024-12-28 17:30:00', 'completed');

SELECT * FROM Deliveries;

#Fetch Unique Cuisines Offered by Restaurants
SELECT DISTINCT  cuisine_type FROM Restaurants;

# List All Customers and Assign Alias for First Name and Last Name
SELECT First_name AS FirstName, Last_name AS LastName FROM Customers;

#List all customers whose last name is 'Smith' 
SELECT * FROM CUSTOMERS WHERE LAST_NAME = 'SMITH';

#Retrieve orders with a total price greater than $25
SELECT Orders_id, Customer_id, Total_price FROM Orders WHERE Total_price > 25;

#Find orders where the quantity of items is less than 2 but greater than 1.
SELECT * FROM Order_Item WHERE Quantity > 1 AND Quantity < 3;

SELECT * FROM Order_Item WHERE Quantity  = 3;

SELECT * FROM Customers;
SELECT * FROM  Restaurants ;
SELECT * FROM Orders;
SELECT * FROM Menu_Item;
SELECT * FROM Order_Item;
#Find customers with a missing phone number
SELECT * FROM Customers WHERE Phone_number IS NULL;
 
#Find customers with  phone number
SELECT * FROM Customers WHERE Phone_number IS NOT NULL;

#List all restaurants not serving Italian or Japanese cuisine.
SELECT * FROM  Restaurants WHERE Cuisine_type NOT IN ('Italian', 'Japanese');

#List all restaurants  serving Italian or Japanese cuisine.
SELECT * FROM  Restaurants WHERE Cuisine_type IN ('Italian', 'Japanese');

# Retrieve all orders placed between 2015-01-07 and 2020-01-01.
SELECT Orders_id, Customer_id, Restaurant_id, Orders_date,  Total_price FROM Orders
WHERE Orders_date BETWEEN '2015-01-07' AND '2020-01-01' ;

# Retrieve all orders placed not between 2015-01-07 and 2020-01-01.
SELECT Orders_id, Customer_id, Restaurant_id, Orders_date,  Total_price FROM Orders
WHERE Orders_date NOT BETWEEN '2015-01-07' AND '2020-01-01' ;

#Find customers whose first name starts with ‘J’ and ends with 'n'.
SELECT Customer_id, First_name, Last_name, Email, Phone_number, Address FROM Customers
WHERE First_name LIKE 'j%n';

#Find customers whose first name does NOT start with 'J' and end with 'n'
SELECT Customer_id, First_name, Last_name, Email, Phone_number, Address FROM Customers
WHERE First_name NOT LIKE 'j%n';


SELECT * FROM Menu_Item;

SELECT * FROM Order_Item;

#List the 5 most expensive menu items. 
SELECT Item_name, Price FROM Menu_Item ORDER BY Price DESC LIMIT 5;

#Retrieve the top 3 customers who placed the highest number of orders 
SELECT Customer_id, COUNT(*)AS OrderCount FROM Orders 
GROUP BY Customer_id ORDER BY COUNT(*) DESC LIMIT 3;

#Count the total number of orders.alter
SELECT  COUNT(*) AS TotalOrders FROM Orders;

#Calculate the average price of menu items
SELECT ROUND(AVG(price),2) AS Avg_Price FROM Menu_Item;

#Calculate the total price of menu items
SELECT SUM(Price)AS TotalPrice FROM Menu_Item;

#Group orders by restaurant and calculate total sales per restaurant
SELECT Restaurant_id, SUM(Total_price) AS TotalSales FROM Orders GROUP BY Restaurant_id;

#Find restaurants with sales greater than $30.
SELECT Restaurant_id,SUM(Total_price) AS TotalSales FROM Orders 
GROUP BY Restaurant_id HAVING SUM(Total_price)>30;

# List all orders along with the customer and restaurant details using an inner join
SELECT Orders.Orders_id,
    Customers.First_name AS Customer_Name,
    Restaurants.restaurant_name AS Restaurant_Name,
    Orders.total_price
FROM 
    Orders
INNER JOIN 
    Customers ON Orders.Customer_id = Customers.Customer_id
INNER JOIN 
    Restaurants ON Orders.Restaurant_id = Restaurants.restaurant_id;

#Fetch all restaurants and include orders (even if they don’t have any orders using LEFT JOIN)
SELECT Restaurants.Restaurant_name,
Restaurants.Cuisine_type,
Orders.Orders_id,
Orders.Total_price
FROM
Restaurants
LEFT JOIN 
Orders ON Restaurants.Restaurant_Id = Orders.Restaurant_Id;

#Use RIGHT JOIN to display deliveries, even if agents haven't made any deliveries.
SELECT Delivery_Agents.First_name ,
Deliveries.Delivery_id,
Deliveries.Delivery_status
FROM
Delivery_Agents
RIGHT JOIN
Deliveries ON Delivery_Agents.agent_id = Deliveries.agent_id;

#Combine customer and delivery agent names into a single list using UNION.
SELECT First_name FROM Customers 
UNION
SELECT First_name FROM Delivery_Agents
ORDER BY First_name ASC;

#Use UNION ALL to include duplicate values from two queries
SELECT First_name FROM Customers 
UNION ALL
SELECT First_name FROM Delivery_Agents
ORDER BY First_name ASC;

#Use mathematical functions to apply a 10% discount on all menu items
SELECT Item_name ,Price ,ROUND(Price * 0.90,2) AS DISCOUNTED_PRICE FROM menu_item;


SELECT Item_name ,Price ,ROUND(Price-(Price * 0.90),2) AS DISCOUNT FROM menu_item;

SELECT *, ROUND(Price -(Price * 0.90),2) AS DISCOUNT,ROUND(Price * 0.90,2) AS DISCOUNTED_PRICE FROM menu_item;

#Convert all customer emails to lowercase using a string function.
SELECT CUSTOMER_ID, FIRST_NAME,LAST_NAME,EMAIL,LOWER(EMAIL) AS NORMALIZED_EMAIL,PHONE_NUMBER,ADDRESS FROM CUSTOMERS;

#Replace function
SELECT EMAIL, REPLACE(EMAIL,"EXAMPLE","GMAIL") AS REPLACED_MAIL FROM CUSTOMERS;

#Upper Function
SELECT UPPER(FIRST_NAME) AS FIRSTNAME, UPPER(LAST_NAME)AS LASTNAME FROM CUSTOMERS; 

CREATE TABLE Deliveries1(
Delivery_id VARCHAR(40) PRIMARY KEY,
Orders_id VARCHAR(40) NOT NULL,
agent_id VARCHAR(40) NOT NULL,
Orders_date DATETIME DEFAULT CURRENT_TIMESTAMP,
Delivery_date DATETIME DEFAULT CURRENT_TIMESTAMP,
Delivery_status ENUM('Pending', 'completed', 'canceled') DEFAULT 'Pending'
);

INSERT INTO Deliveries1(Delivery_id, Orders_id, agent_id,Orders_date,Delivery_date,Delivery_status) VALUES
('DS001','OR001', 'D001','2024-11-28 12:30:00', '2024-11-30 13:00:00', 'completed'),
('DS002','OR002', 'D002','2024-01-21 13:00:00', '2024-2-28 13:30:00', 'completed'),
('DS003','OR003', 'D003', '2024-06-18 13:30:00', '2024-06-25 14:00:00', 'completed'),
('DS004','OR004', 'D004', '2024-02-01 14:00:00','2024-02-12 14:30:00', 'pending'),
('DS005','OR005', 'D005',  '2024-03-02 14:30:00','2024-03-10 15:00:00', 'completed'),
('DS006','OR006', 'D006','2024-12-26 15:00:00', '2024-12-28 15:30:00', 'pending'),
('DS007','OR007', 'D008', '2024-09-08 15:30:00','2024-10-08 15:30:00',  'completed'),
('DS008','OR008', 'D009', '2024-11-07 16:00:00','2024-12-28 16:30:00', 'completed'),
('DS009','OR009', 'D009','2024-08-04 16:30:00',  '2024-09-28 17:00:00', 'pending'),
('DS010','OR010', 'D010',  '2024-12-17 17:00:00','2024-12-28 17:30:00', 'completed');

SELECT * FROM Deliveries1;

#Calculate the duration between order date and delivery date 
#DATEDIFF()  
SELECT Delivery_id , DATEDIFF(Delivery_date, Orders_date) AS Duration_in_days FROM Deliveries1;

#TIMESTAMPDIFF()
SELECT Delivery_id,TIMESTAMPDIFF(HOUR, Orders_date, Delivery_date) AS Duration_in_Hours FROM Deliveries1;

#DATEFORMAT()
SELECT Delivery_id,DATE_FORMAT(Orders_date, '%d/%m/%Y') AS FORMATTED_DATE FROM Deliveries1;

# Use a subquery to find customers with more than 1 order
SELECT Customer_id,First_name,Last_name FROM Customers
WHERE Customer_id IN 
( SELECT Customer_id FROM Orders GROUP BY  Customer_id HAVING COUNT(Orders_id) > 1 );

#Create a view that shows the top 3 highest spending customers
CREATE VIEW TopSpendingcustomers AS
SELECT Customers.Customer_id,Customers.First_name,Customers.Last_name, SUM(Orders.Total_price) As Total_Spend 
FROM Customers JOIN  Orders ON Customers.Customer_id = Orders.Customer_id
GROUP BY Customers.Customer_id,Customers.First_name,Customers.Last_name
ORDER BY Total_Spend DESC LIMIT 3;

SELECT * FROM TopSpendingcustomers;

##Write a stored procedure to update the delivery status
DELIMITER $$
CREATE PROCEDURE UpdateDeliveryStatus1(
    IN p_delivery_id VARCHAR(10))
BEGIN
    UPDATE Deliveries
    SET Delivery_status = 'completed'
    WHERE Delivery_id = p_delivery_id;
END $$
DELIMITER ;

CALL UpdateDeliveryStatus1('DS004');

#Write a stored procedure to update the delivery status
DELIMITER $$
CREATE PROCEDURE UpdateDeliveryStatus2(
    IN p_delivery_id VARCHAR(10))
BEGIN
    UPDATE Deliveries
    SET Delivery_status = 'Pending'
    WHERE Delivery_id = p_delivery_id;
END $$
DELIMITER ;

CALL UpdateDeliveryStatus2('DS005');
SELECT * FROM Deliveries where delivery_id='DS006';



DELIMITER $$
CREATE PROCEDURE UpdateDeliveris3(
     IN P_Delivery_id VARCHAR(20),
     IN P_Orders_id VARCHAR(20),
     IN P_agent_id VARCHAR(20),
     IN P_Delivery_date DATETIME,
     IN P_new_status VARCHAR(20) )
BEGIN
    INSERT INTO Deliveries (Delivery_id, Orders_id, agent_id, Delivery_date, Delivery_status)
    VALUES(P_Delivery_id, P_Orders_id,P_agent_id,P_Delivery_date,P_new_status);
END $$
DELIMITER ;   

CALL UpdateDeliveris3('DS012','OR004', 'D002', '2024-09-11 22:00:00', 'completed');

SELECT * FROM Orders;
SELECT * FROM Order_Item;
SELECT *FROM Menu_Item;

SELECT SUM(Order_Item.Quantity * Menu_Item.Price) 
FROM Order_Item JOIN Menu_Item ON Order_Item.Item_Id = Menu_Item.Item_id WHERE Order_Item.Orders_id='OR012';

DELIMITER $$
CREATE TRIGGER UpdatetTotalPrice
AFTER INSERT ON  Order_Item FOR EACH ROW 
BEGIN
     DECLARE My_Total decimal(10,2);
     
     SELECT SUM(Order_Item.Quantity * Menu_Item.Price) INTO My_Total
     FROM Order_Item JOIN Menu_Item ON Order_Item.Item_Id = Menu_Item.Item_id 
     WHERE Order_Item.Orders_id=New.Orders_id;
     
     UPDATE Orders 
     SET Total_price = My_Total 
     WHERE Orders_id = New.Orders_id;
END $$
DELIMITER ; 


INSERT INTO Order_Item (Order_Item_Id, Orders_Id, Item_Id, Quantity)
VALUES ('I018', 'OR012', 'M008', 2);