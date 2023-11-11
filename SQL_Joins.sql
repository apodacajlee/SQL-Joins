/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT p.Name AS Product, c.Name AS Category
FROM Products AS p
INNER JOIN Categories AS c
ON p.CategoryID = c.CategoryID
WHERE c.Name = "Computers";

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT p.Name AS Product, p.Price AS Price, r.Rating AS Rating
FROM Products AS p
INNER JOIN Reviews AS r
ON p.ProductID = r.ProductID
WHERE r.Rating = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT CONCAT(e.FirstName, " ", e.LastName) AS Name, SUM(s.Quantity) AS Total
FROM Employees AS e
INNER JOIN Sales AS s
ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
ORDER BY Total DESC
LIMIT 1;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.Name AS Department, c.Name as Category
FROM Departments as d
INNER JOIN Categories as c
ON c.DepartmentID = d.DepartmentID
WHERE c.Name = "Appliances" OR c.Name = "Games";

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT 
	p.Name AS Name, 
    SUM(s.Quantity) AS TotalQuantity,
    SUM(s.PricePerUnit * s.Quantity) AS TotalPriceSold
FROM 
	Products AS p
	INNER JOIN Sales AS s
	ON p.ProductID = s.ProductID
WHERE p.Name = "Eagles: Hotel California";

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT
	p.Name AS ProductName,
    r.Reviewer AS ReviewerName,
    r.Rating AS Rating,
    r.Comment AS Comment
FROM
	Products AS p
    INNER JOIN Reviews AS R
    ON p.ProductID = r.ProductID
WHERE
	p.Name = "Visio TV"
ORDER BY r.Rating ASC
LIMIT 1;
    

-- ------------------------------------------ Extra - May be difficult

/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */

-- Challenge Accepted!
SELECT
	e.EmployeeID AS EmployeeID,
    CONCAT(e.FirstName, " ", e.LastName) AS Name,
    p.Name AS ProductName,
    s.Quantity AS QuantitySold
FROM
	Employees AS e
    INNER JOIN Sales AS s
		ON e.EmployeeID = s.EmployeeID
	INNER JOIN Products AS p
		ON p.ProductID = s.ProductID
ORDER BY
	e.EmployeeID;
	