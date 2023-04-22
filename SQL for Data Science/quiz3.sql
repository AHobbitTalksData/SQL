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
