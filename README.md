# MYSQL-FOOD-DELIVERY-SERVICE-COMPLETE-PROJECT
FOOD DELIVERY SERVICE

FoodCo is a food delivery service that connects customers with their favorite restaurants. The company wants to analyze its operations by storing and querying data related to customers,orders, restaurants, and delivery agents.

# TABLES
## CUSTOMERS TABLE
![image](https://github.com/user-attachments/assets/85659c9a-f913-4ca8-baf2-1021b521c8a7)

## RESTAURANTS
![image](https://github.com/user-attachments/assets/ac4b1afc-c5e5-4001-83cd-4998d2a1c83e)

## MENU ITEM
![image](https://github.com/user-attachments/assets/c2ad4c1c-a542-434f-8395-bca9e5269242)

## ORDERS
![image](https://github.com/user-attachments/assets/e942c13e-47f3-4eea-9f08-5b83cee86abb)

## ORDER ITEM
![image](https://github.com/user-attachments/assets/8a6388be-8364-46b5-ac11-b9e22c0e49fb)

## DELIVERY AGENT
![image](https://github.com/user-attachments/assets/2cedb390-5615-4a67-8345-53fba129dd0a)

## DELIVERIES
![image](https://github.com/user-attachments/assets/ea1cc1ff-5268-4d26-bacb-68253174f8c4)

## DELIVERIES1
![image](https://github.com/user-attachments/assets/8cd52db3-a183-4992-ab16-10419b1ab3af)

## Fetch Unique Cuisines Offered by Restaurants
SELECT DISTINCT  cuisine_type FROM Restaurants;

![image](https://github.com/user-attachments/assets/2184003c-b6bf-4d94-9067-4574ccdca061)


## List All Customers and Assign Alias for First Name and Last Name
SELECT First_name AS FirstName, Last_name AS LastName FROM Customers;
![image](https://github.com/user-attachments/assets/3ac19807-07a9-478d-8ae8-f3cbb951f3b0)


## List all customers whose last name is 'Smith' 
SELECT * FROM CUSTOMERS WHERE LAST_NAME = 'SMITH';
![image](https://github.com/user-attachments/assets/70b4af4c-93a8-430a-9f72-49aa84afb994)

## Retrieve orders with a total price greater than $25
SELECT Orders_id, Customer_id, Total_price FROM Orders WHERE Total_price > 25;
![image](https://github.com/user-attachments/assets/8fc125b2-908d-45e0-899b-7d3836052a49)

## Find orders where the quantity of items is less than 2 but greater than 1.
SELECT * FROM Order_Item WHERE Quantity > 1 AND Quantity < 3;
![image](https://github.com/user-attachments/assets/93f26aa1-723a-41bf-aa67-0eb696d745e9)

SELECT * FROM Order_Item WHERE Quantity  = 3;
![image](https://github.com/user-attachments/assets/8266f66c-d71f-4fe2-98ba-943b533a5ad8)

## Find customers with a missing phone number
SELECT * FROM Customers WHERE Phone_number IS NULL;
![image](https://github.com/user-attachments/assets/7ec50f21-13b4-4a06-a58b-8e1b7de3abb4)

## Find customers with  phone number
SELECT * FROM Customers WHERE Phone_number IS NOT NULL;
![image](https://github.com/user-attachments/assets/ed7cbdea-8c86-45d4-849e-d09573fcb9a2)

## List all restaurants not serving Italian or Japanese cuisine.
SELECT * FROM  Restaurants WHERE Cuisine_type NOT IN ('Italian', 'Japanese');

## List all restaurants  serving Italian or Japanese cuisine.
SELECT * FROM  Restaurants WHERE Cuisine_type IN ('Italian', 'Japanese');
![image](https://github.com/user-attachments/assets/f5a902c6-7d9f-475e-b744-3181504fe409)

## Retrieve all orders placed between 2015-01-07 and 2020-01-01.
SELECT Orders_id, Customer_id, Restaurant_id, Orders_date,  Total_price FROM Orders
WHERE Orders_date BETWEEN '2015-01-07' AND '2020-01-01' ;
![image](https://github.com/user-attachments/assets/fa80149c-2a77-4a15-864d-efe97758d692)

## Retrieve all orders placed not between 2015-01-07 and 2020-01-01.
SELECT Orders_id, Customer_id, Restaurant_id, Orders_date,  Total_price FROM Orders
WHERE Orders_date NOT BETWEEN '2015-01-07' AND '2020-01-01' ;
![image](https://github.com/user-attachments/assets/16f5a600-f1ec-4a4a-b17f-84322ee5b8b8)

## Find customers whose first name starts with ‘J’ and ends with 'n'.
SELECT Customer_id, First_name, Last_name, Email, Phone_number, Address FROM Customers
WHERE First_name LIKE 'j%n';
![image](https://github.com/user-attachments/assets/9ac2e9ee-dc2d-419c-ac16-1cba444fd4de)

## Find customers whose first name does NOT start with 'J' and end with 'n'
SELECT Customer_id, First_name, Last_name, Email, Phone_number, Address FROM Customers
WHERE First_name NOT LIKE 'j%n';
![image](https://github.com/user-attachments/assets/a68def44-b36c-44ed-817d-d477e42f6822)

## List the 5 most expensive menu items. 
SELECT Item_name, Price FROM Menu_Item ORDER BY Price DESC LIMIT 5;
![image](https://github.com/user-attachments/assets/d4c8af11-d90a-4764-b07f-5ecc0293de56)

## Retrieve the top 3 customers who placed the highest number of orders 
SELECT Customer_id, COUNT(*)AS OrderCount FROM Orders 
GROUP BY Customer_id ORDER BY COUNT(*) DESC LIMIT 3;
![image](https://github.com/user-attachments/assets/e4697368-6aab-499f-8572-9d7d8519db34)

## Count the total number of orders.alter
SELECT  COUNT(*) AS TotalOrders FROM Orders;
![image](https://github.com/user-attachments/assets/737e725c-b4e3-4fb7-8861-5fa09ad52142)

## Calculate the average price of menu items
SELECT ROUND(AVG(price),2) AS Avg_Price FROM Menu_Item;
![image](https://github.com/user-attachments/assets/cb2c0f60-c823-428a-93e2-47cbeb8bb7aa)

## Calculate the total price of menu items
SELECT SUM(Price)AS TotalPrice FROM Menu_Item;
![image](https://github.com/user-attachments/assets/92331ba3-459e-4576-94bc-e72b3d97645c)

## Group orders by restaurant and calculate total sales per restaurant
SELECT Restaurant_id, SUM(Total_price) AS TotalSales FROM Orders GROUP BY Restaurant_id;
![image](https://github.com/user-attachments/assets/aa5c865d-f7cf-4c98-b702-f1e6ea1e90fb)

## Find restaurants with sales greater than $30.
SELECT Restaurant_id,SUM(Total_price) AS TotalSales FROM Orders 
GROUP BY Restaurant_id HAVING SUM(Total_price)>30;
![image](https://github.com/user-attachments/assets/7bd6f3eb-3e75-4ace-aa72-f7a935ebfd9d)

## List all orders along with the customer and restaurant details using an inner join
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
![image](https://github.com/user-attachments/assets/b4a63045-3783-4b23-8ea7-965f1157db52)

## Fetch all restaurants and include orders (even if they don’t have any orders using LEFT JOIN)
SELECT Restaurants.Restaurant_name,
Restaurants.Cuisine_type,
Orders.Orders_id,
Orders.Total_price
FROM
Restaurants
LEFT JOIN 
Orders ON Restaurants.Restaurant_Id = Orders.Restaurant_Id;
![image](https://github.com/user-attachments/assets/31037712-d23b-498e-b25e-8a2d2a37048c)

## Use RIGHT JOIN to display deliveries, even if agents haven't made any deliveries.
SELECT Delivery_Agents.First_name ,
Deliveries.Delivery_id,
Deliveries.Delivery_status
FROM
Delivery_Agents
RIGHT JOIN
Deliveries ON Delivery_Agents.agent_id = Deliveries.agent_id;
![image](https://github.com/user-attachments/assets/3a425a9a-4a06-4ac9-b146-b5868b6e7709)

## Combine customer and delivery agent names into a single list using UNION.
SELECT First_name FROM Customers 
UNION
SELECT First_name FROM Delivery_Agents
ORDER BY First_name ASC;
![image](https://github.com/user-attachments/assets/d25c72de-2bb3-473a-803c-e718cf99481e)

## Use UNION ALL to include duplicate values from two queries
SELECT First_name FROM Customers 
UNION ALL
SELECT First_name FROM Delivery_Agents
ORDER BY First_name ASC;
![image](https://github.com/user-attachments/assets/4b30c697-1078-4bd4-93b2-7ce4631f76be)

## Use mathematical functions to apply a 10% discount on all menu items
SELECT Item_name ,Price ,ROUND(Price * 0.90,2) AS DISCOUNTED_PRICE FROM menu_item;
![image](https://github.com/user-attachments/assets/35038b72-2d4a-4b0c-925e-8cc11c419fd3)

SELECT Item_name ,Price ,ROUND(Price-(Price * 0.90),2) AS DISCOUNT FROM menu_item;
![image](https://github.com/user-attachments/assets/a2cd83a3-d032-44e0-b2fd-c56a63bcce64)

SELECT *, ROUND(Price -(Price * 0.90),2) AS DISCOUNT,ROUND(Price * 0.90,2) AS DISCOUNTED_PRICE FROM menu_item;
![image](https://github.com/user-attachments/assets/c17ceba9-23b9-4ecc-b45c-08bfd864ce50)

## Convert all customer emails to lowercase using a string function.
SELECT CUSTOMER_ID, FIRST_NAME,LAST_NAME,EMAIL,LOWER(EMAIL) AS NORMALIZED_EMAIL,PHONE_NUMBER,ADDRESS FROM CUSTOMERS;
![image](https://github.com/user-attachments/assets/c228e859-477a-4caa-ab09-ebfa12d23790)

## Replace function
SELECT EMAIL, REPLACE(EMAIL,"EXAMPLE","GMAIL") AS REPLACED_MAIL FROM CUSTOMERS;
![image](https://github.com/user-attachments/assets/a7828e01-ee00-4924-b2c4-6ab066e254a7)

## Upper Function
SELECT UPPER(FIRST_NAME) AS FIRSTNAME, UPPER(LAST_NAME)AS LASTNAME FROM CUSTOMERS; 
![image](https://github.com/user-attachments/assets/0b649ae2-5c97-499e-8900-a30af3625a09)

## Calculate the duration between order date and delivery date 
# DATEDIFF()  
SELECT Delivery_id , DATEDIFF(Delivery_date, Orders_date) AS Duration_in_days FROM Deliveries1;
![image](https://github.com/user-attachments/assets/0d1eb3ae-7a0e-44da-b8a0-55447918897c)

#TIMESTAMPDIFF()
SELECT Delivery_id,TIMESTAMPDIFF(HOUR, Orders_date, Delivery_date) AS Duration_in_Hours FROM Deliveries1;
![image](https://github.com/user-attachments/assets/f091dced-9d8d-4cdc-a89d-e2c869b6943e)





