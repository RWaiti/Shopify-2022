Question 2: For this question you’ll need to use SQL. Follow this link to access the data set required for the challenge. Please use queries to answer the following questions. Paste your queries along with your final numerical answers below.

a) How many orders were shipped by Speedy Express in total?
SELECT count(*) FROM Orders
WHERE ShipperID = 1


b) What is the last name of the employee with the most orders?
SELECT LastName FROM Employees
INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY LastName
ORDER BY count(*) DESC
    LIMIT 1;


c) What product was ordered the most by customers in Germany?
SELECT * FROM Products
WHERE ProductID IN (SELECT OrderDetails.ProductID FROM Customers
					INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
					INNER JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
					WHERE Country = "Germany"
					GROUP BY OrderDetails.ProductID
                    ORDER BY sum(OrderDetails.Quantity) DESC
						LIMIT 1);