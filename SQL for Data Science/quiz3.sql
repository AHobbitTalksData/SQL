-- ER DIAGRAM: https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/UAPENoOVEei4RQ5L9j9nDA_5042a1f0839511e8beb2b5b4ae9fa29a_ER-Diagram.png?expiry=1682294400000&hmac=6yLqpgYkcntg5yvrWIQgPh0-GIHTEWSRRwWKbyKlKCg

----------------------------------------------------------------------------------------------------------------

-- Q1) How many albums does the artist Led Zeppelin have? R/ 14

SELECT COUNT(AlbumID)
FROM albums
WHERE ArtistID IN (SELECT ArtistID
    FROM artists
    WHERE ArtistID = "22");
    
----------------------------------------------------------------------------------------------------------------

-- Q2) Create a list of album titles and the unit prices for the artist "Audioslave". How many records are returned? R/ 40

SELECT tracks.UnitPrice, tracks.AlbumID 
FROM tracks
INNER JOIN albums ON tracks.AlbumID = albums.AlbumID
INNER JOIN artists ON albums.ArtistID = artists.ArtistID
WHERE artists.Name = 'Audioslave';

----------------------------------------------------------------------------------------------------------------

-- Q3) Find the first and last name of any customer who does not have an invoice. 
-- Are there any customers returned from the query? R/ Yes 

SELECT customers.FirstName, customers.LastName 
FROM Customers
INNER JOIN invoices ON customers.CustomerID = Invoices.CustomerID
WHERE invoices.InvoiceID IS NULL;

----------------------------------------------------------------------------------------------------------------

-- Q4) Find the total price for each album. What is the total price for the album “Big Ones”? R/ 14.85

SELECT SUM(tracks.UnitPrice), albums.AlbumID, albums.Title
FROM tracks
INNER JOIN albums ON tracks.AlbumID = albums.AlbumID
INNER JOIN artists ON albums.ArtistID = artists.ArtistID
WHERE albums.Title = 'Big Ones'
GROUP BY albums.AlbumID, albums.Title;

----------------------------------------------------------------------------------------------------------------

-- Q5) How many records are created when you apply a Cartesian join to the invoice and invoice items table?
-- Only 25 records will be shown in the output so please look at the bottom of the output to see how many records were retrieved. R/ 922880 

SELECT COUNT(*)
FROM invoices
CROSS JOIN invoice_items


