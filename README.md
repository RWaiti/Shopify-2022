# Shopify-2022

## **Question 1: Given some sample data, write a program to answer the following:**

### *On Shopify, we have exactly 100 sneaker shops, and each of these shops sells only one model of shoe. We want to do some analysis of the average order value (AOV). When we look at orders data over a 30 day window, we naively calculate an AOV of $3145.13. Given that we know these shops are selling sneakers, a relatively affordable item, something seems wrong with our analysis.*

## CODE + ANSWER [LINK](https://github.com/RWaiti/Shopify-2022/blob/main/question1.ipynb)

### a) Think about what could be going wrong with our calculation. Think about a better way to evaluate this data.

 We can see is that the AOV was calculated using the total amount of sales, not the total amount of sold shoes.

### b) What metric would you report for this dataset?

- Which stores sold the most shoes

- Which stores earned the most

- Most used payment methods

- Weekday with the biggest sales

### c) What is its value?

AOV = $357.92

  
## Question 2: For this question you’ll need to use SQL. Follow this link to access the data set required for the challenge. Please use queries to answer the following questions. Paste your queries along with your final numerical answers below.

## CODE + ANSWER [LINK](https://github.com/RWaiti/Shopify-2022/blob/main/question2.sql)

### a) How many orders were shipped by Speedy Express in total?
```
SELECT count(*) FROM Orders
WHERE ShipperID = 1
```
### b) What is the last name of the employee with the most orders?
```
SELECT LastName FROM Employees
INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY LastName
ORDER BY count(*) DESC
    LIMIT 1;
```

### c) What product was ordered the most by customers in Germany?
```
SELECT * FROM Products
WHERE ProductID IN (SELECT OrderDetails.ProductID FROM Customers
                    INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
                    INNER JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
                    WHERE Country = "Germany"
                    GROUP BY OrderDetails.ProductID
                    ORDER BY sum(OrderDetails.Quantity) DESC
                        LIMIT 1);
```