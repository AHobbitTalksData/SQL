-- ER diagram: https://ucde-rey.s3.amazonaws.com/DSV1015/ChinookDatabaseSchema.png 
--------------------------------------------------------------------------------------------------------------

-- Q1)  Find all the tracks that have a length of 5,000,000 milliseconds or more. 

SELECT COUNT(TrackId)
FROM TRACKS
WHERE Milliseconds >= 5000000;

/* How many tracks are returned?

R/ 2 */

--------------------------------------------------------------------------------------------------------------

-- Q2)  Find all the invoices whose total is between $5 and $15 dollars.

SELECT InvoiceID, Total
From Invoices
WHERE Total BETWEEN 5 AND 15;

-- Also 

SELECT InvoiceID,Total
FROM Invoices
WHERE Total > 5 AND Total < 15;

/* While the query in this example is limited to 10 records, running the query correctly will indicate how many total records there 
are - enter that number below.

R/ 168 */

--------------------------------------------------------------------------------------------------------------
-- Q3)   Find all the customers from the following States: RJ, DF, AB, BC, CA, WA, NY.

SELECT FirstName, LastName, Company, State
FROM Customers
WHERE State IN ('RJ','DF','AB','BC','CA','WA','NY');

/* What company does Jack Smith work for?

R/ Microsoft */

--------------------------------------------------------------------------------------------------------------
-- Q4)   Find all the invoices for customer 56 and 58 where the total was between $1.00 and $5.00.

SELECT CustomerId, InvoiceId, Total, InvoiceDate
FROM Invoices
WHERE CustomerID IN (56,58) AND 
Total BETWEEN 1 AND 5;

/* What was the invoice date for invoice ID 315?

R/ 2012-10-27 */ 

--------------------------------------------------------------------------------------------------------------
-- Q5)    Find all the tracks whose name starts with 'All'.

SELECT TrackId, Name
FROM Tracks
WHERE Name LIKE 'All%';

/* While only 10 records are shown, the query will indicate how many total records there are for this query - enter that number below.

R/ 15 */ 

--------------------------------------------------------------------------------------------------------------
-- Q6)    Find all the customer emails that start with "J" and are from gmail.com.

SELECT CustomerId, Email
FROM Customers
WHERE Email LIKE "J%@gmail.com";

/* Enter the one email address returned (you will likely need to scroll to the right) below.
R/ jubarnett@gmail.com */ 

--------------------------------------------------------------------------------------------------------------
-- Q7)    Find all the invoices from the billing city Brasília, Edmonton, and Vancouver and sort in descending order by invoice ID.

SELECT InvoiceId, BillingCity, Total
FROM Invoices
WHERE BillingCity IN ('Brasilia','Edmonton','Vancouver')
ORDER BY InvoiceId DESC;

/* What is the total invoice amount of the first record returned? Enter the number below without a $ sign.

R/ 13.86 */ 

--------------------------------------------------------------------------------------------------------------
/* Q8)   Show the number of orders placed by each customer (hint: this is found in the invoices table) and sort 
the result by the number of orders in descending order. */ 

SELECT CustomerId, COUNT(*) AS Orders
FROM Invoices
GROUP BY CustomerId
ORDER BY Orders DESC;

/* What is the number of items placed for the 8th person on this list? Enter that number below.

R/ 7 */ 

--------------------------------------------------------------------------------------------------------------
-- Q9)    Find the albums with 12 or more tracks.

SELECT AlbumId, Count(*) AS Number_tracks
FROM Tracks
GROUP BY AlbumId
HAVING COUNT (*) >= 12;

/* While the number of records returned is limited to 10, the query, if run correctly, will indicate how many total records there are. 

R/ 158 */ 

