-- ER Diagram: https://ucde-rey.s3.amazonaws.com/DSV1015/ChinookDatabaseSchema.png

---------------------------------------------------------------------------------

-- Q1) Pull a list of customer ids with the customer’s full name, and address, along with combining their city and country together. Be sure to make a space in between these two and make it UPPER CASE. (e.g. LOS ANGELES USA)

SELECT CustomerId,FirstName,LastName, Address,
UPPER(City || ' ' || Country) as CityCountry 
FROM Customers
WHERE CustomerId=16;

/* What is the city and country result for CustomerID 16?
MOUNTAIN VIEW USA */

---------------------------------------------------------------------------------

-- Q2) Create a new employee user id by combining the first 4 letters of the employee’s first name with the first 2 letters of the employee’s last name. Make the new field lower case and pull each individual step to show your work.

SELECT FirstName,LastName,
LOWER(substr(FirstName,1,4) || substr(LastName,1,2)) as NewId
FROM Employees
WHERE FirstName like "Robert" and LastName like "King";

/* What is the final result for Robert King?
robeki */

---------------------------------------------------------------------------------

-- Q3) Show a list of employees who have worked for the company for 15 or more years using the current date function. Sort by lastname ascending.

SELECT LastName,HireDate,strftime('%Y',HireDate) AS year,
2019-strftime('%Y',HireDate) AS HireYear
FROM Employees
ORDER BY LastName ASC;

/* What is the lastname of the last person on the list returned?
Peacock */

---------------------------------------------------------------------------------

-- Q4) Profiling the Customers table, answer the following question.

SELECT *
FROM  Customers;

/* Are there any columns with null values? Indicate any below. Select all that apply.
Company, Fax */ 

---------------------------------------------------------------------------------

-- Q5) All of the questions in this quiz refer to the open source Chinook Database. Please familiarize yourself with the ER diagram in order to familiarize yourself with the table and column names in order to write accurate queries and get the appropriate answers.
--Find the cities with the most customers and rank in descending order.

SELECT City,CustomerId,count(CustomerId) AS Count
FROM Customers
GROUP BY City
HAVING Count=2;

/* Which of the following cities indicate having 2 customers?
London, Mountain View, São Paulo */

---------------------------------------------------------------------------------

-- Q6) Create a new customer invoice id by combining a customer’s invoice id with their first and last name while ordering your query in the following order: firstname, lastname, and invoiceID.

SELECT a.FirstName,a.LastName,a.InvoiceId,
a.FirstName || a.LastName || a.InvoiceId AS NewInvoiceId
FROM
(SELECT i.InvoiceId,c.FirstName,c.LastName
FROM Invoices AS i
left join Customers AS c
ON i.CustomerId=c.CustomerId) AS a
WHERE a.FirstName like "Astrid";

/* Select all of the correct "AstridGruber" entries that are returned in your results below. Select all that apply.
AstridGruber370, AstridGruber273, AstridGruber296 





